-- QuickApp BUIENRADAR WEATHER 

-- This QuickApp can be used as your Fibaro Homecenter 3 Weather Provider (Settings - 6. General - Main - Main Devices - Weather Provider)
-- The Buienradar Weather QuickApp contains the current Dutch weather measurements, the weather forecast and the 5-day forecast 
-- The 5-days forecast is shown in the labels and the tomorrow forecast is shown in the child devices 
-- The current observations are measured by KNMI weather stations spread across The Netherlands and are updated every 10 minutes 
-- The weather report is updated several times a day by the Buienradar meteorologists 

-- The QuickApp has child devices for:
  -- Temperature °C 
  -- Feel temperature °C 
  -- Ground temperature °C 
  -- Humidity % 
  -- Absolute humidity g/m³
  -- Airpressure hPa
  -- Windspeed m/s 
  -- Windspeed km/h
  -- Winddirectiondegrees ° (plus wind direction and arrow)
  -- Windspeed Bft
  -- Windgusts km/h
  -- Rain mm/h 
  -- Rain Last 24h mm
  -- Sunpower Watt/m²
  -- Visibility km
  -- Sunset (time)
  -- Sunrise (time)
  -- Sun Chance tomorrow % 
  -- Min Temp tomorrow °C
  -- Max Temp tomorrow °C
  -- Rain Chance tomorrow % 
  -- Min Rain tomorrow mm/h
  -- Max Rain tomorrow mm/h
  -- Wind tomorrow m/s (plus wind direction and arrow)
  -- Wind tomorrow km/h (plus wind direction and arrow)
  
-- This QuickApp is plug-and-play. The only thing you can do, is change the Station ID to a weatherstation nearby from the list or add some nice icons to the devices. 

-- Wind Chill (based on the JAG/TI-method) and is only valid for temperatures between -46 C and +10 C and is only valid for wind speed between 1.3 m/s and 49 m/s
-- Windspeed is shown in m/s (km/3.6)
-- Absolute humidity is the measure of water vapor (moisture) in the air, regardless of temperature. It is expressed as grams of moisture per cubic meter of air (g/m3) 
-- conditionCodes = {unavailable = 3200, clear = 32, rain = 40, snow = 43, storm = 38, cloudy = 30, fog = 20,}
-- The time shown in the QuickApp, is the last time of the measurement from Buienradar (not the system time)

-- TODO: Extra weather condition translations
-- TODO: Multi language
-- TODO: Change global variables to separate globals (?)


-- Changes version 4.0 (15th June 2026)
-- Changed all the json names because someone at Buienradar changed them


-- Changes version 3.0 (23rd March 2022)
-- Added 5-days forecast to the labels
-- Addded child devices for:
  -- Feel temperature °C 
  -- Ground temperature °C 
  -- Windspeed km/h
  -- Windspeed Bft
  -- Windgusts km/h
  -- Rain Last 24h mm
  -- Sun Chance tomorrow % 
  -- Min Temp tomorrow °C
  -- Max Temp tomorrow °C
  -- Rain Chance tomorrow % 
  -- Min Rain tomorrow mm/h
  -- Max Rain tomorrow mm/h
  -- Wind tomorrow m/s (plus wind direction and arrow)
  -- Wind tomorrow km/h (plus wind direction and arrow)
-- Changed SunPower device type to powerSensor
-- Changed all Wind devices types to windSensor
-- Converted date-times to more nice format
-- Quickapp variable setGlobalVar changed to boolean
-- Added Quickapp variable stationWarning to show a warning (once) if your station hasn't got some weather value (default is true)
-- Optimised some code


-- Changes version 2.1 (15th January 2021)
-- Added Airpressure Text in log of Airpressure Child Device
-- Added weatherdescription: 
  -- "Mix van opklaringen en hoge bewolking" to conditioncode "cloudy"
  -- "Half bewolkt" to conditioncode "cloudy"
  -- "Opklaring en lokaal nevel of mist" to conditioncode "fog"
  -- "Zwaar bewolkt met lichte sneeuwval" to conditionCode "snow"
  -- "Zwaar bewolkt met regen en winterse neerslag" to conditioncode "snow"
  -- "Afwisselend bewolkt met lichte sneeuwval" to conditioncode "snow"
  -- "Zware sneeuwval" to conditioncode "snow"
  -- "Opklaringen en kans op enkele pittige (onweers)buien" to conditioncode "rain"
  -- "Bewolkt en kans op enkele pittige (onweers)buien" to conditioncode "rain"

-- Changes version 2.0 (3rd January 2021)
-- Added Child Devices for: 
  -- Temperature °C (including feeltemperature and groundtemperature) 
  -- Humidity % 
  -- Absolute humidity g/m³
  -- Airpressure hPa
  -- Windspeed m/s (including windspeedBft and Windgust km/h)
  -- Winddirectiondegrees ° (including winddirection and arrow)
  -- Rain mm/h (including rainFallLast24Hour mm)
  -- Sunpower Watt/m²
  -- Visibility km
  -- Sunset (time)
  -- Sunrise (time)
-- Re-arranged the labels
-- Added backup station functionality for weather stations that don't have all the data, the data from 6260 Meetstation De Bilt is used. 
-- Improved check for missing data
-- Added Quickapp variable for debug level (1=some, 2=few, 3=all). Recommended default value is 1.

-- Changes version 1.0 (25th October 2020)
-- Added weatherdescription "Zwaar bewolkt met wat lichte regen" to conditionCode "rain"

-- Changes version 0.6 (9th September 2020)
-- Changed conditionCodes storm = 38, snow = 43 and unknown = unavailable
-- Added weatherdescription "Afwisselend bewolkt met (mogelijk) wat lichte regen" to conditionCode "rain" and and "Afwisselend bewolkt met lokaal mist(banken)" to conditionCode "fog"

-- Changes version 0.5 (4th September 2020)
-- Added wind direction, air pressure and feel temperature to QuickApp labels
-- Changed StationName to regio in labels and log
-- Changed the names of the Global Variables to meet the Fibaro standards and shortened them (please manually delete your old ones and change the names in your scenes)
-- Added an extra check for response of Buienradar (jsonTable)

-- Changes version 0.4 (23rd August 2020) 
-- Completely renewed code
-- Several Global Variables are available for personal use
-- Addes QuickApp variable SetGlobalVar true or false, whether you want to use the Global Variables
-- Added QuickApp variable Timeout for finetuning waiting for response

-- Changes version 0.3 (11th August 2020)
-- Error message instead of debug message in case of an error
-- Changed method of adding QuickApp variables, so they can be edited

-- QuickApp Variables mandatory (automatically created):
-- interval = Number in seconds to update the data (defaul = 601)
-- timeout = Number in seconds to wait for a response (default = 5)
-- stationID = Number of the station you want to use for weather measurements (default = 6260 Meetstation De Bilt)
-- backupstationID = Number of the backup station for missing weather data from stations that don't have all the data (default = 6260 Meetstation De Bilt). Don't change this ID unless you know what you are doing, 
-- setGlobalVar = true or false, whether you want tu use the Global Variables (default = false)
-- stationWarning = true or false, whether you want to receive warnings if your station hasn't got some weather value (default is true)
-- debugLevel = Number (1=some, 2=few, 3=all) (default = 1)

