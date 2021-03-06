<cfcomponent name="ehSecurity" extends="coldbox.system.EventHandler" output="false" autowire="true">
	
	<cfproperty name="security" inject>

	
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="controller" type="any">
		<cfset super.init(arguments.controller)>
		<cfreturn this>
	</cffunction>

	<cffunction name="autologin" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		
		<cfset var rc = event.getCollection()>
		<cfparam name ="matchUserName" default ="False">
		<cfparam name ="session.userType" default="author">
		
		
		<cfset UsersList = EntityLoad("User")>
		<cfif arraylen(UsersList) eq 0>
		 <cfset session.userType = "admin">
		 <cfelse>
		 	<cfloop from ="1" to = "#arraylen(UsersList)#" index="i">
		 	     	
			<cfif session.cgiUser eq UsersList[i].getuserName()>
			<cfset matchUserName = "True">
			<cfswitch expression="#UsersList[i].getUserType()#">
				<cfcase value="Admin">
					<cfset session.userType = "admin">
					<cfset setNextEvent('generalHome/admin')>
				</cfcase>
				<cfcase value="author">
					<cfset session.userType = "author">
					<cfset setNextEvent('generalHome.author')>
				</cfcase>
			</cfswitch>
		<cfelse>
		     <cfset matchUserName = "False">
	    </cfif>
		</cfloop>
		 	
		 	
		</cfif>
		
        
		<cfif matchUserName eq "False">
		
		
		<cfset setNextEvent('registry.register')>
			
		</cfif>
		
	</cffunction>

	<cffunction name="doLogin" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		
		<!--- Process login --->
		<cfif Security.isUserVerified(username:Event.getValue('username',''),password:Event.getValue('password',''))>
			<!--- Which redirect? --->
			<cfset userObject = entityLoad("User",Security.getUserSession())>
		
			 <cfswitch expression="#userObject[1].getUserType()#">
				<cfcase value="Admin">
					<cfset setNextEvent('generalHome.admin')>
				</cfcase>
				<cfcase value="author">
					<cfset setNextEvent('generalHome.author')>
				</cfcase>
			</cfswitch>
		<cfelse>		
			<cfset setNextEvent('ehSecurity.dspLogin')>
		</cfif>
		
	</cffunction>

	<cffunction name="doLogoff" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<!--- Process logoff --->
		<cfset securityManager.deleteUserSession()>
		<cfset setNextEvent('home')>
	</cffunction>
	
</cfcomponent>