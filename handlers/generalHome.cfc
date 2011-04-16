/*
*  Homepage handler
*/
component extends="coldbox.system.EventHandler" output="false"{

	void function index(event) output=false{
	
	var rc = event.getCollection();
	event.setView("homepage");

	}
	

void function admin(event) output=false{
	

	var rc = event.getCollection();
	//writedump(var=rc, abort="true");
	rc.admin = true;
	rc.pagetitle="Guestbook - Administrators Use";
	event.setView("homepage");

	}
	

function author(event) output=false{
	var rc = event.getCollection();
	rc.author = "true";
	rc.pagetitle="Guestbook - Authors View";
	event.setView("homepage");
	}
	
}