-- Station ID's and Stations: 
-- 6391 Meetstation Arcen / 6275 Meetstation Arnhem / 6249 Meetstation Berkhout / 6308 Meetstation Cadzand / 6260 Meetstation De Bilt / 6235 Meetstation Den Helder / 6370 Meetstation Eindhoven / 6377 Meetstation Ell / 6321 Meetstation Euro platform / 6350 Meetstation Gilze Rijen / 6323 Meetstation Goes / 6283 Meetstation Groenlo-Hupsel / 6280 Meetstation Groningen / 6315 Meetstation Hansweert /  6278 Meetstation Heino /  6356 Meetstation Herwijnen /  6330 Meetstation Hoek van Holland /  6279 Meetstation Hoogeveen / 6251 Meetstation Hoorn Terschelling /  6258 Meetstation Houtribdijk / 6285 Meetstation Huibertgat / 6209 Meetstation IJmond /  6225 Meetstation IJmuiden /  6277 Meetstation Lauwersoog / 6320 Meetstation LE Goeree / 6270 Meetstation Leeuwarden / 6269 Meetstation Lelystad / 6348 Meetstation Lopik-Cabauw / 6380 Meetstation Maastricht / 6273 Meetstation Marknesse / 6286 Meetstation Nieuw Beerta / 6312 Meetstation Oosterschelde / 6344 Meetstation Rotterdam / 6343 Meetstation Rotterdam Geulhaven / 6316 Meetstation Schaar / 6240 Meetstation Schiphol / 6324 Meetstation Stavenisse / 6267 Meetstation Stavoren / 6229 Meetstation Texelhors / 6331 Meetstation Tholen / 6290 Meetstation Twente / 6313 Meetstation Vlakte aan de Raan / 6242 Meetstation Vlieland / 6310 Meetstation Vlissingen / 6375 Meetstation Volkel / 6215 Meetstation Voorschoten / 6319 Meetstation Westdorpe / 6248 Meetstation Wijdenes / 6257 Meetstation Wijk aan Zee / 6340 Meetstation Woensdrecht / 6239 Meetstation Zeeplatform F-3 / 6252 Meetstation Zeeplatform K13

-- This QuickApp can store all general and station specific weather information in global variables. These global variables you can use in your own scripts, for example to send an email every morning with the weather forecast, send notifications of weather changes, etcetera. To use these Global Variables, set the QuickApp variable "setGlobalVar" to true.

-- Global Variables (if QuickApp variable setGlobalVar = true):
-- brStation_[deviceID]
-- brWeatherreport_[deviceID]
-- brShortterm_[deviceID]
-- brLongterm_[deviceID]
-- brFivedayforecast_2_[deviceID]
-- brFivedayforecast_3_[deviceID]
-- brFivedayforecast_4_[deviceID]
-- brFivedayforecast_5_[deviceID]

-- Examples of the Global Variables:
 
-- brStation_[deviceID] -- {"regio": "Rotterdam","timestamp": "2020-08-22T11:40:00","airpressure": 1013.1,"lat": 51.95,"weatherdescription": "Zwaar bewolkt","rainFallLast24Hour": 0.6,"feeltemperature": 20.3,"precipitation": 0,"StationName": "Meetstation Rotterdam","lon": 4.45,"$id": "36","temperature": 20.3,"graphUrl": "https://www.buienradar.nl/nederland/weerbericht/weergrafieken/c","windgusts": 14.4,"sunpower": 349,"rainFallLastHour": 0,"winddirection": "ZW","StationId": 6344,"groundtemperature": 20.7,"winddirectiondegrees": 215,"humidity": 68,"windspeedBft": 5,"windspeed": 9.3,"visibility": 25300,"iconurl": "https://www.buienradar.nl/resources/images/icons/weather/30x30/c.png"}

-- brWeatherreport_[deviceID] -- {"published":"2020-08-22T10:00:00","authorbio":"Sinds 2017 als junior Meteoroloog actief voor het weekendteam van Buienradar. Daarnaast student van de Bachelor Bodem, Water & Atmosfeer aan de Wageningen Universiteit.","author":"Philippe Schambergen","text":"Na de warmte van de afgelopen weken gaat het roer nu flink om. De komende tijd is het wisselvallig in Nederland met normale temperaturen en vooral op woensdag staat er veel wind.Vandaag is het wisselend bewolkt en is het in het binnenland nog geruime tijd droog. In de loop van de dag gaan er vanuit het noordwesten buien vallen met in het noorden kans op onweer. Na het middaguur trekken deze buien verder landinwaarts. Tussen de buien door blijft er echter genoeg ruimte voor de zon. Het wordt 21 of 22 graden langs de kust en nog een zomerse 25 graden in het zuidoosten. Er staat een matige en aan zee krachtige zuidwestenwind, windkracht 4 tot 6. Ook komen er in heel het land windstoten rond de 50 km\/h voor, tijdens buien mogelijk oplopend tot 75 km\/h. Aan het eind van de middag komt er langs de zuidwestkust mogelijk een harde zuidwestenwind te staan, windkracht 7.Vanavond klaart het op en trekken de meeste buien naar het oosten weg. Het blijft nog even stevig waaien. Vannacht neemt de wind in het binnenland iets af en verdwijnen daar de windstoten. Er gaan wel opnieuw buien ontstaan in het noorden van het land. Het koelt af naar 17 graden aan zee en 14 graden in het binnenland.&nbsp;Morgen is het wisselend bewolkt en trekken enkele buien over het land. Er staat wel iets minder wind dan vandaag: de westenwind waait matig tot aan zee (vrij) krachtig. In de middag wordt het nog maar 20 graden op de Wadden en 22 graden in het zuidoosten van het land, waarmee de temperatuur rond normaal komt te liggen.De dagen erna is het wisselvallig met enkele buien waarbij het vooral in het noorden soms flink kan doorregenen. Een depressie ligt woensdag boven de Noordzee en deze zorgt dan voor een flinke toename van de wind. Mogelijk wordt het zelfs even stormachtig! In de middag wordt het 19 tot 22 graden, alleen dinsdag kan het in het zuidoosten wel weer 24 graden worden.","title":"Terug naar normaal","summary":"Na de warmte van de afgelopen weken gaat het roer nu flink om. De komende tijd is het wisselvallig in Nederland met normale temperaturen en vooral op woensdag staat er veel wind.","$id":"57"}

-- brShortterm_[deviceID] -- {"startdate":"2020-08-23T00:00:00","enddate":"2020-08-27T00:00:00","forecast":"Onbestendig met geregeld regen of enkele buien.","$id":"58"}

-- brLongterm_[deviceID] -- {"startdate":"2020-08-28T00:00:00","enddate":"2020-09-01T00:00:00","forecast":"Aanvankelijk onbestendig met maxima iets onder het langjarig gemiddelde. Later in de periode neemt de kans op een droger en warmer weertype toe.","$id":"59"}
 
-- brFivedayforecast_2_[deviceID] -- {"iconurl": "https://www.buienradar.nl/resources/images/icons/weather/30x30/f.png","mintemperatureMin": 14,"maxtemperatureMax": 20,"weatherdescription": "Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature": "14/15","mintemperatureMax": 15,"mmRainMax": 5,"maxtemperature": "19/20","maxtemperatureMin": 19,"wind": 3,"windDirection": "w","mmRainMin": 2,"sunChance": 30,"day": "2020-08-24T00:00:00","rainChance": 70,"$id": "61"}

-- brFivedayforecast_3_[deviceID] -- {"iconurl": "https://www.buienradar.nl/resources/images/icons/weather/30x30/f.png","mintemperatureMin": 13,"maxtemperatureMax": 22,"weatherdescription": "Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature": "13/15","mintemperatureMax": 15,"mmRainMax": 6,"maxtemperature": "20/22","maxtemperatureMin": 20,"wind": 4,"windDirection": "zw","mmRainMin": 2,"sunChance": 30,"day": "2020-08-25T00:00:00","rainChance": 80,"$id": "62"}
 
-- brFivedayforecast_4_[deviceID] -- {"iconurl": "https://www.buienradar.nl/resources/images/icons/weather/30x30/f.png","mintemperatureMin": 16,"maxtemperatureMax": 21,"weatherdescription": "Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature": "16/17","mintemperatureMax": 17,"mmRainMax": 3,"maxtemperature": "19/21","maxtemperatureMin": 19,"wind": 5,"windDirection": "w","mmRainMin": 1,"sunChance": 30,"day": "2020-08-26T00:00:00","rainChance": 60,"$id": "63"}

