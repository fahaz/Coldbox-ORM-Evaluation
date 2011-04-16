<cffunction name="authADUser" returnType="query">
<cfargument name="UserID" type="string" required="false" default="0">
<cfargument name="Passwd" type="string" required="false" default="0">

<cfset var newQueryObject = queryNew("ExchangeHost,MailBoxName") />
<cfset ExchangeHost = "webmail.yourcompany.com">
<CFTRY>

<cfexchangeConnection
 action="open"
 username="#lcase(UserID)#"
 password="#Passwd#"
 server="#ExchangeHost#"
 protocol="https"
 connection="exchangeConnection">


 <cfset queryAddRow(newQueryObject, 1) />
 <cfset querySetCell(newQueryObject, "ExchangeHost", ExchangeHost) />
 <cfset querySetCell(newQueryObject, "MailBoxName", lcase(UserID)) />


 <cfexchangeConnection
  action="close"
  connection="exchangeConnection">

 <CFCATCH>
 </CFCATCH>
</CFTRY>

<cfreturn newQueryObject>

</cffunction>