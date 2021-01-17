-- QuickApp BUIENRADAR WEATHER 

-- This QuickApp can be used as your weather provider. The Buienradar Weather QuickApp contains the current Dutch weather measurements, the weather forecast and the 5-day forecast. The current observations are measured by KNMI weather stations spread across The Netherlands and are updated every 10 minutes. The weather report is updated several times a day by the Buienradar meteorologists.

-- This QuickApp is plug-and-play. The only thing you can do, is change the Station ID to a weatherstation nearby from the list or add some nice icons to the devices. 

-- Wind Chill (based on the JAG/TI-method) and is only valid for temperatures between -46 C and +10 C and is only valid for wind speed between 1.3 m/s and 49 m/s
-- Windspeed is shown in m/s (km/3.6)
-- Absolute humidity is the measure of water vapor (moisture) in the air, regardless of temperature. It is expressed as grams of moisture per cubic meter of air (g/m3) 
-- conditionCodes = {unavailable = 3200, clear = 32, rain = 40, snow = 43, storm = 38, cloudy = 30, fog = 20,}
-- The time shown in the QuickApp, is the last time of the measurement from Buienradar (not the system time)

-- Version 2.1 (15th January 2021)
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
   -- Added Airpressure Text in log of Airpressure Child Device

-- Version 2.0 (3rd January 2021)
   -- Added Child Devices for: 
      -- Temperature °C (including feeltemperature and groundtemperature) 
      -- Humidity % 
      -- Absolute humidity g/m³
      -- Airpressure hPa
      -- Windspeed m/s (including windspeedBft and Windgust km/h)
      -- Winddirectiondegrees ° (including winddirection and arrow)
      -- Rain mm/h (including rainFallLast24Hour mm)
      -- Sunpower watt/m²
      -- Visibility km
      -- Sunset (time)
      -- Sunrise (time)
 -- Re-arranged the labels
 -- Added backup station functionality for weather stations that don't have all the data, the data from 6260 Meetstation De Bilt is used. 
 -- Improved check for missing data
 -- Added Quickapp variable for debug level (1=some, 2=few, 3=all). Recommended default value is 1.

-- Version 1.0 (25th October 2020)
   -- Added weatherdescription "Zwaar bewolkt met wat lichte regen" to conditionCode "rain"

-- Version 0.6 (9th September 2020)
   -- Changed conditionCodes storm = 38, snow = 43 and unknown = unavailable
   -- Added weatherdescription "Afwisselend bewolkt met (mogelijk) wat lichte regen" to conditionCode "rain" and and "Afwisselend bewolkt met lokaal mist(banken)" to conditionCode "fog"

-- Version 0.5 (4th September 2020)
   -- Added wind direction, air pressure and feel temperature to QuickApp labels
   -- Changed stationname to regio in labels and log
   -- Changed the names of the Global Variables to meet the Fibaro standards and shortened them (please manually delete your old ones and change the names in your scenes)
   -- Added an extra check for response of Buienradar (jsonTable)

-- Version 0.4 (23rd August 2020) 
   -- Completely renewed code
   -- Several Global Variables are available for personal use
   -- Addes QuickApp variable SetGlobalVar true or false, whether you want to use the Global Variables
   -- Added QuickApp variable Timeout for finetuning waiting for response

-- Version 0.3 (11th August 2020)
   -- Error message instead of debug message in case of an error
   -- Changed method of adding QuickApp variables, so they can be edited

-- QuickApp Variables mandatory (automatically created):
   -- interval = Number in seconds to update the data (defaul = 601)
   -- timeout = Number in seconds to wait for a response (default = 5)
   -- stationID = Number of the station you want to use for weather measurements (default = 6260 Meetstation De Bilt)
   -- backupstationID = Number of the backup station for missing weather data from stations that don't have all the data (default = 6260 Meetstation De Bilt). Don't change this ID unless you know what you are doing, 
   -- setGlobalVar = true or false, whether you want tu use the Global Variables (default = false)
   -- debugLevel = Number (1=some, 2=few, 3=all) (default = 1)