-- brFivedayforecast_5_[deviceID] -- {"iconurl": "https://www.buienradar.nl/resources/images/icons/weather/30x30/f.png","mintemperatureMin": 13,"maxtemperatureMax": 20,"weatherdescription": "Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature": "13/15","mintemperatureMax": 15,"mmRainMax": 3,"maxtemperature": "19/20","maxtemperatureMin": 19,"wind": 3,"windDirection": "zw","mmRainMin": 1,"sunChance": 40,"day": "2020-08-27T00:00:00","rainChance": 70,"$id": "64"}

-- JSON data copyright: (C)opyright Buienradar / RTL. All rights reserved
-- JSON data terms: This feed may be used freely under condition of source reference buienradar.nl including a hyperlink to https://www.buienradar.nl. The feed cannot be derived from users or other persons.


-- Below here no changes are needed


class 'brTemperature'(QuickAppChild)
function brTemperature:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brTemperature:updateValue(data) 
  self:updateProperty("value",tonumber(data.Temperature))
  self:updateProperty("unit", "°C")
  self:updateProperty("log", " ")
end

class 'brFeelTemp'(QuickAppChild)
function brFeelTemp:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brFeelTemp:updateValue(data) 
  self:updateProperty("value",tonumber(data.FeelTemperature))
  self:updateProperty("unit", "°C")
  self:updateProperty("log", " ")
end

class 'brGroundTemp'(QuickAppChild)
function brGroundTemp:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brGroundTemp:updateValue(data) 
  self:updateProperty("value",tonumber(data.GroundTemperature))
  self:updateProperty("unit", "°C")
  self:updateProperty("log", " ")
end

class 'brHumidity'(QuickAppChild)
function brHumidity:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brHumidity:updateValue(data) 
  self:updateProperty("value",tonumber(data.Humidity))
  self:updateProperty("unit", "%")
end

class 'brHumidityAbs'(QuickAppChild)
function brHumidityAbs:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brHumidityAbs:updateValue(data) 
  self:updateProperty("value",tonumber(data.Humidityabsolute))
  self:updateProperty("unit", "g/m³")
end

class 'brAirpressure'(QuickAppChild)
function brAirpressure:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brAirpressure:updateValue(data) 
  self:updateProperty("value",tonumber(data.AirPressure))
  self:updateProperty("unit", "hPa")
  self:updateProperty("log", data.AirPressuretext)
end

class 'brWindspeedMS'(QuickAppChild)
function brWindspeedMS:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brWindspeedMS:updateValue(data) 
  self:updateProperty("value",tonumber(data.Windspeed))
  self:updateProperty("unit", "m/s")
  self:updateProperty("log", " ")
end

class 'brWindspeedKMH'(QuickAppChild)
function brWindspeedKMH:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brWindspeedKMH:updateValue(data) 
  self:updateProperty("value",tonumber(data.Windspeed*3.6))
  self:updateProperty("unit", "km/h")
  self:updateProperty("log", " ")
end

class 'brWindspeedBFT'(QuickAppChild)
function brWindspeedBFT:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brWindspeedBFT:updateValue(data) 
  self:updateProperty("value",tonumber(data.WindspeedBeaufort))
  self:updateProperty("unit", "bft")
  self:updateProperty("log", " ")
end

class 'brWindgusts'(QuickAppChild)
function brWindgusts:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brWindgusts:updateValue(data) 
  self:updateProperty("value",tonumber(data.WindGusts))
  self:updateProperty("unit", "km/h")
  self:updateProperty("log", " ")
end

class 'brWinddirection'(QuickAppChild)
function brWinddirection:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brWinddirection:updateValue(data) 
  self:updateProperty("value",tonumber(data.WindDirectionDegrees))
  self:updateProperty("unit", "°")
  self:updateProperty("log", data.WindDirection ..data.WindDirectionarrow)
end

class 'brPrecipitation'(QuickAppChild)
function brPrecipitation:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brPrecipitation:updateValue(data) 
  self:updateProperty("value",tonumber(data.Precipitation))
  self:updateProperty("unit", "mm/h")
  self:updateProperty("log", " ")
end

class 'brLast24h'(QuickAppChild)
function brLast24h:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brLast24h:updateValue(data) 
  self:updateProperty("value",tonumber(data.RainfallLast24Hour))
  self:updateProperty("unit", "mm")
  self:updateProperty("log", " ")
end

class 'brSunpower'(QuickAppChild)
function brSunpower:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brSunpower:updateValue(data) 
  self:updateProperty("value",tonumber(data.Sunpower))
  self:updateProperty("unit", "Watt/m²")
end

class 'brVisibility'(QuickAppChild)
function brVisibility:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brVisibility:updateValue(data) 
  self:updateProperty("value",tonumber(data.Visibility)) 
  self:updateProperty("unit", "km")
end

class 'brSunset'(QuickAppChild)
function brSunset:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brSunset:updateValue(data) 
  self:updateProperty("value",tonumber(data.Sunset)) 
  self:updateProperty("unit", "")
end

class 'brSunrise'(QuickAppChild)
function brSunrise:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brSunrise:updateValue(data) 
  self:updateProperty("value",tonumber(data.Sunrise)) 
  self:updateProperty("unit", "")
end

class 'brSunChance'(QuickAppChild)
function brSunChance:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brSunChance:updateValue(data) 
  self:updateProperty("value",tonumber(data.Day1sunChance)) 
  self:updateProperty("unit", "%")
end

class 'brMinMinTemp'(QuickAppChild)
function brMinMinTemp:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brMinMinTemp:updateValue(data) 
  self:updateProperty("value",tonumber(data.Day1mintemperatureMin)) 
  self:updateProperty("unit", "°C")
end

class 'brMaxMaxTemp'(QuickAppChild)
function brMaxMaxTemp:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brMaxMaxTemp:updateValue(data) 
  self:updateProperty("value",tonumber(data.Day1maxtemperatureMax)) 
  self:updateProperty("unit", "°C")
end

class 'brRainChance'(QuickAppChild)
function brRainChance:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brRainChance:updateValue(data) 
  self:updateProperty("value",tonumber(data.Day1rainChance)) 
  self:updateProperty("unit", "%")
end

class 'brMinRain'(QuickAppChild)
function brMinRain:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brMinRain:updateValue(data) 
  self:updateProperty("value",tonumber(data.Day1mmRainMin)) 
  self:updateProperty("unit", "mm/h")
end

class 'brMaxRain'(QuickAppChild)
function brMaxRain:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brMaxRain:updateValue(data) 
  self:updateProperty("value",tonumber(data.Day1mmRainMax)) 
  self:updateProperty("unit", "mm/h")
end

class 'brWindMS'(QuickAppChild)
function brWindMS:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brWindMS:updateValue(data) 
  self:updateProperty("value",tonumber(data.Day1wind)) 
  self:updateProperty("unit", "m/s")
  self:updateProperty("log", data.Day1windDirection ..data.Day1windDirectionarrow)
end

class 'brWindKMH'(QuickAppChild)
function brWindKMH:__init(dev)
  QuickAppChild.__init(self,dev)
end
function brWindKMH:updateValue(data) 
  self:updateProperty("value",tonumber(data.Day1wind*3.6)) 
  self:updateProperty("unit", "km/h")
  self:updateProperty("log", data.Day1windDirection ..data.Day1windDirectionarrow)
end


local function getChildVariable(child,varName)
  for _,v in ipairs(child.properties.quickAppVariables or {}) do
    if v.name==varName then return v.value end
  end
  return ""
end


-- QuickApp Functions


function QuickApp:updateChildDevices() -- Update Child Devices
  for id,child in pairs(self.childDevices) do 
    child:updateValue(data) 
  end
