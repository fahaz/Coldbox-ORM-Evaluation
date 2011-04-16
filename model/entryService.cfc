/**
* A service layer that handles all the message entry operations
*/
component output="false" singleton{
	
	EntryService function init() output=false{
		return this;
	}
	

	function Search(searchText) output=false{
	
		rc.searchresults = ORMExecuteQuery("from entry where entrybody LIKE '%#searchText#%' OR title LIKE '%#searchText#%'");
		return rc.searchresults;		
		}
	

	
Entry function getEntry(entry_ID="") output=false{
		if( len(arguments.entry_ID) ){
			var entry = entityLoad("Entry",arguments.entry_ID,true);
			if(NOT isNull(entry) ){
				return entry;
			}
		}		
		return EntityNew("Entry");
	}
	
	
	void function save(Entry entry) output=false{
	
	
		//arguments.entry.user = arrayNew(1);
		// arguments.entry.user[1] = session.user;
		//writedump(var=arguments.entry, abort="true");
	    
		transaction {
			entitySave(arguments.entry);
			
		}
	}
	
	void function remove(entry_ID) output=false{
		transaction{
			// get entry
			var entry = getEntry(entry_ID);
			if( NOT isNull(entry.getEntry_ID()) ){
				entityDelete(entry);
			}
		}
	}
	
	any function findAll(isCompleted=false,boolean asQuery=false) output=false{
		var results = entityLoad("Entry",{}, "time desc");
		
		if( arguments.asQuery ){ return entityToQuery(results); }
		
		return results;
	}
}
