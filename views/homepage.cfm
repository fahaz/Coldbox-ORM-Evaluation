<cfparam name="rc.author" default="false">
<cfparam name="rc.admin" default="false">
<cfset baseURL="/index.cfm">

<cfoutput>
<h3>Guestbook Homepage</h3>

<cfinclude template="/includes/topbar.cfm">


<p><a href="#getSetting('sesBaseURL')#/entries/editor">1. Create New message </a></p>
<p><a href="#getSetting('sesBaseURL')#/entries">2. Guestbook Entries List </a></p>
<cfif rc.author eq "true">
<p><a href="#getSetting('sesBaseURL')#/entries/authorview">3. #rc.pagetitle# </a></p>
<cfelseif rc.admin eq "true">
<p><a href="#getSetting('sesBaseURL')#/entries/adminview">3. #rc.pagetitle# </a></p>
</cfif>



</cfoutput>