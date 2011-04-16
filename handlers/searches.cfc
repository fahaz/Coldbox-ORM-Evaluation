/*
*  Search handler
*/
component extends="coldbox.system.EventHandler" output="false"{

	property name="entryService" inject;


function index(event) output=true{
		var rc = event.getCollection();
		
			
	if(rc.submit eq "Get Current Weather"){
		event.setView("soaps/weather");
		
	}
	
	if(rc.submit eq "Full Text Search"){
		rc.search = entryService.search(event.getValue("searchText",""));
		event.setView("search");
	}
	
}
	



	
	
}