/*
*  registry handler
*/
component extends="coldbox.system.EventHandler" output="false"{


	property name="registryService" inject;

	void function register(event) output=false{
		var rc = event.getCollection();
		
		
		event.setView("registry/register");

	}
	
	
	void function save(event) output=false{
		var rc = event.getCollection();
		rc.username  = "#session.cgiUser#";
		rc.usertype  = "#session.userType#";
   		rc.user = registryService.getUser(event.getValue("UserID",""));

		populateModel(rc.user);
		registryService.save(rc.user);

		if (session.userType eq "admin") {
		flash.put("message","We have registered you with Administrator rights since you are the first user on this database!");
        }
		else {
		flash.put("message","You have been registered with Author rights!");	
		}	
		setNextEvent('entries');
	}
	
}