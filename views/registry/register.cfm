<cfoutput>
<h1>Guestbook - Register User</h1>

[<a href="#event.buildLink('registry')#"><< Go Back</a>]

<h3>Hi there the system has detected that this is the first time you are logging on to the guestbook system.
	Although you have been authenticated as User:<font color="red">#session.cgiUser#</font> to you this system, you must now enter in your First name and password so that
	you can be identified in the future.  Thanks for your co-operation!
</h3>
<form action="#getSetting('sesBaseURL')#/registry/save" method="post" name="registerForm">

<label for="subject">First Name: </label>
<input type="text" name="firstName" id="firstName" size="40" value="">
<br />

<label for="subject">Last Name: </label>
<input type="text" name="lastname" id="lastname" size="40" value="">
<br />
<hr/>
<input type="submit" value="Register" />
</form>

</cfoutput>