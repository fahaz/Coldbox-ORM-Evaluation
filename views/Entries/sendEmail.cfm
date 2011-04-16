<h3>Send Email/Suggestions</h3>
<cfinclude template="/includes/topbar.cfm">

<cfoutput>
<form action="#event.buildlink('entries.mailConfirmation')#" method="post" name="mailForm">
<table border=0>
<tr><td>
<label for="subject">Subject: </label></td>
<td>
<input type="text" name="subject" id="subject" size="40" value="">
</td></tr>

<tr><td>
<label for="message">Message: </label></td><td>
<textarea name="msgBody" id="msgBody" rows="5" cols="50"></textarea>
</td></tr>
</table>

<input type ="submit" value="Send Email">

</form>

</cfoutput>