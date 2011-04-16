<cfcomponent name="generalTest" extends="coldbox.system.testing.baseTestCase" output="false">
	
        <cfscript>
	//Uncomment the following if you dont' need the controller in application scope for testing.
	//this.PERSIST_FRAMEWORK = false;
	</cfscript>

	<cffunction name="setUp" returntype="void" access="public" output="false">
		<cfscript>

			
		//Call the super setup method to setup the app.
		super.setup();
		
		//EXECUTE THE APPLICATION START HANDLER: UNCOMMENT IF NEEDED AND FILL IT OUT.
		//getController().runEvent("main.onAppInit");

		//EXECUTE THE ON REQUEST START HANDLER: UNCOMMENT IF NEEDED AND FILL IT OUT
		//getController().runEvent("main.onRequestStart");
		</cfscript>
	</cffunction>
	
	<cffunction name="testindex" access="public" returntype="void" output="false">
		<cfscript>
		var event = "";
		
		//Place any variables on the form or URL scope to test the handler.
		//FORM.name = "luis"
		event = execute("general.index");
		event = execute("registry.register");
		
		
		debug(event.getCollection());
		
		//Do your asserts below
		assertEquals("Welcome to ColdBox!", event.getValue("welcomeMessage",""), "Failed to assert welcome message");
			
		</cfscript>
	</cffunction>
	
	<cffunction name="testdoSomething" access="public" returntype="void" output="false">
		<cfscript>
		var event = "";
		
		//Place any variables on the form or URL scope to test the handler.
		//FORM.name = "luis"
		event = execute("general.doSomething");
		
		debug(event.getCollection());
			
		//Do your asserts below for setnextevent you can test for a setnextevent boolean flag
		assertEquals("general.index", event.getValue("setnextevent",""), "Relocation Test");
			
		</cfscript>
		
	</cffunction>
	
</cfcomponent>