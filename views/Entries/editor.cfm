<cfoutput>
<h3>Guestbook - Create New Message</h3>



<cfinclude template="/includes/topbar.cfm">

<form action="#getSetting('sesBaseURL')#/entries/save" method="post" name="editorForm">

<input type="hidden" name="entry_ID" id="entry_ID" value="#rc.entry.getEntry_ID()#" />

<table border=0>
<tr><td>
<label for="subject">Subject: </label></td>
<td>
<input type="text" name="title" id="title" size="40" value="#rc.entry.getTitle()#">
</td></tr>

<tr><td>
<label for="message">Message: </label></td><td>
<textarea name="EntryBody" id="EntryBody" rows="5" cols="50">#rc.entry.getEntryBody()#</textarea>
</td></tr>
</table>
<hr/>
<input type="submit" value="create" />
</form>

</cfoutput>