end


function QuickApp:logging(level,text) -- Logging function for debug
  if tonumber(debugLevel) >= tonumber(level) then 
      self:debug(text)
  end
end


function QuickApp:setGlobalVariable(tag,res) -- Fill the Buienradar Global Variable
  if setGlobalVar then 
    if api.get("/globalVariables/"..tag) == nil then
      local responseData, status = api.post("/globalVariables/",{value=(json.encode(res)),name=tag})
      self:trace("Global Variable created: " ..tag .." / status: " ..status) 
    else
      local responseData, status = api.put("/globalVariables/"..tag,{value=(json.encode(res))})
    end
  else
    if api.get("/globalVariables/"..tag) then
      self:deleteGlobalVariable(tag) -- If the Global Variable exists, delete it
    end
  end
end

function QuickApp:deleteGlobalVariable(tag) -- Delete the Buienradar Global Variable 
   local responseData, status = api.delete("/globalVariables/"..tag) 
   self:trace("Global Variable deleted: " ..tag .." / status: " ..status)
end


function QuickApp:setPressuretext(airpressure) -- Setup text for airpressure
  press = tonumber(airpressure)
  if press < 974 then 
    return "Thunderstorms"
  elseif press < 990 then
    return "Stormy"
  elseif press < 1002 then
    return "Rain"
  elseif press < 1010 then
    return "Cloudy"
  elseif press < 1022 then
    return "Unstable"
  elseif press < 1035 then
    return "Stable"
  else
    return "Very dry"
  end
end


function QuickApp:setWinddirectionarrow(direction) -- Setup arrow for winddirection 
  if direction == "N" then
    return " ↓"
  elseif direction == "NO" or direction == "ONO" or direction == "NNO" then
    return " ↙"
  elseif direction == "O" then
    return " ←"
  elseif direction == "OZO" or direction ==" ZO" or direction == "ZZO" then
    return " ↖"
  elseif direction == "Z" then
    return " ↑"
  elseif direction == "ZZW" or direction == "ZW" or direction == "WZW" then
    return " ↗"
  elseif direction == "W" then
    return " →"
  elseif direction == "WNW" or direction == "NW" or direction == "NNW" then
    return " ↘"
  else
    return " ⟳"
  end
end


function QuickApp:getHumidityAbs() -- Calculate Absolute Humidity (based on Temperature, Relative Humidity and Airpressure) Source from muhmuh at Fibaro forum
  local EXP = 2.71828182845904523536028747135266249775724709369995
  local humidityAbs = 0.622 * data.Humidity/100 * (1.01325 * 10^(5.426651 - 2005.1 / (data.Temperature + 273.15) + 0.00013869 * ((data.Temperature + 273.15) * (data.Temperature + 273.15) - 293700) / (data.Temperature + 273.15) * (10^(0.000000000011965 * ((data.Temperature + 273.15) * (data.Temperature + 273.15) - 293700) * ((data.Temperature + 273.15) * (data.Temperature + 273.15) - 293700)) - 1) - 0.0044 * 10^((-0.0057148 * (374.11 - data.Temperature)^1.25))) + (((data.Temperature + 273.15) / 647.3) - 0.422) * (0.577 - ((data.Temperature + 273.15) / 647.3)) * EXP^(0.000000000011965 * ((data.Temperature + 273.15) * (data.Temperature + 273.15) - 293700) * ((data.Temperature + 273.15) * (data.Temperature + 273.15) - 293700)) * 0.00980665) / (data.AirPressure/1000 - data.Humidity/100 * (1.01325 * 10^(5.426651 - 2005.1 / (data.Temperature + 273.15) + 0.00013869 * ((data.Temperature + 273.15) * (data.Temperature + 273.15) - 293700) / (data.Temperature + 273.15) * (10^(0.000000000011965 * ((data.Temperature + 273.15) * (data.Temperature + 273.15) - 293700) * ((data.Temperature + 273.15) * (data.Temperature + 273.15) - 293700)) - 1) - 0.0044 * 10^((-0.0057148 * (374.11 - data.Temperature)^1.25))) + (((data.Temperature + 273.15) / 647.3) - 0.422) * (0.577 - ((data.Temperature + 273.15) / 647.3)) * EXP^(0.000000000011965 * ((data.Temperature + 273.15) * (data.Temperature + 273.15) - 293700) * ((data.Temperature + 273.15) * (data.Temperature + 273.15) - 293700)) * 0.00980665)) * data.AirPressure/1000 * 100000000 / ((data.Temperature + 273.15) * 287.1)
  return string.format("%.2f",humidityAbs)
end


function QuickApp:showWarningBackupData(var) -- Show warning if data from backup station is used
  if stationWarning then
    self:warning(var .." data from " ..data.StationName .." NOT available, using data from backup station " ..data.backupStationName)
  end
end


function QuickApp:setCondition(condition) -- Update weather condition, update properties "ConditionCode" and "WeatherCondition"
  self:logging(3,"QuickApp:setCondition(condition)")
  local conditionCodes = {unavailable = 3200, clear = 32, rain = 40, snow = 43, storm = 38, cloudy = 30, fog = 20,}
  local conditionCode = conditionCodes[condition]
  if conditionCode then
    self:updateProperty("ConditionCode", conditionCode)
    self:updateProperty("WeatherCondition", condition)
  end
end


function QuickApp:setPropertiesLabels() -- Update properties and labels 
  self:logging(3,"QuickApp:setPropertiesLabels()")
  local labelText = data.Region .." (" ..data.StationName .." - " ..stationID ..")" .."\n" 
  labelText = labelText ..data.WeatherDescription .."\n" 
  labelText = labelText .."Temperature: " ..data.Temperature .." °C" .."\n"
  labelText = labelText .."Feel temperature: " ..data.FeelTemperature .." °C" .."\n"
  labelText = labelText .."Ground temperature: " ..data.GroundTemperature .." °C" .."\n"
  labelText = labelText .."Humidity: " ..data.Humidity .." %" .."\n" 
  labelText = labelText .."Absolute humidity: " ..data.Humidityabsolute .." g/m³" .."\n" 
  labelText = labelText .."Air pressure: " ..data.AirPressure .." hPa (" ..data.AirPressuretext ..")" .."\n" 
  labelText = labelText .."Rain: " ..data.Precipitation .." mm/h Last 24h: " ..data.RainfallLast24Hour .." mm/h" .."\n" 
  labelText = labelText .."Wind: " ..data.WindDirection .." " ..data.Windspeed .." m/s " ..data.Windspeed*3.6 .." km/h " ..data.WindspeedBeaufort .." Bft " .."\n" 
  labelText = labelText .."Windgusts: "..data.WindGusts .." m/s" .."\n" 
  labelText = labelText .."Sun power: " ..data.Sunpower .." Watt/m²" .."\n" 
  labelText = labelText .."Visibility: "  ..data.Visibility .." km" .."\n" 
  labelText = labelText .."Sunset: " ..data.Sunset .." - Sunrise: " ..data.Sunrise .."\n"
  labelText = labelText .."Measured: " ..data.Timestamp .."\n\n"

  labelText = labelText .."5-Days Forecast: " .."\n"
  labelText = labelText .."(" ..data.Day1 ..") " ..data.Day1weatherdescription  .."\n"
  labelText = labelText .."Sun chance: " ..data.Day1sunChance .." - " ..data.Day2sunChance .." - "..data.Day3sunChance .." - " ..data.Day4sunChance .." - "..data.Day5sunChance .." %".."\n"
  labelText = labelText .."Min temp: " ..data.Day1mintemperatureMin .." - " ..data.Day2mintemperatureMin .." - " ..data.Day3mintemperatureMin .." - " ..data.Day4mintemperatureMin .." - " ..data.Day5mintemperatureMin .." °C".."\n"
  labelText = labelText .."Max temp: " ..data.Day1maxtemperatureMax .." - " ..data.Day2maxtemperatureMax .." - " ..data.Day3maxtemperatureMax .." - " ..data.Day4maxtemperatureMax .." - " ..data.Day5maxtemperatureMax .." °C".."\n"
  labelText = labelText .."Rain chance: " ..data.Day1rainChance  .." - " ..data.Day2rainChance  .." - " ..data.Day3rainChance  .." - " ..data.Day4rainChance  .." - " ..data.Day5rainChance  .." %" .."\n"
  labelText = labelText .."Rain min: " ..data.Day1mmRainMin .." - " ..data.Day2mmRainMin .." - " ..data.Day3mmRainMin .." - " ..data.Day4mmRainMin .." - " ..data.Day5mmRainMin .." mm/h" .."\n" 
  labelText = labelText .."Rain max: " ..data.Day1mmRainMax .." - " ..data.Day2mmRainMax .." - " ..data.Day3mmRainMax .." - " ..data.Day4mmRainMax .." - " ..data.Day5mmRainMax .." mm/h" .."\n" 
  labelText = labelText .."Wind: " ..data.Day1windDirection .." " ..data.Day1wind .." - " ..data.Day2windDirection .." " ..data.Day2wind .." - " ..data.Day3windDirection .." " ..data.Day3wind .." - " ..data.Day4windDirection .." " ..data.Day4wind .." - " ..data.Day5windDirection .." " ..data.Day5wind .." m/s" .."\n"

  self:updateView("label", "text", labelText)
  self:logging(2,labelText)

  self:updateProperty("log", data.Region)

  -- Update Weatherstation values
  self:updateProperty("Temperature", tonumber(data.Temperature))
  self:updateProperty("Humidity", tonumber(data.Humidity))
  self:updateProperty("Wind", tonumber(data.Windspeed)*3.6) -- From m/s to km/h
  --self:updateProperty("Pressure", tonumber(data.AirPressure))
