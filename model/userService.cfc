/**
* A service layer that handles all the message User operations
*/
component output="false" singleton{
	
	UserService function init() output=false{
		return this;
	}
	
	
User function newUser() output=false{
		
		rc.userName = rc.getCgiUser();
		newUserInfo = EntityNew("User");
		newUserInfo.SetUserName(User);
		entitySave(user);
		
	}

}