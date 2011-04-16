/**
* A service layer that handles all the message User registry operations
*/
component output="false" singleton{
	
	registryService function init() output=false{
		return this;
	}
	
User function getUser(userID="") output=false{
		if( len(arguments.userID) ){
			var user = entityLoad("User",arguments.userID,true);
			if(NOT isNull(users) ){
				return user;
			}
		}		
		return entityNew("User");
	}
	
		void function save(User user) output=false{
		transaction {
			entitySave(arguments.user);
		}
	}
}