end 


function QuickApp:setWeathercondition() -- Set Weathercondition
  self:logging(3,"QuickApp:setWeathercondition()")  
   -- Update Condition (to be completed), unmapped weatherdescription are logged as warning
   if data.WeatherDescription == "Zwaar bewolkt" or data.WeatherDescription == "Mix van opklaringen en middelbare of lage bewolking" or data.WeatherDescription == "Mix van opklaringen en hoge bewolking" or data.WeatherDescription == "Half bewolkt" or data.WeatherDescription == "Opklaringen en kans op enkele pittige (onweers)buien" or data.WeatherDescription == "Bewolkt en kans op enkele pittige (onweers)buien" then self:setCondition("cloudy")
   elseif data.WeatherDescription == "Zwaar bewolkt en regen" or data.WeatherDescription == "Afwisselend bewolkt met (mogelijk) wat lichte regen" or data.WeatherDescription == "Zwaar bewolkt met wat lichte regen" then self:setCondition("rain")
   elseif data.WeatherDescription == "Vrijwel onbewolkt (zonnig/helder)" then self:setCondition("clear")
   elseif data.WeatherDescription == "Sneeuw" or data.WeatherDescription == "Zwaar bewolkt met lichte sneeuwval" or data.WeatherDescription == "Afwisselend bewolkt met lichte sneeuwval" or weatherdescription == "Zware sneeuwval" then self:setCondition("snow")
   elseif data.WeatherDescription == "Storm" then self:setCondition("storm")
   elseif data.WeatherDescription == "Mistig" or data.WeatherDescription == "Afwisselend bewolkt met lokaal mist(banken)" or data.WeatherDescription == "Opklaring en lokaal nevel of mist" then self:setCondition("fog")
   else -- Unable to set the Condition to a known one
      self:setCondition("unavailable") 
      self:warning("Weatherdescription unavailable: " ..data.WeatherDescription)
   end 
end


