-- QuickApp BUIENRADAR WEATHER 

-- This QuickApp can be used as your weather provider. The Buienradar Weather contains the current Dutch weather measurements, the weather forecast and the 5-day forecast. The current observations are measured by KNMI weather stations spread across the country and are updated every 10 minutes. The weather report is updated several times a day by the Buienradar meteorologists.

-- JSON data copyright: (C)opyright Buienradar / RTL. All rights reserved
-- JSON data terms: This feed may be used freely under condition of source reference buienradar.nl including a hyperlink to https://www.buienradar.nl. The feed cannot be derived from users or other persons.

-- Wind Chill (based on the JAG/TI-method)
   -- is only valid for temperatures between -46 C and +10 C
   -- is only valid for wind speed between 1.3 m/s and 49 m/s

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
   -- error message instead of debug message in case of an error
   -- Changed method of adding QuickApp variables, so they can be edited

-- conditionCodes = {unavailable = 3200, clear = 32, rain = 40, snow = 43, storm = 38, cloudy = 30, fog = 20,}

-- Station ID's and Stations: 
-- 6391 Meetstation Arcen / 6275 Meetstation Arnhem / 6249 Meetstation Berkhout / 6308 Meetstation Cadzand / 6260 Meetstation De Bilt / 6235 Meetstation Den Helder / 6370 Meetstation Eindhoven / 6377 Meetstation Ell / 6321 Meetstation Euro platform / 6350 Meetstation Gilze Rijen / 6323 Meetstation Goes / 6283 Meetstation Groenlo-Hupsel / 6280 Meetstation Groningen / 6315 Meetstation Hansweert /  6278 Meetstation Heino /  6356 Meetstation Herwijnen /  6330 Meetstation Hoek van Holland /  6279 Meetstation Hoogeveen / 6251 Meetstation Hoorn Terschelling /  6258 Meetstation Houtribdijk / 6285 Meetstation Huibertgat / 6209 Meetstation IJmond /  6225 Meetstation IJmuiden /  6277 Meetstation Lauwersoog / 6320 Meetstation LE Goeree / 6270 Meetstation Leeuwarden / 6269 Meetstation Lelystad / 6348 Meetstation Lopik-Cabauw / 6380 Meetstation Maastricht / 6273 Meetstation Marknesse / 6286 Meetstation Nieuw Beerta / 6312 Meetstation Oosterschelde / 6344 Meetstation Rotterdam / 6343 Meetstation Rotterdam Geulhaven / 6316 Meetstation Schaar / 6240 Meetstation Schiphol / 6324 Meetstation Stavenisse / 6267 Meetstation Stavoren / 6229 Meetstation Texelhors / 6331 Meetstation Tholen / 6290 Meetstation Twente / 6313 Meetstation Vlakte aan de Raan / 6242 Meetstation Vlieland / 6310 Meetstation Vlissingen / 6375 Meetstation Volkel / 6215 Meetstation Voorschoten / 6319 Meetstation Westdorpe / 6248 Meetstation Wijdenes / 6257 Meetstation Wijk aan Zee / 6340 Meetstation Woensdrecht / 6239 Meetstation Zeeplatform F-3 / 6252 Meetstation Zeeplatform K13

-- QuickApp Variables mandatory:
-- interval = Number in seconds to update the data
-- timeout = Number in seconds to wait for a response 
-- stationID = Number of the station you want to use for weather measurements
-- setGlobalVar = true or false, whether you want tu use the Global Variables

-- This QuickApp can store all general and station specific weather information in global variables. These global variables you can use in your own scripts, for example to send an email every morning with the weather forecast, send notifications of weather changes, etcetera. To use these Global Variables, set the QuickApp variable "setGlobalVar" to true.

