/**
* Users Object
*/
component output="false" persistent="true"{
	
	property name="userID" type="integer" fieldType="id" generator="increment";
	property name="userName" notnull="true" type="string";
	property name="lastName" notnull="true" type="string";
	property name="firstName" notnull="true" type="string";
	property name="userType" notnull="true" type="string";
	property name="entry" fieldtype="one-to-many" fkcolumn="userID" cfc="entry" cascade="all" inverse="true";
	
	User function init() output=false{
		return this;
	}		
}