function QuickApp:onWeatherDataReceived(jsonTable) -- Get all weather data from json
  self:logging(3,"QuickApp:onWeatherDataReceived(jsonTable)")
  data.StationName = ""
  for i in pairs(jsonTable.Actual.WeatherStationMeasurements) do -- Get the values from the stationID
    self:logging(3,jsonTable.Actual.WeatherStationMeasurements[i].StationId .." " ..jsonTable.Actual.WeatherStationMeasurements[i].StationName)
    if stationID == jsonTable.Actual.WeatherStationMeasurements[i].StationId then -- The main data values
      self:logging(3,"Data from Station ID: " ..backupstationID)
      data.Temperature = jsonTable.Actual.WeatherStationMeasurements[i].Temperature or 0
      data.FeelTemperature = jsonTable.Actual.WeatherStationMeasurements[i].FeelTemperature or 0
      data.GroundTemperature = jsonTable.Actual.WeatherStationMeasurements[i].GroundTemperature or 0
      data.Humidity = jsonTable.Actual.WeatherStationMeasurements[i].Humidity or 0
      data.AirPressure = jsonTable.Actual.WeatherStationMeasurements[i].AirPressure or 0
      data.Windspeed = jsonTable.Actual.WeatherStationMeasurements[i].Windspeed or 0
      data.WindDirection = jsonTable.Actual.WeatherStationMeasurements[i].WindDirection or " "
      data.WindspeedBeaufort = jsonTable.Actual.WeatherStationMeasurements[i].WindspeedBeaufort or 0
      data.WindGusts = jsonTable.Actual.WeatherStationMeasurements[i].WindGusts or 0
      data.WindDirectionDegrees = jsonTable.Actual.WeatherStationMeasurements[i].WindDirectionDegrees or 0
      data.Precipitation = jsonTable.Actual.WeatherStationMeasurements[i].Precipitation or 0
      data.RainfallLast24Hour = jsonTable.Actual.WeatherStationMeasurements[i].RainfallLast24Hour or 0
      data.Sunpower = jsonTable.Actual.WeatherStationMeasurements[i].Sunpower or 0
      data.Visibility = jsonTable.Actual.WeatherStationMeasurements[i].Visibility or 0
      data.Sunrise = jsonTable.Actual.Sunrise or 0
      data.Sunset = jsonTable.Actual.Sunset or 0

      -- The extra data values
      data.StationName = jsonTable.Actual.WeatherStationMeasurements[i].StationName
      data.Region = jsonTable.Actual.WeatherStationMeasurements[i].Region
      data.WeatherDescription = jsonTable.Actual.WeatherStationMeasurements[i].WeatherDescription
      data.Timestamp = jsonTable.Actual.WeatherStationMeasurements[i].Timestamp
      local pattern = "(%d+)-(%d+)-(%d+)T(%d+):(%d+):(%d+)" -- Convert timestamp to nice format
      local runyear, runmonth, runday, runhour, runminute, runseconds = data.Timestamp:match(pattern)
      local convertedTimestamp = os.time({year = runyear, month = runmonth, day = runday, hour = runhour, min = runminute, sec = runseconds})
      data.Timestamp = os.date("%d-%m-%Y %H:%M", convertedTimestamp)

      -- Save Station specific weather values to Global Variable
      self:setGlobalVariable("brStation_"..plugin.mainDeviceId,jsonTable.Actual.WeatherStationMeasurements[i])
    end
    if backupstationID == jsonTable.Actual.WeatherStationMeasurements[i].StationId then
      self:logging(3,"Backup data from Station ID: " ..backupstationID)
      data.backupStationName = jsonTable.Actual.WeatherStationMeasurements[i].StationName
      data.backuptemperature = jsonTable.Actual.WeatherStationMeasurements[i].Temperature or 99
      data.backupfeeltemperature = jsonTable.Actual.WeatherStationMeasurements[i].FeelTemperature or 99
      data.backupgroundtemperature = jsonTable.Actual.WeatherStationMeasurements[i].GroundTemperature or 99
      data.backuphumidity = jsonTable.Actual.WeatherStationMeasurements[i].Humidity or 0
      data.backupairpressure = jsonTable.Actual.WeatherStationMeasurements[i].AirPressure or 1013
      data.backupwindspeed = jsonTable.Actual.WeatherStationMeasurements[i].Windspeed or 0
      data.backupwinddirection = jsonTable.Actual.WeatherStationMeasurements[i].WindDirection or "?"
      data.backupwindspeedBft = jsonTable.Actual.WeatherStationMeasurements[i].WindspeedBeaufort or 0
      data.backupwindgusts = jsonTable.Actual.WeatherStationMeasurements[i].WindGusts or 0
      data.backupwinddirectiondegrees = jsonTable.Actual.WeatherStationMeasurements[i].WindDirectionDegrees or 0
      data.backupprecipitation = jsonTable.Actual.WeatherStationMeasurements[i].Precipitation or 0
      data.backuprainFallLast24Hour = jsonTable.Actual.WeatherStationMeasurements[i].RainfallLast24Hour or 0
      data.backupsunpower = jsonTable.Actual.WeatherStationMeasurements[i].Sunpower or 0
      data.backupvisibility = jsonTable.Actual.WeatherStationMeasurements[i].Visibility or 0
    end
  end
  
  -- Get the 5-days forecast values
  data.Day1weatherdescription = jsonTable.Forecast.FiveDayForecast[1].WeatherDescription or ""
  data.Day1mintemperatureMin = jsonTable.Forecast.FiveDayForecast[1].MinTemperatureMin or 0
  data.Day1maxtemperatureMax = jsonTable.Forecast.FiveDayForecast[1].MaxTemperatureMax or 0
  data.Day1mmRainMin = jsonTable.Forecast.FiveDayForecast[1].RainMinMm or 0
  data.Day1mmRainMax = jsonTable.Forecast.FiveDayForecast[1].RainMaxMm or 0
  data.Day1rainChance = jsonTable.Forecast.FiveDayForecast[1].RainChance or 0
  data.Day1sunChance = jsonTable.Forecast.FiveDayForecast[1].SunChance or 0
  data.Day1wind = jsonTable.Forecast.FiveDayForecast[1].WindBeaufort or 0
  data.Day1windDirection = string.upper(jsonTable.Forecast.FiveDayForecast[1].WindDirection) or ""
  data.Day1windDirectionarrow = self:setWinddirectionarrow(data.Day1windDirection) -- Setup day1WindDirection Arrow
  data.Day1 = jsonTable.Forecast.FiveDayForecast[1].Day
  local pattern = "(%d+)-(%d+)-(%d+)T(%d+):(%d+):(%d+)" -- Convert day1 to nice format
  local runyear, runmonth, runday, runhour, runminute, runseconds = data.Day1:match(pattern)
  local convertedTimestamp = os.time({year = runyear, month = runmonth, day = runday, hour = runhour, min = runminute, sec = runseconds})
  data.Day1 = os.date("%d-%m-%Y", convertedTimestamp)
  
  data.Day2mintemperatureMin = jsonTable.Forecast.FiveDayForecast[2].MinTemperatureMin or 0
  data.Day2maxtemperatureMax = jsonTable.Forecast.FiveDayForecast[2].MaxTemperatureMax or 0
  data.Day2mmRainMin = jsonTable.Forecast.FiveDayForecast[2].RainMinMm or 0
  data.Day2mmRainMax = jsonTable.Forecast.FiveDayForecast[2].RainMaxMm or 0
  data.Day2rainChance = jsonTable.Forecast.FiveDayForecast[2].RainChance or 0
  data.Day2sunChance = jsonTable.Forecast.FiveDayForecast[2].SunChance or 0
  data.Day2wind = jsonTable.Forecast.FiveDayForecast[2].WindBeaufort or 0
  data.Day2windDirection = string.upper(jsonTable.Forecast.FiveDayForecast[2].WindDirection) or ""
  
  data.Day3mintemperatureMin = jsonTable.Forecast.FiveDayForecast[3].MinTemperatureMin or 0
  data.Day3maxtemperatureMax = jsonTable.Forecast.FiveDayForecast[3].MaxTemperatureMax or 0
  data.Day3mmRainMin = jsonTable.Forecast.FiveDayForecast[3].RainMinMm or 0
  data.Day3mmRainMax = jsonTable.Forecast.FiveDayForecast[3].RainMaxMm or 0
  data.Day3rainChance = jsonTable.Forecast.FiveDayForecast[3].RainChance or 0
  data.Day3sunChance = jsonTable.Forecast.FiveDayForecast[3].SunChance or 0
  data.Day3wind = jsonTable.Forecast.FiveDayForecast[3].WindBeaufort or 0
  data.Day3windDirection = string.upper(jsonTable.Forecast.FiveDayForecast[3].WindDirection) or ""
  
  data.Day4mintemperatureMin = jsonTable.Forecast.FiveDayForecast[4].MinTemperatureMin or 0
  data.Day4maxtemperatureMax = jsonTable.Forecast.FiveDayForecast[4].MaxTemperatureMax or 0
  data.Day4mmRainMin = jsonTable.Forecast.FiveDayForecast[4].RainMinMm or 0
  data.Day4mmRainMax = jsonTable.Forecast.FiveDayForecast[4].RainMaxMm or 0
  data.Day4rainChance = jsonTable.Forecast.FiveDayForecast[4].RainChance or 0
  data.Day4sunChance = jsonTable.Forecast.FiveDayForecast[4].SunChance or 0
  data.Day4wind = jsonTable.Forecast.FiveDayForecast[4].WindBeaufort or 0
  data.Day4windDirection = string.upper(jsonTable.Forecast.FiveDayForecast[4].WindDirection) or ""
  
  data.Day5mintemperatureMin = jsonTable.Forecast.FiveDayForecast[5].MinTemperatureMin or 0
  data.Day5maxtemperatureMax = jsonTable.Forecast.FiveDayForecast[5].MaxTemperatureMax or 0
  data.Day5mmRainMin = jsonTable.Forecast.FiveDayForecast[5].RainMinMm or 0
  data.Day5mmRainMax = jsonTable.Forecast.FiveDayForecast[5].RainMaxMm or 0
  data.Day5rainChance = jsonTable.Forecast.FiveDayForecast[5].RainChance or 0
  data.Day5sunChance = jsonTable.Forecast.FiveDayForecast[5].SunChance or 0
  data.Day5wind = jsonTable.Forecast.FiveDayForecast[5].WindBeaufort or 0
  data.Day5windDirection = string.upper(jsonTable.Forecast.FiveDayForecast[5].WindDirection) or ""
  
  -- Save generiek weather values to Global Variables
  self:setGlobalVariable("brWeatherreport_"..plugin.mainDeviceId,jsonTable.Forecast.WeatherReport)
  self:setGlobalVariable("brShortterm_"..plugin.mainDeviceId,jsonTable.Forecast.shortterm)
  self:setGlobalVariable("brLongterm_"..plugin.mainDeviceId,jsonTable.Forecast.longterm)
  --self:setGlobalVariable("brFivedayforecast_1_"..plugin.mainDeviceId,jsonTable.Forecast.FiveDayForecast[1])
  self:setGlobalVariable("brFivedayforecast_2_"..plugin.mainDeviceId,jsonTable.Forecast.FiveDayForecast[2])
  self:setGlobalVariable("brFivedayforecast_3_"..plugin.mainDeviceId,jsonTable.Forecast.FiveDayForecast[3])
  self:setGlobalVariable("brFivedayforecast_4_"..plugin.mainDeviceId,jsonTable.Forecast.FiveDayForecast[4])
  self:setGlobalVariable("brFivedayforecast_5_"..plugin.mainDeviceId,jsonTable.Forecast.FiveDayForecast[5])

  -- Check if variables have a value
  if data.StationName == "" or data.StationName == nil then
    self:error("Error: Station " ..stationID .." not found!")
  else
    if data.Region == "" or data.Region == nil then data.Region = "empty" end
    if data.WeatherDescription == "" or data.WeatherDescription == nil then data.WeatherDescription = "empty" end
    if data.Timestamp == "" or data.Timestamp == nil then data.Timestamp = "empty" end
    if data.Temperature == "" or data.Temperature == nil or data.Temperature == 0 then data.Temperature = data.backuptemperature; self:showWarningBackupData("temperature"); end
    if data.FeelTemperature == "" or data.FeelTemperature == nil or data.FeelTemperature == 0 then data.FeelTemperature = data.backupfeeltemperature; self:showWarningBackupData("feeltemperature"); end
    if data.Humidity == "" or data.Humidity == nil or data.Humidity == 0 then data.Humidity = data.backuphumidity; self:showWarningBackupData("humidity"); end
    if data.Windspeed == "" or data.Windspeed == nil or data.Windspeed == 0 then data.Windspeed = data.backupwindspeed; self:showWarningBackupData("windspeed"); end
    if data.WindGusts == "" or data.WindGusts == nil or data.WindGusts == 0 then data.WindGusts = data.backupwindgusts; self:showWarningBackupData("windgusts"); end
    if data.GroundTemperature  == "" or data.GroundTemperature == nil or data.GroundTemperature == 0 then data.GroundTemperature = data.backupgroundtemperature; self:showWarningBackupData("groundtemperature"); end
    if data.AirPressure == "" or data.AirPressure == nil or data.AirPressure == 0 then data.AirPressure = data.backupairpressure; self:showWarningBackupData("airpressure"); end
    if data.Precipitation == "" or data.Precipitation == nil or data.Precipitation == 0 then data.Precipitation = data.backupprecipitation; self:showWarningBackupData("rain"); end
    if data.RainfallLast24Hour == "" or data.RainfallLast24Hour == nil or data.RainfallLast24Hour == 0 then data.RainfallLast24Hour = data.backuprainFallLast24Hour; self:showWarningBackupData("rainFallLast24Hour"); end
    if data.Sunpower == "" or data.Sunpower == nil or data.Sunpower == 0 then data.Sunpower = data.backupsunpower; self:showWarningBackupData("sunpower"); end
    if data.Visibility == "" or data.Visibility == nil or data.Visibility == 0 then data.Visibility = data.backupvisibility; self:showWarningBackupData("visibility"); end
    if data.WindDirection == "" or data.WindDirection == nil or data.WindDirection == " " then data.WindDirection = data.backupwinddirection; self:showWarningBackupData("winddirection"); end
    if data.WindspeedBeaufort == "" or data.WindspeedBeaufort == nil or data.WindspeedBeaufort == 0 then data.WindspeedBeaufort = data.backupwindspeedBft; self:showWarningBackupData("windspeedBft"); end
    if data.WindGusts == "" or data.WindGusts == nil or data.WindGusts == 0 then data.WindGusts = data.backupwindgust; self:showWarningBackupData("windgusts"); end
    if data.WindDirectionDegrees == "" or data.WindDirectionDegrees == nil or data.WindDirectionDegrees == 0 then data.WindDirectionDegrees = data.backupwinddirectiondegrees; self:showWarningBackupData("winddirection degrees"); end
    stationWarning = false -- Set warnings for missing data from station false (off) to show only once

    -- Format the data (to prevent error with nil values from json data)
    data.Temperature = tostring(data.Temperature or 99)
    data.FeelTemperature = tostring(data.FeelTemperature or 99)
    data.GroundTemperature = tostring(data.GroundTemperature or 99)
    data.Humidity = tostring(string.format("%.0f",data.Humidity or 0))
    data.AirPressure = tostring(string.format("%.0f",data.AirPressure or 0))
    data.Windspeed = tostring(string.format("%.1f",(data.Windspeed or 0)/3.6))
    data.WindDirection = tostring(data.WindDirection or " ")
    data.WindspeedBeaufort = tostring(string.format("%.0f",data.WindspeedBeaufort or 0))
    data.WindGusts = tostring(data.WindGusts or 0)
    data.WindDirectionDegrees = tostring(data.WindDirectionDegrees or 0)
    data.Precipitation = tostring(data.Precipitation or 0)
    data.RainfallLast24Hour = tostring(data.RainfallLast24Hour or 0)
    data.Sunpower = tostring(string.format("%.0f",data.Sunpower or 0))
    data.Visibility = tostring((data.Visibility or 0)/1000)
    data.Sunrise = string.gsub(string.sub(data.Sunrise,-8,-4),":",".")
    data.Sunset = string.gsub(string.sub(data.Sunset,-8,-4),":",".")

    data.Humidityabsolute = self:getHumidityAbs() -- Calculate Absolute Humidity
    data.WindDirectionarrow = self:setWinddirectionarrow(data.WindDirection) -- Setup Winddirection Arrow
    data.AirPressuretext = self:setPressuretext(data.AirPressure) -- Setup Airpressure Text

    self:updateChildDevices() -- Update the Child Devices
    self:setWeathercondition() -- Go to setup Weathercondition
    self:setPropertiesLabels() -- Go to setup Properties and Labels
  end