-- Station ID's and Stations: 
-- 6391 Meetstation Arcen / 6275 Meetstation Arnhem / 6249 Meetstation Berkhout / 6308 Meetstation Cadzand / 6260 Meetstation De Bilt / 6235 Meetstation Den Helder / 6370 Meetstation Eindhoven / 6377 Meetstation Ell / 6321 Meetstation Euro platform / 6350 Meetstation Gilze Rijen / 6323 Meetstation Goes / 6283 Meetstation Groenlo-Hupsel / 6280 Meetstation Groningen / 6315 Meetstation Hansweert /  6278 Meetstation Heino /  6356 Meetstation Herwijnen /  6330 Meetstation Hoek van Holland /  6279 Meetstation Hoogeveen / 6251 Meetstation Hoorn Terschelling /  6258 Meetstation Houtribdijk / 6285 Meetstation Huibertgat / 6209 Meetstation IJmond /  6225 Meetstation IJmuiden /  6277 Meetstation Lauwersoog / 6320 Meetstation LE Goeree / 6270 Meetstation Leeuwarden / 6269 Meetstation Lelystad / 6348 Meetstation Lopik-Cabauw / 6380 Meetstation Maastricht / 6273 Meetstation Marknesse / 6286 Meetstation Nieuw Beerta / 6312 Meetstation Oosterschelde / 6344 Meetstation Rotterdam / 6343 Meetstation Rotterdam Geulhaven / 6316 Meetstation Schaar / 6240 Meetstation Schiphol / 6324 Meetstation Stavenisse / 6267 Meetstation Stavoren / 6229 Meetstation Texelhors / 6331 Meetstation Tholen / 6290 Meetstation Twente / 6313 Meetstation Vlakte aan de Raan / 6242 Meetstation Vlieland / 6310 Meetstation Vlissingen / 6375 Meetstation Volkel / 6215 Meetstation Voorschoten / 6319 Meetstation Westdorpe / 6248 Meetstation Wijdenes / 6257 Meetstation Wijk aan Zee / 6340 Meetstation Woensdrecht / 6239 Meetstation Zeeplatform F-3 / 6252 Meetstation Zeeplatform K13

-- This QuickApp can store all general and station specific weather information in global variables. These global variables you can use in your own scripts, for example to send an email every morning with the weather forecast, send notifications of weather changes, etcetera. To use these Global Variables, set the QuickApp variable "setGlobalVar" to true.

-- Global Variables (if QuickApp variable setGlobalVar = true):
   -- brStation_[deviceID]
   -- brWeatherreport_[deviceID]
   -- brShortterm_[deviceID]
   -- brLongterm_[deviceID]
   -- brFivedayforecast_1_[deviceID]
   -- brFivedayforecast_2_[deviceID]
   -- brFivedayforecast_3_[deviceID]
   -- brFivedayforecast_4_[deviceID]
   -- brFivedayforecast_5_[deviceID]

-- Examples of the Global Variables:
 
-- brStation_[deviceID] -- {"regio":"Rotterdam","timestamp":"2020-08-22T11:40:00","airpressure":1013.1,"lat":51.95,"weatherdescription":"Zwaar bewolkt","rainFallLast24Hour":0.6,"feeltemperature":20.3,"precipitation":0.0,"stationname":"Meetstation Rotterdam","lon":4.45,"$id":"36","temperature":20.3,"graphUrl":"https:\/\/www.buienradar.nl\/nederland\/weerbericht\/weergrafieken\/c","windgusts":14.4,"sunpower":349.0,"rainFallLastHour":0.0,"winddirection":"ZW","stationid":6344,"groundtemperature":20.7,"winddirectiondegrees":215,"humidity":68.0,"windspeedBft":5,"windspeed":9.3,"visibility":25300.0,"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/c.png"}

-- brWeatherreport_[deviceID] -- {"published":"2020-08-22T10:00:00","authorbio":"Sinds 2017 als junior Meteoroloog actief voor het weekendteam van Buienradar. Daarnaast student van de Bachelor Bodem, Water & Atmosfeer aan de Wageningen Universiteit.","author":"Philippe Schambergen","text":"Na de warmte van de afgelopen weken gaat het roer nu flink om. De komende tijd is het wisselvallig in Nederland met normale temperaturen en vooral op woensdag staat er veel wind.Vandaag is het wisselend bewolkt en is het in het binnenland nog geruime tijd droog. In de loop van de dag gaan er vanuit het noordwesten buien vallen met in het noorden kans op onweer. Na het middaguur trekken deze buien verder landinwaarts. Tussen de buien door blijft er echter genoeg ruimte voor de zon. Het wordt 21 of 22 graden langs de kust en nog een zomerse 25 graden in het zuidoosten. Er staat een matige en aan zee krachtige zuidwestenwind, windkracht 4 tot 6. Ook komen er in heel het land windstoten rond de 50 km\/h voor, tijdens buien mogelijk oplopend tot 75 km\/h. Aan het eind van de middag komt er langs de zuidwestkust mogelijk een harde zuidwestenwind te staan, windkracht 7.Vanavond klaart het op en trekken de meeste buien naar het oosten weg. Het blijft nog even stevig waaien. Vannacht neemt de wind in het binnenland iets af en verdwijnen daar de windstoten. Er gaan wel opnieuw buien ontstaan in het noorden van het land. Het koelt af naar 17 graden aan zee en 14 graden in het binnenland.&nbsp;Morgen is het wisselend bewolkt en trekken enkele buien over het land. Er staat wel iets minder wind dan vandaag: de westenwind waait matig tot aan zee (vrij) krachtig. In de middag wordt het nog maar 20 graden op de Wadden en 22 graden in het zuidoosten van het land, waarmee de temperatuur rond normaal komt te liggen.De dagen erna is het wisselvallig met enkele buien waarbij het vooral in het noorden soms flink kan doorregenen. Een depressie ligt woensdag boven de Noordzee en deze zorgt dan voor een flinke toename van de wind. Mogelijk wordt het zelfs even stormachtig! In de middag wordt het 19 tot 22 graden, alleen dinsdag kan het in het zuidoosten wel weer 24 graden worden.","title":"Terug naar normaal","summary":"Na de warmte van de afgelopen weken gaat het roer nu flink om. De komende tijd is het wisselvallig in Nederland met normale temperaturen en vooral op woensdag staat er veel wind.","$id":"57"}

