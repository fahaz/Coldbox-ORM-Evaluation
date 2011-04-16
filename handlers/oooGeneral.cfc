<cfcomponent name="General" extends="coldbox.system.eventhandler" output="false">

<cffunction name="index" access="public" returntype="void" output="false">
	<cfargument name="Event">
	<---  Do Your Logic Here to prepare a view --->
	<cfset Event.setValue("welcomeMessage","Welcome to ColdBox!")>	
        <---  Set the View To Display, after Logic --->
	<cfset Event.setView("home")>
</cffunction>
	
<cffunction name="doSomething" access="public" returntype="void" output="false">
	<cfargument name="Event" type="coldbox.system.beans.requestContext">
	<---  Do Your Logic Here, call to models, etc.--->

	<---  Set the next event to run, after Logic, this relocates the browser--->
	<cfset setNextEvent("General.dspSomething")>
</cffunction>

</cfcomponent>