end


function QuickApp:getWeatherData() -- Fetch all weather data from Buienradar url
  self:logging(3,"QuickApp:getWeatherData()")
  local url = "https://data.buienradar.nl/2.0/feed/json"
  self:logging(3,"Connecting: " ..url)
  http:request(url, {
    options={
      method = 'GET'
    },
    success = function(response)
      self:logging(3,"Response status:" ..response.status .." Headers: ", response.headers["Content-Type"])
      self:logging(3,"Response: " ..response.data)
      local jsonTable = json.decode(response.data)

      if jsonTable then 
        self:onWeatherDataReceived(jsonTable) 
      else
        self:warning("Temporarily no data from Buienradar Weather")
      end
    end,
    error = function(error)
      self:error("error: " ..json.encode(error))
      self:updateProperty("log", "error: " ..json.encode(error))
    end
  })   
  fibaro.setTimeout(interval*1000, function() 
     self:getWeatherData()
  end)
end


function QuickApp:createVariables() -- Get all Quickapp Variables or create them
  self:logging(3,"QuickApp:createVariables()")
  data = {}
  data.Temperature = ""
  data.FeelTemperature = ""
  data.GroundTemperature = ""
  data.Humidity = ""
  data.AirPressure = ""
  data.Windspeed = ""
  data.WindDirection = ""
  data.WindDirectionarrow = ""
  data.WindspeedBeaufort = ""
  data.WindGusts = ""
  data.WindDirectionDegrees = ""
  data.Precipitation = ""
  data.RainfallLast24Hour = ""
  data.Sunpower = ""
  data.Visibility = ""
  data.Sunrise = ""
  data.Sunset = ""  
  
  data.StationName = ""
  data.Region = ""
  data.WeatherDescription = ""
  
  data.Day1weatherdescription = ""
  data.Day1mintemperatureMin = ""
  data.Day1maxtemperatureMax = ""
  data.Day1mmRainMin = ""
  data.Day1mmRainMax = ""
  data.Day1rainChance = ""
  data.Day1sunChance = ""
  data.Day1wind = ""
  data.Day1windDirection = ""
  data.Day1windDirectionarrow = ""
  data.Day1 = ""
  
  data.Day2mintemperatureMin = ""
  data.Day2maxtemperatureMax = ""
  data.Day2mmRainMin = ""
  data.Day2mmRainMax = ""
  data.Day2rainChance = ""
  data.Day2sunChance = ""
  data.Day2wind = ""
  data.Day2windDirection = ""
  
  data.Day3mintemperatureMin = ""
  data.Day3maxtemperatureMax = ""
  data.Day3mmRainMin = ""
  data.Day3mmRainMax = ""
  data.Day3rainChance = ""
  data.Day3sunChance = ""
  data.Day3wind = ""
  data.Day3windDirection = ""
  
  data.Day4mintemperatureMin = ""
  data.Day4maxtemperatureMax = ""
  data.Day4mmRainMin = ""
  data.Day4mmRainMax = ""
  data.Day4rainChance = ""
  data.Day4sunChance = ""
  data.Day4wind = ""
  data.Day4windDirection = ""
  
  data.Day5mintemperatureMin = ""
  data.Day5maxtemperatureMax = ""
  data.Day5mmRainMin = ""
  data.Day5mmRainMax = ""
  data.Day5rainChance = ""
  data.Day5sunChance = ""
  data.Day5wind = ""
  data.Day5windDirection = ""
  