-- brShortterm_[deviceID] -- {"startdate":"2020-08-23T00:00:00","enddate":"2020-08-27T00:00:00","forecast":"Onbestendig met geregeld regen of enkele buien.","$id":"58"}

-- brLongterm_[deviceID] -- {"startdate":"2020-08-28T00:00:00","enddate":"2020-09-01T00:00:00","forecast":"Aanvankelijk onbestendig met maxima iets onder het langjarig gemiddelde. Later in de periode neemt de kans op een droger en warmer weertype toe.","$id":"59"}

-- brFivedayforecast_1_[deviceID] -- {"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/f.png","mintemperatureMin":15,"maxtemperatureMax":21,"weatherdescription":"Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature":"15","mintemperatureMax":15,"mmRainMax":5.0,"maxtemperature":"21","maxtemperatureMin":21,"wind":4,"windDirection":"w","mmRainMin":1.0,"sunChance":40,"day":"2020-08-23T00:00:00","rainChance":50,"$id":"60"}
 
-- brFivedayforecast_2_[deviceID] -- {"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/f.png","mintemperatureMin":14,"maxtemperatureMax":20,"weatherdescription":"Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature":"14\/15","mintemperatureMax":15,"mmRainMax":5.0,"maxtemperature":"19\/20","maxtemperatureMin":19,"wind":3,"windDirection":"w","mmRainMin":2.0,"sunChance":30,"day":"2020-08-24T00:00:00","rainChance":70,"$id":"61"}
 
-- brFivedayforecast_3_[deviceID] -- {"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/f.png","mintemperatureMin":13,"maxtemperatureMax":22,"weatherdescription":"Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature":"13\/15","mintemperatureMax":15,"mmRainMax":6.0,"maxtemperature":"20\/22","maxtemperatureMin":20,"wind":4,"windDirection":"zw","mmRainMin":2.0,"sunChance":30,"day":"2020-08-25T00:00:00","rainChance":80,"$id":"62"}
 
-- brFivedayforecast_4_[deviceID] -- {"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/f.png","mintemperatureMin":16,"maxtemperatureMax":21,"weatherdescription":"Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature":"16\/17","mintemperatureMax":17,"mmRainMax":3.0,"maxtemperature":"19\/21","maxtemperatureMin":19,"wind":5,"windDirection":"w","mmRainMin":1.0,"sunChance":30,"day":"2020-08-26T00:00:00","rainChance":60,"$id":"63"}

-- brFivedayforecast_5_[deviceID] -- {"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/f.png","mintemperatureMin":13,"maxtemperatureMax":20,"weatherdescription":"Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature":"13\/15","mintemperatureMax":15,"mmRainMax":3.0,"maxtemperature":"19\/20","maxtemperatureMin":19,"wind":3,"windDirection":"zw","mmRainMin":1.0,"sunChance":40,"day":"2020-08-27T00:00:00","rainChance":70,"$id":"64"}

-- JSON data copyright: (C)opyright Buienradar / RTL. All rights reserved
-- JSON data terms: This feed may be used freely under condition of source reference buienradar.nl including a hyperlink to https://www.buienradar.nl. The feed cannot be derived from users or other persons.


-- Below here no changes are needed


class 'brTemperature'(QuickAppChild)
function brTemperature:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("Buienradar Temperature QuickappChild initiated, deviceId:",self.id)
end
function brTemperature:updateValue(data) 
  self:updateProperty("value",tonumber(data.temperature))
  self:updateProperty("unit", "°C")
  self:updateProperty("log", "Feeltemp: " ..data.feeltemperature .." °C Ground: "..data.groundtemperature .." °C")
