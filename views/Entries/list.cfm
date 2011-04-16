<cfoutput>

	
<h3>Guestbook Entries List By Title</h3>

<cfinclude template="/includes/topbar.cfm">
<cfif flash.exists("message")>
	<div id="infobox">#flash.get("message")#</div>
</cfif>

<a href="#event.buildLink('entries.editor')#">Create A New Message</a> 

<br/><br/>

<font color="red">The following are the Items posted to this guestbook:</font>

<cfset count = 0>
<table border="0" width="42%"><tr><th>Message Title</th><th>Date Posted</th></tr>
<cfloop array="#rc.entries#" index="entry">
	<cfset count=count+1>

 <tr><td width=50%><a href="#event.buildLink('entries.editor.entry_ID.' & entry.getEntry_ID())#">#rc.entries[count].getTitle()#</a></td>
	 <td>#DateFormat(rc.entries[count].getTime(),"mmmm d, yyyy")# at #TimeFormat(rc.entries[count].getTime(), "hh:mm tt")# AST</td></tr>
</cfloop>
</table>



</cfoutput>