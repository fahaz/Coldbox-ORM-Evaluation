
<cfoutput>
<h3>Guestbook - Full Text Search</h3>

<cfinclude template="/includes/topbar.cfm">

<cfif isDefined("rc.search")>
<cfset count=0>
<cfloop array="#rc.search#" index="search">
<cfset count = count + 1>
<table border="0" width="44%">
 <tr><td width=50%><b><font color="blue">#rc.search[count].getUser().getFirstName()# #rc.search[count].getUser().getLastName()#</font></b></td><td width=50%>#DateFormat(rc.search[count].getTime(),"mmmm d, yyyy")# at #TimeFormat(rc.search[count].getTime(), "hh:mm tt")# AST</td>
 <tr><td>#rc.search[count].getTitle()#</td>
<cfif (rc.search[count].getuser().getuserName() EQ session.cgiUser) or (session.userType eq "admin")>
<td align="right"><a href="#event.buildLink('entries.editor.entry_ID.' & search.getEntry_ID())#">edit|</a><a href="#event.buildLink('entries.remove')#/entry_ID/#search.getEntry_ID()#" onClick="return confirm('Really Delete Entry?')">delete</a></td></td>
</cfif>
</tr>
</table>
<table width="40%">
<tr><td><label>#rc.search[count].getEntryBody()#</label></td></tr>

</table>

</cfloop>


</table>
</cfif>
</cfoutput>