end


class 'brHumidity'(QuickAppChild)
function brHumidity:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("Buienradar Humidity QuickappChild initiated, deviceId:",self.id)
end
function brHumidity:updateValue(data) 
  self:updateProperty("value",tonumber(data.humidity))
  self:updateProperty("unit", "%")
end


class 'brHumidityAbs'(QuickAppChild)
function brHumidityAbs:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("Buienradar Absolute Humidity QuickappChild initiated, deviceId:",self.id)
end
function brHumidityAbs:updateValue(data) 
  self:updateProperty("value",tonumber(data.humidityabsolute))
  self:updateProperty("unit", "g/m³")
end


class 'brAirpressure'(QuickAppChild)
function brAirpressure:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("Buienradar Airpressure QuickappChild initiated, deviceId:",self.id)
end
function brAirpressure:updateValue(data) 
  self:updateProperty("value",tonumber(data.airpressure))
  self:updateProperty("unit", "hPa")
  self:updateProperty("log", data.airpressuretext)
end


class 'brWindspeed'(QuickAppChild)
function brWindspeed:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("Buienradar Windspeed QuickappChild initiated, deviceId:",self.id)
end
function brWindspeed:updateValue(data) 
  self:updateProperty("value",tonumber(data.windspeed))
  self:updateProperty("unit", "m/s")
  self:updateProperty("log", "Bft: " ..data.windspeedBft .." (" ..data.windspeed*3.6 .." km/h)" .." Windgust: " ..data.windgusts .." km/h")
end


class 'brWinddirection'(QuickAppChild)
function brWinddirection:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("Buienradar Winddirectiondegrees QuickappChild initiated, deviceId:",self.id)
end
function brWinddirection:updateValue(data) 
  self:updateProperty("value",tonumber(data.winddirectiondegrees))
  self:updateProperty("unit", "°")
  self:updateProperty("log", data.winddirection ..data.winddirectionarrow)
end


class 'brPrecipitation'(QuickAppChild)
function brPrecipitation:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("Buienradar Precipitation QuickappChild initiated, deviceId:",self.id)
end
function brPrecipitation:updateValue(data) 
  self:updateProperty("value",tonumber(data.precipitation))
  self:updateProperty("unit", "mm/h")
  self:updateProperty("log", "Last 24h: " ..data.rainFallLast24Hour .."mm")
end


class 'brSunpower'(QuickAppChild)
function brSunpower:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("Buienradar Sunpower QuickappChild initiated, deviceId:",self.id)
end
function brSunpower:updateValue(data) 
  self:updateProperty("value",tonumber(data.sunpower))
  self:updateProperty("unit", "watt/m²")
end


class 'brVisibility'(QuickAppChild)
function brVisibility:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("Buienradar Visibility QuickappChild initiated, deviceId:",self.id)
end
function brVisibility:updateValue(data) 
  self:updateProperty("value",tonumber(data.visibility)) 
  self:updateProperty("unit", "km")
end


class 'brSunset'(QuickAppChild)
function brSunset:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("Buienradar Sunset QuickappChild initiated, deviceId:",self.id)
end
function brSunset:updateValue(data) 
  self:updateProperty("value",tonumber(data.sunset)) 
  self:updateProperty("unit", "")
end


class 'brSunrise'(QuickAppChild)
function brSunrise:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("Buienradar Sunrise QuickappChild initiated, deviceId:",self.id)
end
function brSunrise:updateValue(data) 
  self:updateProperty("value",tonumber(data.sunrise)) 
  self:updateProperty("unit", "")
end


local function getChildVariable(child,varName)
  for _,v in ipairs(child.properties.quickAppVariables or {}) do
    if v.name==varName then return v.value end
  end
  return ""
end


-- Setup text for airpressure
function QuickApp:setPressuretext(airpressure)
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


-- Setup arrow for winddirection 
function QuickApp:setWinddirectionarrow(direction)
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


