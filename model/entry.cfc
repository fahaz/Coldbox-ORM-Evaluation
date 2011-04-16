/**
* Entries Object
*/
component output="false" persistent="true"{
	
	property name="entry_id" fieldType="id" generator="uuid";
	property name="entryBody";
	property name="title" notnull="true" type="string";
	property name="time" fieldtype="timestamp";
	property name="isCompleted" ormType="boolean" dbdefault="0" default="false";
	//property name="userID";
	property name="user" type="User" fieldtype="many-to-one" fkcolumn="userID" cfc="User";

	Entry function init() output=false{
		return this;
	}		
}


