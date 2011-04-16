/*
* An Entries handler
*/
component extends="coldbox.system.EventHandler" output="false"{

	property name="entryService" inject;


void function adminView(event) output=false{
		var rc = event.getCollection();
		rc.entries = entryService.findAll(); 
		rc.users = entityLoad("User");
		event.setView("Entries/Admin/viewEntries");

	}
	
}