-- Calculate Absolute Humidity (based on Temperature, Relative Humidity and Airpressure)
function QuickApp:getHumidityAbs() -- Source from muhmuh at Fibaro forum
  local EXP = 2.71828182845904523536028747135266249775724709369995
  local humidityAbs = 0.622 * data.humidity/100 * (1.01325 * 10^(5.426651 - 2005.1 / (data.temperature + 273.15) + 0.00013869 * ((data.temperature + 273.15) * (data.temperature + 273.15) - 293700) / (data.temperature + 273.15) * (10^(0.000000000011965 * ((data.temperature + 273.15) * (data.temperature + 273.15) - 293700) * ((data.temperature + 273.15) * (data.temperature + 273.15) - 293700)) - 1) - 0.0044 * 10^((-0.0057148 * (374.11 - data.temperature)^1.25))) + (((data.temperature + 273.15) / 647.3) - 0.422) * (0.577 - ((data.temperature + 273.15) / 647.3)) * EXP^(0.000000000011965 * ((data.temperature + 273.15) * (data.temperature + 273.15) - 293700) * ((data.temperature + 273.15) * (data.temperature + 273.15) - 293700)) * 0.00980665) / (data.airpressure/1000 - data.humidity/100 * (1.01325 * 10^(5.426651 - 2005.1 / (data.temperature + 273.15) + 0.00013869 * ((data.temperature + 273.15) * (data.temperature + 273.15) - 293700) / (data.temperature + 273.15) * (10^(0.000000000011965 * ((data.temperature + 273.15) * (data.temperature + 273.15) - 293700) * ((data.temperature + 273.15) * (data.temperature + 273.15) - 293700)) - 1) - 0.0044 * 10^((-0.0057148 * (374.11 - data.temperature)^1.25))) + (((data.temperature + 273.15) / 647.3) - 0.422) * (0.577 - ((data.temperature + 273.15) / 647.3)) * EXP^(0.000000000011965 * ((data.temperature + 273.15) * (data.temperature + 273.15) - 293700) * ((data.temperature + 273.15) * (data.temperature + 273.15) - 293700)) * 0.00980665)) * data.airpressure/1000 * 100000000 / ((data.temperature + 273.15) * 287.1)
  return string.format("%.2f",humidityAbs)
end


-- Show warning if data from backup station is used
function QuickApp:showWarningBackupData(var)
  if stationWarning == "on" then
    self:warning("No " ..var .." data from station " ..stationname .." available, using data from backup station " ..backupstationname)
  end
end


-- Refresh button event
function QuickApp:button1Event()
  self:updateView("button1", "text", "Please wait...")
  self:getWeatherData()
  fibaro.setTimeout(timeout*1000, function() -- Pause for [timeout] seconds (default 5 seconds)
    self:updateView("button1", "text", "Refresh")
  end)
end


-- Logging function for debug
function QuickApp:logging(level,text)
  if tonumber(debugLevel) >= tonumber(level) then 
      self:debug(text)
  end
end


-- Update weather condition, update properties "ConditionCode" and "WeatherCondition"
function QuickApp:setCondition(condition)
   conditionCodes = {unavailable = 3200, clear = 32, rain = 40, snow = 43, storm = 38, cloudy = 30, fog = 20,}
   conditionCode = conditionCodes[condition]
   condition = condition
   if conditionCode then
      self:updateProperty("ConditionCode", conditionCode)
      self:updateProperty("WeatherCondition", condition)
   end
end


-- Update properties and labels 
function QuickApp:setPropertiesLabels()
  local labelText = regio .." (" ..stationname .." - " ..stationID ..")" .."\n" 
  labelText = labelText ..weatherdescription .."\n\n" 
  labelText = labelText .."Temperature: " ..data.temperature .." °C (Feels: " ..data.feeltemperature .." °C Ground: " ..data.groundtemperature .." °C)" .."\n"
  labelText = labelText .."Humidity: " ..data.humidity .." %" .."\n" 
  labelText = labelText .."Absolute humidity: " ..data.humidityabsolute .." g/m³" .."\n" 
  labelText = labelText .."Air pressure: " ..data.airpressure .." hPa (" ..data.airpressuretext ..")" .."\n\n" 
  labelText = labelText .."Rain: " ..data.precipitation .." mm/h" .."\n" 
  labelText = labelText .."Last 24h: " ..data.rainFallLast24Hour .." mm/h" .."\n\n" 
  labelText = labelText .."Wind: " ..data.winddirection .." " ..data.windspeed .." m/s (" ..data.windspeedBft .." Bft " ..data.windspeed*3.6 .." km/h)" .."\n" 
  labelText = labelText .."Windgusts: "..data.windgusts .." m/s" .."\n\n" 
  labelText = labelText .."Sunpower: " ..data.sunpower .." watt/m²" .."\n" 
  labelText = labelText .."Visibility: "  ..data.visibility .." km" .."\n\n" 
  labelText = labelText .."Sunset: " ..data.sunset .." - Sunrise: " ..data.sunrise .."\n\n"
  labelText = labelText .."Measured: " ..timestamp

  self:updateView("label1", "text", labelText)
  self:logging(2,labelText)

  self:updateProperty("log", regio)

  -- Update Weatherstation values
  self:updateProperty("Temperature", tonumber(data.temperature))
  self:updateProperty("Humidity", tonumber(data.humidity))
  self:updateProperty("Wind", tonumber(data.windspeed)*3.6) -- From m/s to km/h
  --self:updateProperty("Pressure", tonumber(data.airpressure))