-- Global Variables (if QuickApp variable setGlobalVar = true):
   -- brShortterm_[deviceID]
   -- brLongterm_[deviceID]
   -- brFivedayforecast_1_[deviceID]
   -- brFivedayforecast_2_[deviceID]
   -- brFivedayforecast_3_[deviceID]
   -- brFivedayforecast_4_[deviceID]
   -- brFivedayforecast_5_[deviceID]
   -- brWeatherreport_[deviceID]
   -- brStation_[deviceID]

-- Examples of the Global Variables:
 
   -- brShortterm_[deviceID] -- {"startdate":"2020-08-23T00:00:00","enddate":"2020-08-27T00:00:00","forecast":"Onbestendig met geregeld regen of enkele buien.","$id":"58"}

   -- brLongterm_[deviceID] -- {"startdate":"2020-08-28T00:00:00","enddate":"2020-09-01T00:00:00","forecast":"Aanvankelijk onbestendig met maxima iets onder het langjarig gemiddelde. Later in de periode neemt de kans op een droger en warmer weertype toe.","$id":"59"}

   -- brFivedayforecast_1_[deviceID] -- {"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/f.png","mintemperatureMin":15,"maxtemperatureMax":21,"weatherdescription":"Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature":"15","mintemperatureMax":15,"mmRainMax":5.0,"maxtemperature":"21","maxtemperatureMin":21,"wind":4,"windDirection":"w","mmRainMin":1.0,"sunChance":40,"day":"2020-08-23T00:00:00","rainChance":50,"$id":"60"}
 
   -- brFivedayforecast_2_[deviceID] -- {"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/f.png","mintemperatureMin":14,"maxtemperatureMax":20,"weatherdescription":"Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature":"14\/15","mintemperatureMax":15,"mmRainMax":5.0,"maxtemperature":"19\/20","maxtemperatureMin":19,"wind":3,"windDirection":"w","mmRainMin":2.0,"sunChance":30,"day":"2020-08-24T00:00:00","rainChance":70,"$id":"61"}
 
   -- brFivedayforecast_3_[deviceID] -- {"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/f.png","mintemperatureMin":13,"maxtemperatureMax":22,"weatherdescription":"Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature":"13\/15","mintemperatureMax":15,"mmRainMax":6.0,"maxtemperature":"20\/22","maxtemperatureMin":20,"wind":4,"windDirection":"zw","mmRainMin":2.0,"sunChance":30,"day":"2020-08-25T00:00:00","rainChance":80,"$id":"62"}
 
   -- brFivedayforecast_4_[deviceID] -- {"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/f.png","mintemperatureMin":16,"maxtemperatureMax":21,"weatherdescription":"Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature":"16\/17","mintemperatureMax":17,"mmRainMax":3.0,"maxtemperature":"19\/21","maxtemperatureMin":19,"wind":5,"windDirection":"w","mmRainMin":1.0,"sunChance":30,"day":"2020-08-26T00:00:00","rainChance":60,"$id":"63"}

   -- brFivedayforecast_5_[deviceID] -- {"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/f.png","mintemperatureMin":13,"maxtemperatureMax":20,"weatherdescription":"Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature":"13\/15","mintemperatureMax":15,"mmRainMax":3.0,"maxtemperature":"19\/20","maxtemperatureMin":19,"wind":3,"windDirection":"zw","mmRainMin":1.0,"sunChance":40,"day":"2020-08-27T00:00:00","rainChance":70,"$id":"64"}

   -- brWeatherreport_[deviceID] -- {"published":"2020-08-22T10:00:00","authorbio":"Sinds 2017 als junior Meteoroloog actief voor het weekendteam van Buienradar. Daarnaast student van de Bachelor Bodem, Water & Atmosfeer aan de Wageningen Universiteit.","author":"Philippe Schambergen","text":"Na de warmte van de afgelopen weken gaat het roer nu flink om. De komende tijd is het wisselvallig in Nederland met normale temperaturen en vooral op woensdag staat er veel wind.Vandaag is het wisselend bewolkt en is het in het binnenland nog geruime tijd droog. In de loop van de dag gaan er vanuit het noordwesten buien vallen met in het noorden kans op onweer. Na het middaguur trekken deze buien verder landinwaarts. Tussen de buien door blijft er echter genoeg ruimte voor de zon. Het wordt 21 of 22 graden langs de kust en nog een zomerse 25 graden in het zuidoosten. Er staat een matige en aan zee krachtige zuidwestenwind, windkracht 4 tot 6. Ook komen er in heel het land windstoten rond de 50 km\/h voor, tijdens buien mogelijk oplopend tot 75 km\/h. Aan het eind van de middag komt er langs de zuidwestkust mogelijk een harde zuidwestenwind te staan, windkracht 7.Vanavond klaart het op en trekken de meeste buien naar het oosten weg. Het blijft nog even stevig waaien. Vannacht neemt de wind in het binnenland iets af en verdwijnen daar de windstoten. Er gaan wel opnieuw buien ontstaan in het noorden van het land. Het koelt af naar 17 graden aan zee en 14 graden in het binnenland.&nbsp;Morgen is het wisselend bewolkt en trekken enkele buien over het land. Er staat wel iets minder wind dan vandaag: de westenwind waait matig tot aan zee (vrij) krachtig. In de middag wordt het nog maar 20 graden op de Wadden en 22 graden in het zuidoosten van het land, waarmee de temperatuur rond normaal komt te liggen.De dagen erna is het wisselvallig met enkele buien waarbij het vooral in het noorden soms flink kan doorregenen. Een depressie ligt woensdag boven de Noordzee en deze zorgt dan voor een flinke toename van de wind. Mogelijk wordt het zelfs even stormachtig! In de middag wordt het 19 tot 22 graden, alleen dinsdag kan het in het zuidoosten wel weer 24 graden worden.","title":"Terug naar normaal","summary":"Na de warmte van de afgelopen weken gaat het roer nu flink om. De komende tijd is het wisselvallig in Nederland met normale temperaturen en vooral op woensdag staat er veel wind.","$id":"57"}

   -- brStation_[deviceID] -- {"regio":"Rotterdam","timestamp":"2020-08-22T11:40:00","airpressure":1013.1,"lat":51.95,"weatherdescription":"Zwaar bewolkt","rainFallLast24Hour":0.6,"feeltemperature":20.3,"precipitation":0.0,"stationname":"Meetstation Rotterdam","lon":4.45,"$id":"36","temperature":20.3,"graphUrl":"https:\/\/www.buienradar.nl\/nederland\/weerbericht\/weergrafieken\/c","windgusts":14.4,"sunpower":349.0,"rainFallLastHour":0.0,"winddirection":"ZW","stationid":6344,"groundtemperature":20.7,"winddirectiondegrees":215,"humidity":68.0,"windspeedBft":5,"windspeed":9.3,"visibility":25300.0,"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/c.png"}