end


function QuickApp:getQuickAppVariables() -- Manage the QuickApp variables
  interval = tonumber(self:getVariable("interval")) 
  stationID = tonumber(self:getVariable("stationID")) 
  backupstationID = tonumber(self:getVariable("backupstationID")) 
  timeout = tonumber(self:getVariable("timeout")) 
  setGlobalVar = string.lower(self:getVariable("setGlobalVar"))
  stationWarning = string.lower(self:getVariable("stationWarning"))
  debugLevel = tonumber(self:getVariable("debugLevel"))

  -- Check existence of the mandatory variables, if not, create them with default values 
  if interval == "" or interval == nil then
    interval = "601" -- Default interval in seconds (Buienradar updates every 10 minues)
    self:setVariable("interval",interval)
    self:trace("Added QuickApp variable interval")
    interval = tonumber(interval)
  end
  if stationID == "" or stationID == nil then 
    stationID = "6260" -- Default station ID is 6260 (Meetstation De Bilt)
    self:setVariable("stationID",stationID)
    self:trace("Added QuickApp variable stationID")
    stationID = tonumber(stationID)
  end
  if backupstationID == "" or backupstationID == nil then 
    backupstationID = "6260" -- Default backup station ID is 6260 (Meetstation De Bilt)
    self:setVariable("backupstationID",backupstationID)
    self:trace("Added QuickApp variable backupstationID")
    backupstationID = tonumber(backupstationID)
  end
  if timeout == "" or timeout == nil then
    timeout = "5" -- Default value for timeout response in seconds
    self:setVariable("timeout",timeout)
    self:trace("Added QuickApp variable timeout")
    timeout = tonumber(timeout)
  end
  if debugLevel == "" or debugLevel == nil then
    debugLevel = "1" -- Default value for debugLevel response in seconds
    self:setVariable("debugLevel",debugLevel)
    self:trace("Added QuickApp variable debugLevel")
    debugLevel = tonumber(debugLevel)
  end
  if setGlobalVar == "" or setGlobalVar == nil then 
    setGlobalVar = false -- Default SetGlobalVar is falso (No use of Global Variables)
    self:setVariable("setGlobalVar",tostring(setGlobalVar))
    self:trace("Added QuickApp variable setGlobalVar")
  end
  if setGlobalVar == "true" then 
    setGlobalVar = true 
  else
    setGlobalVar = false
  end
  if stationWarning == "" or stationWarning == nil then 
    stationWarning = true
    self:setVariable("stationWarning",tostring(stationWarning))
    self:trace("Added QuickApp variable stationWarning")
  end
  if stationWarning == "true" then 
    stationWarning = true 
  else
    stationWarning = false
  end
end 


function QuickApp:setupChildDevices() -- Setup Child Devices
  local cdevs = api.get("/devices?parentId="..self.id) or {} -- Pick up all Child Devices
  function self:initChildDevices() end -- Null function, else Fibaro calls it after onInit()...

  if #cdevs == 0 then -- If no Child Devices, create them
    local initChildData = { 
      {className="brTemperature", name="Temperature", type="com.fibaro.TemperatureSensor", value=0},
      {className="brFeelTemp", name="Feel Temperature", type="com.fibaro.TemperatureSensor", value=0},
      {className="brGroundTemp", name="Ground Temperature", type="com.fibaro.TemperatureSensor", value=0},
      {className="brHumidity", name="Humidity", type="com.fibaro.HumiditySensor", value=0},
      {className="brHumidityAbs", name="Absolute Humidity", type="com.fibaro.multilevelSensor", value=0},
      {className="brAirpressure", name="Airpressure", type="com.fibaro.multilevelSensor", value=0},
      {className="brWindspeedMS", name="Windspeed m/s", type="com.fibaro.WindBeaufortSensor", value=0},
      {className="brWindspeedKMH", name="Windspeed km/h", type="com.fibaro.WindBeaufortSensor", value=0},
      {className="brWindspeedBFT", name="Windspeed BFT", type="com.fibaro.WindBeaufortSensor", value=0},
      {className="brWindgusts", name="Windgusts", type="com.fibaro.WindBeaufortSensor", value=0},
      {className="brWinddirection", name="Winddirection", type="com.fibaro.WindBeaufortSensor", value=0},
      {className="brPrecipitation", name="Rain", type="com.fibaro.multilevelSensor", value=0},
      {className="brLast24h", name="Rain Last 24h", type="com.fibaro.multilevelSensor", value=0},
      {className="brSunpower", name="Sunpower", type="com.fibaro.powerMeter", value=0},
      {className="brVisibility", name="Visibility", type="com.fibaro.multilevelSensor", value=0},
      {className="brSunset", name="Sunset", type="com.fibaro.multilevelSensor", value=0},
      {className="brSunrise", name="Sunrise", type="com.fibaro.multilevelSensor", value=0},
      {className="brSunChance", name="Sun Chance +1", type="com.fibaro.multilevelSensor", value=0},
      {className="brMinMinTemp", name="Min Temp +1", type="com.fibaro.TemperatureSensor", value=0},
      {className="brMaxMaxTemp", name="Max Temp +1", type="com.fibaro.TemperatureSensor", value=0},
      {className="brRainChance", name="Rain Chance +1", type="com.fibaro.multilevelSensor", value=0},
      {className="brMinRain", name="Min Rain +1", type="com.fibaro.multilevelSensor", value=0},
      {className="brMaxRain", name="Max Rain +1", type="com.fibaro.multilevelSensor", value=0},
      {className="brWindMS", name="Wind m/s +1", type="com.fibaro.WindBeaufortSensor", value=0},
      {className="brWindKMH", name="Wind km/h +1", type="com.fibaro.WindBeaufortSensor", value=0},
    }
    for _,c in ipairs(initChildData) do
      local child = self:createChildDevice(
        {name = c.name,
          type=c.type,
          value=c.value,
          unit=c.unit,
          initialInterfaces = {},
        },
        _G[c.className] -- Fetch class constructor from class name
      )
      child:setVariable("className",c.className)  -- Save class name so we know when we load it next time
    end   
  else 
    for _,child in ipairs(cdevs) do
      local className = getChildVariable(child,"className") -- Fetch child class name
      local childObject = _G[className](child) -- Create child object from the constructor name
      self.childDevices[child.id]=childObject
      childObject.parent = self -- Setup parent link to device controller 
    end
  end
end


function QuickApp:onInit() 
  __TAG = fibaro.getName(plugin.mainDeviceId) .." ID:" ..plugin.mainDeviceId
  self:debug("QuickApp:onInit()") 
  self:setupChildDevices()
  
  if not api.get("/devices/"..self.id).enabled then
    self:warning("Device", fibaro.getName(plugin.mainDeviceId), "is disabled")
    return
  end
  
  self:getQuickAppVariables()  
  self:createVariables() 
  http = net.HTTPClient({timeout=timeout})
  self:getWeatherData()
end

-- EOF