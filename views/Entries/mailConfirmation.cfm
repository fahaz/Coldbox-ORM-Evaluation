<cfmail from="#session.cgiUser#@cdp.com" to="faheem.khan@conyersdillandpearman.com" subject="#rc.subject#">
	#rc.msgBody#	
</cfmail>

<cfinclude template="/includes/topbar.cfm">
<cfoutput>
<cfif flash.exists("message")>
	<div id="infobox">#flash.get("message")#</div>
</cfif>
</cfoutput>