end 


-- Set Weathercondition
function QuickApp:setWeathercondition()
   -- Update Condition (to be completed), unmapped weatherdescription are logged as warning
   if weatherdescription == "Zwaar bewolkt" or weatherdescription == "Mix van opklaringen en middelbare of lage bewolking" or weatherdescription == "Mix van opklaringen en hoge bewolking" or weatherdescription == "Half bewolkt" or weatherdescription == "Opklaringen en kans op enkele pittige (onweers)buien" or weatherdescription == "Bewolkt en kans op enkele pittige (onweers)buien" then self:setCondition("cloudy")
   elseif weatherdescription == "Zwaar bewolkt en regen" or weatherdescription == "Afwisselend bewolkt met (mogelijk) wat lichte regen" or weatherdescription == "Zwaar bewolkt met wat lichte regen" then self:setCondition("rain")
   elseif weatherdescription == "Vrijwel onbewolkt (zonnig/helder)" then self:setCondition("clear")
   elseif weatherdescription == "Sneeuw" or weatherdescription == "Zwaar bewolkt met lichte sneeuwval" or weatherdescription == "Afwisselend bewolkt met lichte sneeuwval" or weatherdescription == "Zware sneeuwval" then self:setCondition("snow")
   elseif weatherdescription == "Storm" then self:setCondition("storm")
   elseif weatherdescription == "Mistig" or weatherdescription == "Afwisselend bewolkt met lokaal mist(banken)" or weatherdescription == "Opklaring en lokaal nevel of mist" then self:setCondition("fog")
   else -- Unable to set the Condition to a known one
      self:setCondition("unavailable") 
      self:warning("Weatherdescription unavailable: " ..weatherdescription)
   end 
end


-- Fill the Buienradar Global Variable
function QuickApp:setGlobalVariable(tag,res)
  if setGlobalVar == "true" then 
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


-- Delete the Buienradar Global Variable 
function QuickApp:deleteGlobalVariable(tag)
   local responseData, status = api.delete("/globalVariables/"..tag) 
   self:trace("Global Variable deleted: " ..tag .." / status: " ..status)
end