--ToDo:
-- local _createdVars={} -- cache api.get lookups for efficiency
-- function fibaro.setGlobalVariable(name, value, create)
--  if _createdVars[name] or api.get("/globalVariables/"..name) then
--      local _,code = api.put("/globalVariables/"..name,{value=value}). -- set value
--      if code==404 then -- Someone deleted the global for us - reset cache and redo
--       _createdVars[name]=nil
--       fibaro.setGlobalVariable(name, value, create) 
--      end
--   elseif create then
--     api.post("/globalVariables",{name=name,value=value}). -- create variable with value
--  else error("Global variable "..name.." doesn't exist") end
--  _createdVars[name]=true 
-- end

-- Below here no changes are needed


-- Fill the Buienradar Global Variable
function QuickApp:setGlobalVariable(tag,res)
   --self:debug("res: ",json.encode(res))
   if setGlobalVar == "true" then 
      if api.get("/globalVariables/"..tag) == nil then
         local responseData, status = api.post("/globalVariables/",{value=(json.encode(res)),name=tag})
         self:trace("Global Variable created: " ..tag .." / status: " ..status) 
      else
         local responseData, status = api.put("/globalVariables/"..tag,{value=(json.encode(res))})
         --self:trace("Global Variable updated: " ..tag .." / status: " ..status)
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


