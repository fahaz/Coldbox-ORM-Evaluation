<cfinvoke webservice="http://ws.cdyne.com/WeatherWS/Weather.asmx?wsdl" returnvariable="weather" method="GetCityWeatherByZIP">
<cfinvokeargument name="zip" value="#rc.zipcode#"> 

</cfinvoke>
<h3>Current Weather</h3>
<cfinclude template="/includes/topbar.cfm">

<cfoutput>

<p>City: #weather.city#, #weather.state#</p>
<p>Weather Station Location: #weather.WeatherStationCity#</p>
<p>Weather ID: #weather.weatherID#</p>
<p>Description: #weather.Description#</p>
<p>Temperature (F): #weather.Temperature#</p>
<p>Relative Humidity(%): #weather.RelativeHumidity#</p>
<p>Wind: #weather.wind#</p>
<p>Pressure: #weather.pressure#</p>
<p>Visibility: #weather.visibility#</p>
<p>Wind Chill: #weather.windChill#</p>
<p>Remarks: #weather.Remarks#</p>

</cfoutput>