-- Get all weather data from json
function QuickApp:onWeatherDataReceived(jsonTable)
  -- Get the values from the stationID
  stationname = ""
  for i in pairs(jsonTable.actual.stationmeasurements) do 
      self:logging(3,jsonTable.actual.stationmeasurements[i].stationid .." " ..jsonTable.actual.stationmeasurements[i].stationname)
    if stationID == jsonTable.actual.stationmeasurements[i].stationid then
      data  = {}
      -- The main data values
      data.temperature = jsonTable.actual.stationmeasurements[i].temperature
      data.feeltemperature = jsonTable.actual.stationmeasurements[i].feeltemperature
      data.groundtemperature = jsonTable.actual.stationmeasurements[i].groundtemperature
      data.humidity = jsonTable.actual.stationmeasurements[i].humidity
      data.airpressure = jsonTable.actual.stationmeasurements[i].airpressure
      data.windspeed = jsonTable.actual.stationmeasurements[i].windspeed
      data.winddirection = jsonTable.actual.stationmeasurements[i].winddirection
      data.windspeedBft = jsonTable.actual.stationmeasurements[i].windspeedBft
      data.windgusts = jsonTable.actual.stationmeasurements[i].windgusts
      data.winddirectiondegrees = jsonTable.actual.stationmeasurements[i].winddirectiondegrees
      data.precipitation = jsonTable.actual.stationmeasurements[i].precipitation
      data.rainFallLast24Hour = jsonTable.actual.stationmeasurements[i].rainFallLast24Hour
      data.sunpower = jsonTable.actual.stationmeasurements[i].sunpower
      data.visibility = jsonTable.actual.stationmeasurements[i].visibility
      data.sunrise = jsonTable.actual.sunrise
      data.sunset = jsonTable.actual.sunset

      -- The extra data values
      stationname = jsonTable.actual.stationmeasurements[i].stationname
      regio = jsonTable.actual.stationmeasurements[i].regio
      weatherdescription = jsonTable.actual.stationmeasurements[i].weatherdescription
      timestamp = string.gsub(jsonTable.actual.stationmeasurements[i].timestamp, "T", " ")

      -- Save Station specific weather values to Global Variable
      self:setGlobalVariable("brStation_"..plugin.mainDeviceId,jsonTable.actual.stationmeasurements[i])
    end
    if backupstationID == jsonTable.actual.stationmeasurements[i].stationid then
      backupstationname = jsonTable.actual.stationmeasurements[i].stationname
      backuptemperature = jsonTable.actual.stationmeasurements[i].temperature
      backupfeeltemperature = jsonTable.actual.stationmeasurements[i].feeltemperature
      backupgroundtemperature = jsonTable.actual.stationmeasurements[i].groundtemperature
      backuphumidity = jsonTable.actual.stationmeasurements[i].humidity
      backupairpressure = jsonTable.actual.stationmeasurements[i].airpressure
      backupwindspeed = jsonTable.actual.stationmeasurements[i].windspeed
      backupwinddirection = jsonTable.actual.stationmeasurements[i].winddirection
      backupwindspeedBft = jsonTable.actual.stationmeasurements[i].windspeedBft
      backupwindgusts = jsonTable.actual.stationmeasurements[i].windgusts
      backupwinddirectiondegrees = jsonTable.actual.stationmeasurements[i].winddirectiondegrees
      backupprecipitation = jsonTable.actual.stationmeasurements[i].precipitation
      backuprainFallLast24Hour = jsonTable.actual.stationmeasurements[i].rainFallLast24Hour
      backupsunpower = jsonTable.actual.stationmeasurements[i].sunpower
      backupvisibility = jsonTable.actual.stationmeasurements[i].visibility
    end
  end

  -- Save generiek weather values to Global Variables
  self:setGlobalVariable("brWeatherreport_"..plugin.mainDeviceId,jsonTable.forecast.weatherreport)
  self:setGlobalVariable("brShortterm_"..plugin.mainDeviceId,jsonTable.forecast.shortterm)
  self:setGlobalVariable("brLongterm_"..plugin.mainDeviceId,jsonTable.forecast.longterm)
  self:setGlobalVariable("brFivedayforecast_1_"..plugin.mainDeviceId,jsonTable.forecast.fivedayforecast[1])
  self:setGlobalVariable("brFivedayforecast_2_"..plugin.mainDeviceId,jsonTable.forecast.fivedayforecast[2])
  self:setGlobalVariable("brFivedayforecast_3_"..plugin.mainDeviceId,jsonTable.forecast.fivedayforecast[3])
  self:setGlobalVariable("brFivedayforecast_4_"..plugin.mainDeviceId,jsonTable.forecast.fivedayforecast[4])
  self:setGlobalVariable("brFivedayforecast_5_"..plugin.mainDeviceId,jsonTable.forecast.fivedayforecast[5])

  -- Check if variables have a value
  if stationname == "" or stationname == nil then
    self:error("Error: Station " ..stationID .." not found!")
  else
    if regio == "" or regio == nil then regio = "empty" end
    if weatherdescription == "" or weatherdescription == nil then weatherdescription = "empty" end
    if timestamp == "" or timestamp == nil then timestamp = "empty" end
    if data.temperature == "" or data.temperature == nil then data.temperature = backuptemperature; self:showWarningBackupData("temperature"); end
    if data.feeltemperature == "" or data.feeltemperature == nil then data.feeltemperature = backupfeeltemperature; self:showWarningBackupData("feeltemperature"); end
    if data.humidity == "" or data.humidity == nil then data.humidity = backuphumidity; self:showWarningBackupData("humidity"); end
    if data.windspeed == "" or data.windspeed == nil then data.windspeed = backupwindspeed; self:showWarningBackupData("windspeed"); end
    if data.groundtemperature  == "" or data.groundtemperature == nil then data.groundtemperature = backupgroundtemperature; self:showWarningBackupData("groundtemperature"); end
    if data.airpressure == "" or data.airpressure == nil then data.airpressure = backupairpressure; self:showWarningBackupData("airpressure"); end
    if data.precipitation == "" or data.precipitation == nil then data.precipitation = backupprecipitation; self:showWarningBackupData("rain"); end
    if data.rainFallLast24Hour == "" or data.rainFallLast24Hour == nil then data.rainFallLast24Hour = backuprainFallLast24Hour; self:showWarningBackupData("rainFallLast24Hour"); end
    if data.sunpower == "" or data.sunpower == nil then data.sunpower = backupsunpower; self:showWarningBackupData("sunpower"); end
    if data.visibility == "" or data.visibility == nil then data.visibility = backupvisibility; self:showWarningBackupData("visibility"); end
    if data.winddirection == "" or data.winddirection == nil then data.winddirection = backupwinddirection; self:showWarningBackupData("winddirection"); end
    if data.windspeedBft == "" or data.windspeedBft == nil then data.windspeedBft = backupwindspeedBft; self:showWarningBackupData("windspeedBft"); end
    if data.windgusts == "" or data.windgusts == nil then data.windgusts = backupwindgust; self:showWarningBackupData("windgusts"); end
    if data.winddirectiondegrees == "" or data.winddirectiondegrees == nil then data.winddirectiondegrees = backupwinddirectiondegrees; self:showWarningBackupData("winddirection degrees"); end
    stationWarning = "off" -- Set warnings for missing data from station "off"

    -- Format the data (to prevent error with nil values from json data)
    data.temperature = tostring(data.temperature)
    data.feeltemperature = tostring(data.feeltemperature)
    data.groundtemperature = tostring(data.groundtemperature)
    data.humidity = tostring(string.format("%.0f",data.humidity))
    data.airpressure = tostring(string.format("%.0f",data.airpressure))
    data.windspeed = tostring(string.format("%.1f",data.windspeed/3.6))
    data.winddirection = tostring(data.winddirection)
    data.windspeedBft = tostring(string.format("%.0f",data.windspeedBft))
    data.windgusts = tostring(data.windgusts)
    data.winddirectiondegrees = tostring(data.winddirectiondegrees)
    data.precipitation = tostring(data.precipitation)
    data.rainFallLast24Hour = tostring(data.rainFallLast24Hour)
    data.sunpower = tostring(string.format("%.0f",data.sunpower))
    data.visibility = tostring(data.visibility /1000)
    data.sunrise = string.gsub(string.sub(data.sunrise,-8,-4),":",".")
    data.sunset = string.gsub(string.sub(data.sunset,-8,-4),":",".")

    data.humidityabsolute = self:getHumidityAbs() -- Calculate Absolute Humidity
    data.winddirectionarrow = self:setWinddirectionarrow(data.winddirection) -- Setup Winddirection Arrow
    data.airpressuretext = self:setPressuretext(data.airpressure) -- Setup Airpressure Text

    -- Update Child Devices
    for id,child in pairs(self.childDevices) do 
      child:updateValue(data) 
    end

    self:setWeathercondition() -- Go to setup Weathercondition
    self:setPropertiesLabels() -- Go to setup Properties and Labels
  end
