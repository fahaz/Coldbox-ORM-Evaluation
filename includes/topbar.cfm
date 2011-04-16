<cfoutput>
<form action="#getSetting('sesBaseURL')#/searches" method="post">

<table border="0" bgcolor="0087dd" width="70%">
<tr>
<td><a href="#getSetting('sesBaseURL')#/ehsecurity/autologin"><font color="white">|Home|</font></a></td>
<td><b><font color="ffffff">Zip:</b><input type="text" name="zipcode" id="zipcode"></td><td><input type="submit" name="submit" value="Get Current Weather" name="zipcode" /></td>
</td><td><input type="text" name="searchText"></td><td><input type="submit" name="submit" value="Full Text Search" name="search"/></td>

</tr>
</table>
</form>

</cfoutput>