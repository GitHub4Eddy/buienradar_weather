QuickApp BUIENRADAR WEATHER 

This QuickApp can be used as your Fibaro Homecenter 3 Weather Provider (Settings - 6. General - Main - Main Devices - Weather Provider)
The Buienradar Weather QuickApp contains the current Dutch weather measurements, the weather forecast and the 5-day forecast 
The 5-days forecast is shown in the labels and the tomorrow forecast is shown in the child devices 
The current observations are measured by KNMI weather stations spread across The Netherlands and are updated every 10 minutes 
The weather report is updated several times a day by the Buienradar meteorologists 

The QuickApp has child devices for:
- Temperature °C 
- Feel temperature °C 
- Ground temperature °C 
- Humidity % 
- Absolute humidity g/m³
- Airpressure hPa
- Windspeed m/s 
- Windspeed km/h
- Winddirectiondegrees ° (plus wind direction and arrow)
- Windspeed Bft
- Windgusts km/h
- Rain mm/h 
- Rain Last 24h mm
- Sunpower Watt/m²
- Visibility km
- Sunset (time)
- Sunrise (time)
- Sun Chance tomorrow % 
- Min Temp tomorrow °C
- Max Temp tomorrow °C
- Rain Chance tomorrow % 
- Min Rain tomorrow mm/h
- Max Rain tomorrow mm/h
- Wind tomorrow m/s (plus wind direction and arrow)
- Wind tomorrow km/h (plus wind direction and arrow)
  
This QuickApp is plug-and-play. The only thing you can do, is change the Station ID to a weatherstation nearby from the list or add some nice icons to the devices. 

Wind Chill (based on the JAG/TI-method) and is only valid for temperatures between -46 C and +10 C and is only valid for wind speed between 1.3 m/s and 49 m/s
Windspeed is shown in m/s (km/3.6)
Absolute humidity is the measure of water vapor (moisture) in the air, regardless of temperature. It is expressed as grams of moisture per cubic meter of air (g/m3) 
conditionCodes = {unavailable = 3200, clear = 32, rain = 40, snow = 43, storm = 38, cloudy = 30, fog = 20,}
The time shown in the QuickApp, is the last time of the measurement from Buienradar (not the system time)

Changes version 3.0 (23rd March 2022)
 vAdded 5-days forecast to the labels
•	Addded child devices for:
  •	Feel temperature °C 
  •	Ground temperature °C 
  •	Windspeed km/h
  •	Windspeed Bft
  •	Windgusts km/h
  •	Rain Last 24h mm
  •	Sun Chance tomorrow % 
  •	Min Temp tomorrow °C
  •	Max Temp tomorrow °C
  •	Rain Chance tomorrow % 
  •	Min Rain tomorrow mm/h
  •	Max Rain tomorrow mm/h
  •	Wind tomorrow m/s (plus wind direction and arrow)
  •	Wind tomorrow km/h (plus wind direction and arrow)
•	Changed SunPower device type to powerSensor
•	Changed all Wind devices types to windSensor
•	Converted date-times to more nice format
•	Quickapp variable setGlobalVar changed to boolean
•	Added Quickapp variable stationWarning to show a warning (once) if your station hasn't got some weather value (default is true)
•	Optimised some code

Changes version 2.1 (15th January 2021)
•	Added weatherdescription: 
  •	"Mix van opklaringen en hoge bewolking" to conditioncode "cloudy"
  •	"Half bewolkt" to conditioncode "cloudy"
  •	"Opklaring en lokaal nevel of mist" to conditioncode "fog"
  •	"Zwaar bewolkt met lichte sneeuwval" to conditionCode "snow"
  •	"Zwaar bewolkt met regen en winterse neerslag" to conditioncode "snow"
  •	"Afwisselend bewolkt met lichte sneeuwval" to conditioncode "snow"
  •	"Zware sneeuwval" to conditioncode "snow"
  •	"Opklaringen en kans op enkele pittige (onweers)buien" to conditioncode "rain"
•	Added Airpressure Text in log of Airpressure Child Device

Changes version 2.0 (3rd January 2021)
•	Added Child Devices for: 
  •	Temperature °C (including feeltemperature and groundtemperature) 
  •	Humidity % 
  •	Absolute humidity g/m³
  •	Airpressure hPa
  •	Windspeed m/s (including windspeedBft and Windgust km/h)
  •	Winddirectiondegrees ° (including winddirection and arrow)
  •	Rain mm/h (including rainFallLast24Hour mm)
  •	Sunpower watt/m²
  •	Visibility km
  •	Sunset (time)
  •	Sunrise (time)
•	Re-arranged the labels
•	Added backup station functionality for weather stations that don't have all the data, the data from 6260 Meetstation De Bilt is used. 
•	Improved check for missing data
•	Added Quickapp variable for debug level (1=some, 2=few, 3=all). Recommended default value is 1.