end


-- Fetch all weather data from Buienradar url
function QuickApp:getWeatherData()
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


-- Manage the QuickApp variables
function QuickApp:getQuickAppVariables()
  interval = tonumber(self:getVariable("interval")) 
  stationID = tonumber(self:getVariable("stationID")) 
  backupstationID = tonumber(self:getVariable("backupstationID")) 
  timeout = tonumber(self:getVariable("timeout")) 
  setGlobalVar = self:getVariable("setGlobalVar")
  debugLevel = tonumber(self:getVariable("debugLevel"))
  stationWarning = "on" -- variable for on/off warnings missing data stations

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
end 


-- Setup Child Devices
function QuickApp:setupChildDevices()
  local cdevs = api.get("/devices?parentId="..self.id) or {} -- Pick up all Child Devices
  function self:initChildDevices() end -- Null function, else Fibaro calls it after onInit()...

  if #cdevs == 0 then -- If no Child Devices, create them
    local initChildData = { 
      {className="brTemperature", name="Temperature", type="com.fibaro.temperatureSensor", value=0, unit="°C"},
      {className="brHumidity", name="Humidity", type="com.fibaro.humiditySensor", value=0, unit="%"},
      {className="brHumidityAbs", name="Absolute Humidity", type="com.fibaro.multilevelSensor", value=0, unit="g/m³"},
      {className="brAirpressure", name="Airpressure", type="com.fibaro.multilevelSensor", value=0, unit="hPa"},
      {className="brWindspeed", name="Windspeed", type="com.fibaro.multilevelSensor", value=0, unit="m/s"},
      {className="brWinddirection", name="Winddirection", type="com.fibaro.multilevelSensor", value=0, unit="°"},
      {className="brPrecipitation", name="Rain", type="com.fibaro.multilevelSensor", value=0, unit="mm/h"},
      {className="brSunpower", name="Sunpower", type="com.fibaro.multilevelSensor", value=0, unit="watt/m²"},
      {className="brVisibility", name="Visibility", type="com.fibaro.multilevelSensor", value=0, unit="km"},
      {className="brSunset", name="Sunset", type="com.fibaro.multilevelSensor", value=0, unit=""},
      {className="brSunrise", name="Sunrise", type="com.fibaro.multilevelSensor", value=0, unit=""},
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
  self:debug("onInit")
  self:setupChildDevices()
  self:getQuickAppVariables()  
  http = net.HTTPClient({timeout=timeout})
  self:getWeatherData()
end

-- EOF
