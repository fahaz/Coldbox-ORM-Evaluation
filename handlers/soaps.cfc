/*
*  Search handler
*/
component extends="coldbox.system.EventHandler" output="false"{

	void function index(event) output=false{
	var rc = event.getCollection();
	event.setView("soaps/weather");

	}
	

	
}