Changes version 1.0 (25th October 2020)
•	Added weatherdescription "Zwaar bewolkt met wat lichte regen" to conditionCode "rain"

Changes version 0.6 (9th September 2020)
•	Changed conditionCodes storm = 38, snow = 43 and unknown = unavailable
•	Added weatherdescription "Afwisselend bewolkt met (mogelijk) wat lichte regen" to conditionCode "rain" and and "Afwisselend bewolkt met lokaal mist(banken)" to conditionCode "fog"

Changes version 0.5 (4th September 2020)
•	Added wind direction, air pressure and feel temperature to QuickApp labels
•	Changed stationname to regio in labels and log
•	Changed the names of the Global Variables to meet the Fibaro standards and shortened them (please manually delete your old ones and change the names in your scenes)
•	Added an extra check for response of Buienradar (jsonTable)

Changes version 0.4 (23rd August 2020) 
•	Completely renewed code
•	Several Global Variables are available for personal use
•	Addes QuickApp variable SetGlobalVar true or false, whether you want to use the Global Variables
•	Added QuickApp variable Timeout for finetuning waiting for response

Changes version 0.3 (11th August 2020)
•	Error message instead of debug message in case of an error
•	Changed method of adding QuickApp variables, so they can be edited

QuickApp Variables mandatory (automatically created):
•	interval = Number in seconds to update the data (defaul = 601)
•	timeout = Number in seconds to wait for a response (default = 5)
•	stationID = Number of the station you want to use for weather measurements (default = 6260 Meetstation De Bilt)
•	backupstationID = Number of the backup station for missing weather data from stations that don't have all the data (default = 6260 Meetstation De Bilt). Don't change this ID unless you know what you are doing, 
•	setGlobalVar = true or false, whether you want tu use the Global Variables (default = false)
•	stationWarning = true or false, whether you want to receive warnings if your station hasn't got some weather value (default is true)
•	debugLevel = Number (1=some, 2=few, 3=all) (default = 1)

Station ID's and Stations: 
6391 Meetstation Arcen / 6275 Meetstation Arnhem / 6249 Meetstation Berkhout / 6308 Meetstation Cadzand / 6260 Meetstation De Bilt / 6235 Meetstation Den Helder / 6370 Meetstation Eindhoven / 6377 Meetstation Ell / 6321 Meetstation Euro platform / 6350 Meetstation Gilze Rijen / 6323 Meetstation Goes / 6283 Meetstation Groenlo-Hupsel / 6280 Meetstation Groningen / 6315 Meetstation Hansweert /  6278 Meetstation Heino /  6356 Meetstation Herwijnen /  6330 Meetstation Hoek van Holland /  6279 Meetstation Hoogeveen / 6251 Meetstation Hoorn Terschelling /  6258 Meetstation Houtribdijk / 6285 Meetstation Huibertgat / 6209 Meetstation IJmond /  6225 Meetstation IJmuiden /  6277 Meetstation Lauwersoog / 6320 Meetstation LE Goeree / 6270 Meetstation Leeuwarden / 6269 Meetstation Lelystad / 6348 Meetstation Lopik-Cabauw / 6380 Meetstation Maastricht / 6273 Meetstation Marknesse / 6286 Meetstation Nieuw Beerta / 6312 Meetstation Oosterschelde / 6344 Meetstation Rotterdam / 6343 Meetstation Rotterdam Geulhaven / 6316 Meetstation Schaar / 6240 Meetstation Schiphol / 6324 Meetstation Stavenisse / 6267 Meetstation Stavoren / 6229 Meetstation Texelhors / 6331 Meetstation Tholen / 6290 Meetstation Twente / 6313 Meetstation Vlakte aan de Raan / 6242 Meetstation Vlieland / 6310 Meetstation Vlissingen / 6375 Meetstation Volkel / 6215 Meetstation Voorschoten / 6319 Meetstation Westdorpe / 6248 Meetstation Wijdenes / 6257 Meetstation Wijk aan Zee / 6340 Meetstation Woensdrecht / 6239 Meetstation Zeeplatform F-3 / 6252 Meetstation Zeeplatform K13

This QuickApp can store all general and station specific weather information in global variables. These global variables you can use in your own scripts, for example to send an email every morning with the weather forecast, send notifications of weather changes, etcetera. To use these Global Variables, set the QuickApp variable "setGlobalVar" to true.

Global Variables (if QuickApp variable setGlobalVar = true):
•	brStation_[deviceID]
•	brWeatherreport_[deviceID]
•	brShortterm_[deviceID]
•	brLongterm_[deviceID]
•	brFivedayforecast_2_[deviceID]
•	brFivedayforecast_3_[deviceID]
•	brFivedayforecast_4_[deviceID]
•	brFivedayforecast_5_[deviceID]

JSON data copyright: (C)opyright Buienradar / RTL. All rights reserved
JSON data terms: This feed may be used freely under condition of source reference buienradar.nl including a hyperlink to https://www.buienradar.nl. The feed cannot be derived from users or other persons.
