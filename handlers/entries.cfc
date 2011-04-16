/*
* An Entries handler
*/
component extends="coldbox.system.EventHandler" output="false"{

	property name="entryService" inject;
	property name="ehSecurity" inject;

	void function index(event) output=false{
		var rc = event.getCollection();
		var isComplete = false;

		
		
		flash.keep("message");
		rc.entries = entryService.findAll(); 
		rc.users = entityLoad("User");
		event.setView("Entries/list");

	}


void function suggestions(event) output=false{
		var rc = event.getCollection();
		
		event.setView("Entries/sendEmail");

	}
	
	void function mailConfirmation(event) output=false{
		var rc = event.getCollection();
		
		event.setView("Entries/mailConfirmation");
		flash.put("message","Your Email suggestion has been sent successfully to the site administrator!");

	}


void function adminView(event) output=false{
		var rc = event.getCollection();
		
		if (isDefined("session.userType")and(session.userType eq "admin")){
			rc.PageTitle = "Guestbook - Administrators";
			}
			
		else if(isDefined("session.userType")and(session.userType eq "author")){
			rc.PageTitle = "Guestbook - Authors View";
		}
		
		
		else { setNextEvent('ehsecurity.autologin');
		
		}
		
			rc.entries = entryService.findAll(); 
			rc.users = entityLoad("User");
			event.setView("Entries/Admin/viewEntries");

	}


	void function remove(event) output=false{
		var rc = event.getCollection();

		entryService.remove(event.getValue("entry_ID",""));

		flash.put("message","Entry removed sucessfully!");

		setNextEvent('entries');
	}

	void function editor(event) output=false{
		var rc = event.getCollection();

		/*
		if( event.valueExists("entry_ID") ){
			rc.entry = entryService.get(rc.entry_ID);
		}
		else{
			rc.entry = entryService.new();
		}
		*/
		rc.entry = entryService.getEntry(event.getValue("entry_ID",""));

		event.setView("Entries/editor");
	}
	

	void function save(event) output=false{
		
		 
		
		var rc = event.getCollection();
		//rc.userID = session.user;
		
		rc.userCollection = EntityLoad("user", {userName=session.cgiUser});
		rc.userID = rc.userCollection[1].getUserID();
		
		
		/*
		if( len(event.getTrimValue("entry_ID")) ){
			rc.entry = entryService.get(rc.entry_ID);
		}
		else{
			rc.entry = entryService.new();
		}
		*/
		rc.user = EntityLoadByPK("user",rc.userID);
		rc.entry = entryService.getEntry(event.getValue("entry_ID",""));
		
		
		//writedump(var=ent, abort="true");
		
		rc.entry.setUser(rc.user);
		populateModel(rc.entry);
		entryService.save(rc.entry);
		test = entityload("entry");
		//writedump(var=test, abort="true");
		flash.put("message","Message Entry saved sucessfully!");
		setNextEvent('entries');
	}

	void function changeStatus(event) output=false{
		var rc = event.getCollection();

		try{
			rc.entry = entryService.get(event.getValue("entry_ID",""));
			rc.entry.setIsCompleted(rc.completed);
			entryService.save(rc.entry);
			rc.data = {error=false,message="Status Changed!"};
		}
		catch(Any e){
			rc.data = {error=true,message=e.message & e.detail};
		}
		event.renderData(data=rc.data,type="json");
	}




}