-- Set Weathercondition
function QuickApp:setWeathercondition()
   -- Update Condition (to be completed), unmapped weatherdescription are logged as warning
   if weatherdescription == "Zwaar bewolkt" or weatherdescription == "Mix van opklaringen en middelbare of lage bewolking" then self:setCondition("cloudy")
   elseif weatherdescription == "Zwaar bewolkt en regen" or weatherdescription == "Afwisselend bewolkt met (mogelijk) wat lichte regen" then self:setCondition("rain")
   elseif weatherdescription == "Vrijwel onbewolkt (zonnig/helder)" then self:setCondition("clear")
   elseif weatherdescription == "Sneeuw" then self:setCondition("snow")
   elseif weatherdescription == "Storm" then self:setCondition("storm")
   elseif weatherdescription == "Mistig" or weatherdescription == "Afwisselend bewolkt met lokaal mist(banken)" then self:setCondition("fog")
   else -- Unable to set the Condition to a known one
      self:setCondition("unavailable") 
      self:warning("Weatherdescription unavailable: " ..weatherdescription)
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


-- Fetch all weather data from Buienradar url
function QuickApp:getWeatherData()
   local url = "https://data.buienradar.nl/2.0/feed/json"
   --self:debug("Connecting: ", url)
   http:request(url, {
      options={
         method = 'GET'
      },
      success = function(response)
         --self:debug("response status:", response.status)
         --self:debug("headers:", response.headers["Content-Type"])
         --self:debug("Response: "..response.data)
         local jsonTable = json.decode(response.data)

         if jsonTable then 
           -- Save generiek weather values to Global Variables
           self:setGlobalVariable("brShortterm_"..plugin.mainDeviceId,jsonTable.forecast.shortterm)
           self:setGlobalVariable("brLongterm_"..plugin.mainDeviceId,jsonTable.forecast.longterm)
           self:setGlobalVariable("brFivedayforecast_1_"..plugin.mainDeviceId,jsonTable.forecast.fivedayforecast[1])
           self:setGlobalVariable("brFivedayforecast_2_"..plugin.mainDeviceId,jsonTable.forecast.fivedayforecast[2])
           self:setGlobalVariable("brFivedayforecast_3_"..plugin.mainDeviceId,jsonTable.forecast.fivedayforecast[3])
           self:setGlobalVariable("brFivedayforecast_4_"..plugin.mainDeviceId,jsonTable.forecast.fivedayforecast[4])
           self:setGlobalVariable("brFivedayforecast_5_"..plugin.mainDeviceId,jsonTable.forecast.fivedayforecast[5])
           self:setGlobalVariable("brWeatherreport_"..plugin.mainDeviceId,jsonTable.forecast.weatherreport)

           self:onWeatherDataReceived(jsonTable) 
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


-- Get all weather data from json
function QuickApp:onWeatherDataReceived(data)
   -- Get the values from the stationID
   for i in pairs(data.actual.stationmeasurements) do 
       --self:debug(jsonTable.actual.stationmeasurements[i].stationid .." " ..data.actual.stationmeasurements[i].stationname)
       if stationID == data.actual.stationmeasurements[i].stationid then

          -- The main values
          temperature = tostring(data.actual.stationmeasurements[i].temperature)
          humidity = tostring(data.actual.stationmeasurements[i].humidity)
          windspeed = tostring(data.actual.stationmeasurements[i].windspeed)
          self:debug("windspeed: " ..windspeed)

          -- The extra values
          stationname = data.actual.stationmeasurements[i].stationname
          feeltemperature = tostring(data.actual.stationmeasurements[i].feeltemperature)
          regio = data.actual.stationmeasurements[i].regio
          weatherdescription = data.actual.stationmeasurements[i].weatherdescription
          winddirection = data.actual.stationmeasurements[i].winddirection
          airpressure = tostring(data.actual.stationmeasurements[i].airpressure)


         -- Save Station specific weather values to Global Variable
          self:setGlobalVariable("brStation_"..plugin.mainDeviceId,data.actual.stationmeasurements[i])

       end
   end

   -- Check if variables have a value
   if stationname == "" or stationname == nil then
      self:warning("error: Station " ..stationID .." not found!")
   else 
      if regio == "" or regio == nil then
         regio = "empty"
      end
      if temperature == "" or temperature == nil then
         temperature = "999"
      end
      if feeltemperature == "" or feeltemperature == nil then
         feeltemperature = "999"
      end
      if humidity == "" or humidity == nil then
         humidity = "999"
      end
      if windspeed == "" or windspeed == nil then
         windspeed = "999"
      end
      if weatherdescription == "" or weatherdescription == nil then
         weatherdescription = "empty"
      end
      if winddirection == "" or winddirection == nil then
         winddirection = "unknown"
      end
      if airpressure == "" or airpressure == nil then
         airpressure = "0"
      end
      self:setWeathercondition()
      self:setPropertiesLables()
   end

   --self:debug("------ END ------")

end


-- Update properties and labels 
function QuickApp:setPropertiesLables()
   self:updateProperty("log", regio)
   self:updateView("labelStationname", "text", regio .." (" ..stationname .." - " ..stationID ..")")

   self:updateView("labelWeatherdescription", "text", weatherdescription)
   
   self:updateProperty("Temperature", tonumber(temperature))
   self:updateView("labelTemperature", "text", "Temperature: " ..temperature .." °C (feels: " ..feeltemperature .." °C)")

   self:updateProperty("Humidity", tonumber(humidity))
   self:updateView("labelHumidity", "text", "Humidity: " ..humidity .." %")

   self:updateProperty("Wind", tonumber(windspeed))
   self:updateView("labelWind", "text", "Wind: " ..winddirection .." " ..windspeed .." m/s")

   self:updateView("labelAirpressure", "text", "Air pressure: " ..airpressure .." hPa")

   self:debug("Station: ", stationname .." (" ..stationID ..") / Weatherdescription: " ..weatherdescription .." / Temperature: " ..temperature .." (" ..feeltemperature ..") / Humidity: " ..humidity .." / Wind: " ..winddirection .." " ..windspeed .." / Air pressure: " ..airpressure)

end 


-- Manage the QuickApp variables
function QuickApp:getQuickAppVariables()
   interval = tonumber(self:getVariable("interval")) 
   stationID = tonumber(self:getVariable("stationID")) 
   timeout = tonumber(self:getVariable("timeout")) 
   setGlobalVar = self:getVariable("setGlobalVar")

   -- Check existence of the mandatory variables, if not, create them with default values 
   if interval == "" or interval == nil then
      interval = "601" -- Default interval in seconds (Buienradar updates every 10 minutes)
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
   if timeout == "" or timeout == nil then
      timeout = "5" -- Default value for timeout response in seconds
      self:setVariable("timeout",timeout)
      self:trace("Added QuickApp variable timeout")
      timeout = tonumber(timeout)
   end
   if setGlobalVar == "" or setGlobalVar == nil then 
      setGlobalVar = false -- Default SetGlobalVar is falso (No use of Global Variables)
      self:setVariable("setGlobalVar",tostring(setGlobalVar))
      self:trace("Added QuickApp variable setGlobalVar")
   end
end


function QuickApp:onInit()
   __TAG = "BUIENRADAR_WEATHER_"..plugin.mainDeviceId
   self:debug("onInit")  
   self:getQuickAppVariables()  
   http = net.HTTPClient({timeout=timeout})
   self:getWeatherData()
end

