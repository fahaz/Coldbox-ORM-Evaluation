<cfoutput>

<h3>#rc.pageTitle#</h3>

<cfinclude template="/includes/topbar.cfm">
<cfif flash.exists("message")>
	<div id="infobox">#flash.get("message")#</div>
</cfif>

<a href="#getSetting('sesBaseURL')#/entries/editor">Create Message</a>

<br/><br/>
<cfset count = 0>
<cfloop array="#rc.entries#" index="entry">
<cfset count = count + 1>


<table border="0" width="42%">
 <tr><td width=50%><b><font color="blue">#rc.entries[count].getUser().getFirstName()# #rc.entries[count].getUser().getLastName()#</font></b></td><td width=50%>#DateFormat(rc.entries[count].getTime(),"mmmm d, yyyy")# at #TimeFormat(rc.entries[count].getTime(), "hh:mm tt")# AST</td></tr>
 <tr><td width=50%>#rc.entries[count].getTitle()#</td>


<cfif (rc.entries[count].getuser().getuserName() EQ session.cgiUser) or (session.userType eq "admin")>
<td width="50%" align="right"><a href="#getSetting('sesBaseURL')#/entries/editor/entry_id/#entry.getEntry_ID()#">edit|</a><a href="#getSetting('sesBaseURL')#/entries/remove/entry_ID/#entry.getEntry_ID()#" onClick="return confirm('Really Delete Entry?')">delete</a></td>
</cfif>
</tr>

</table>


<table width="40%" border=0>
<tr><td><label>#entry.getEntryBody()#</label></td></tr>
<tr>
</table>


</cfloop>


</table>

</cfoutput>