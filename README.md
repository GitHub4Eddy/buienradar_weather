# buienradar_weather

QuickApp BUIENRADAR WEATHER 

The current observations are measured by KNMI weather stations spread across the country and are updated every 10 minutes. The weather report is updated several times a day by the Buienradar meteorologists.

JSON data copyright: (C)opyright Buienradar / RTL. All rights reserved
JSON data terms: This feed may be used freely under condition of source reference buienradar.nl including a hyperlink to https://www.buienradar.nl. The feed cannot be derived from users or other persons.

Version 0.4 (23rd August 2020) 
   Completely renewed code
   Several Global Variables are available for personal use
   Addes QuickApp variable SetGlobalVar true or false, whether you want to use the Global Variables
   Added QuickApp variable Timeout for finetuning waiting for response

Version 0.3 (11th August 2020)
   error message instead of debug message in case of an error
   Changed method of adding QuickApp variables, so they can be edited

Properties temperature, humidity and wind speed have the Buienradar values. This QuickApp can be used as your weather provider. 
conditionCodes = {unknown = 3200, clear = 32, rain = 40, snow = 38, storm = 666, cloudy = 30, fog = 20,}

Station ID's and Stations: 
6391 Meetstation Arcen / 6275 Meetstation Arnhem / 6249 Meetstation Berkhout / 6308 Meetstation Cadzand / 6260 Meetstation De Bilt / 6235 Meetstation Den Helder / 6370 Meetstation Eindhoven / 6377 Meetstation Ell / 6321 Meetstation Euro platform / 6350 Meetstation Gilze Rijen / 6323 Meetstation Goes / 6283 Meetstation Groenlo-Hupsel / 6280 Meetstation Groningen / 6315 Meetstation Hansweert /  6278 Meetstation Heino /  6356 Meetstation Herwijnen /  6330 Meetstation Hoek van Holland /  6279 Meetstation Hoogeveen / 6251 Meetstation Hoorn Terschelling /  6258 Meetstation Houtribdijk / 6285 Meetstation Huibertgat / 6209 Meetstation IJmond /  6225 Meetstation IJmuiden /  6277 Meetstation Lauwersoog / 6320 Meetstation LE Goeree / 6270 Meetstation Leeuwarden / 6269 Meetstation Lelystad / 6348 Meetstation Lopik-Cabauw / 6380 Meetstation Maastricht / 6273 Meetstation Marknesse / 6286 Meetstation Nieuw Beerta / 6312 Meetstation Oosterschelde / 6344 Meetstation Rotterdam / 6343 Meetstation Rotterdam Geulhaven / 6316 Meetstation Schaar / 6240 Meetstation Schiphol / 6324 Meetstation Stavenisse / 6267 Meetstation Stavoren / 6229 Meetstation Texelhors / 6331 Meetstation Tholen / 6290 Meetstation Twente / 6313 Meetstation Vlakte aan de Raan / 6242 Meetstation Vlieland / 6310 Meetstation Vlissingen / 6375 Meetstation Volkel / 6215 Meetstation Voorschoten / 6319 Meetstation Westdorpe / 6248 Meetstation Wijdenes / 6257 Meetstation Wijk aan Zee / 6340 Meetstation Woensdrecht / 6239 Meetstation Zeeplatform F-3 / 6252 Meetstation Zeeplatform K13

Variables mandatory:
Interval = Number in seconds to update the data
Timeout = Number in seconds to wait for a response 
StationID = Number of the station you want to use for weather measurements
SetGlobalVar = true or false, whether you want tu use the Global Variables

This QuickApp can store all general and station specific weather information in global variables. These global variables you can use in your own scripts, for example to send an email every morning with the weather forecast, send notifications of weather changes, etcetera. 

Global Variables:
   Buienradar_Shortterm_[deviceID]
   Buienradar_Longterm_[deviceID]
   Buienradar_Fivedayforecast_1_[deviceID]
   Buienradar_Fivedayforecast_2_[deviceID]
   Buienradar_Fivedayforecast_3_[deviceID]
   Buienradar_Fivedayforecast_4_[deviceID]
   Buienradar_Fivedayforecast_5_[deviceID]
   Buienradar_Weatherreport_[deviceID]
   Buienradar_Station_[deviceID]

Examples of the Global Variables:
 
   Buienradar_Shortterm_[deviceID] -- {"startdate":"2020-08-23T00:00:00","enddate":"2020-08-27T00:00:00","forecast":"Onbestendig met geregeld regen of enkele buien.","$id":"58"}

   Buienradar_Longterm_[deviceID] -- {"startdate":"2020-08-28T00:00:00","enddate":"2020-09-01T00:00:00","forecast":"Aanvankelijk onbestendig met maxima iets onder het langjarig gemiddelde. Later in de periode neemt de kans op een droger en warmer weertype toe.","$id":"59"}

   Buienradar_Fivedayforecast_1_[deviceID] -- {"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/f.png","mintemperatureMin":15,"maxtemperatureMax":21,"weatherdescription":"Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature":"15","mintemperatureMax":15,"mmRainMax":5.0,"maxtemperature":"21","maxtemperatureMin":21,"wind":4,"windDirection":"w","mmRainMin":1.0,"sunChance":40,"day":"2020-08-23T00:00:00","rainChance":50,"$id":"60"}
 
   Buienradar_Fivedayforecast_2_[deviceID] -- {"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/f.png","mintemperatureMin":14,"maxtemperatureMax":20,"weatherdescription":"Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature":"14\/15","mintemperatureMax":15,"mmRainMax":5.0,"maxtemperature":"19\/20","maxtemperatureMin":19,"wind":3,"windDirection":"w","mmRainMin":2.0,"sunChance":30,"day":"2020-08-24T00:00:00","rainChance":70,"$id":"61"}
 
   Buienradar_Fivedayforecast_3_[deviceID] -- {"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/f.png","mintemperatureMin":13,"maxtemperatureMax":22,"weatherdescription":"Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature":"13\/15","mintemperatureMax":15,"mmRainMax":6.0,"maxtemperature":"20\/22","maxtemperatureMin":20,"wind":4,"windDirection":"zw","mmRainMin":2.0,"sunChance":30,"day":"2020-08-25T00:00:00","rainChance":80,"$id":"62"}
 
   Buienradar_Fivedayforecast_4_[deviceID] -- {"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/f.png","mintemperatureMin":16,"maxtemperatureMax":21,"weatherdescription":"Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature":"16\/17","mintemperatureMax":17,"mmRainMax":3.0,"maxtemperature":"19\/21","maxtemperatureMin":19,"wind":5,"windDirection":"w","mmRainMin":1.0,"sunChance":30,"day":"2020-08-26T00:00:00","rainChance":60,"$id":"63"}

   Buienradar_Fivedayforecast_5_[deviceID] -- {"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/f.png","mintemperatureMin":13,"maxtemperatureMax":20,"weatherdescription":"Afwisselend bewolkt met (mogelijk) wat lichte regen","mintemperature":"13\/15","mintemperatureMax":15,"mmRainMax":3.0,"maxtemperature":"19\/20","maxtemperatureMin":19,"wind":3,"windDirection":"zw","mmRainMin":1.0,"sunChance":40,"day":"2020-08-27T00:00:00","rainChance":70,"$id":"64"}

   Buienradar_Weatherreport_[deviceID] -- {"published":"2020-08-22T10:00:00","authorbio":"Sinds 2017 als junior Meteoroloog actief voor het weekendteam van Buienradar. Daarnaast student van de Bachelor Bodem, Water & Atmosfeer aan de Wageningen Universiteit.","author":"Philippe Schambergen","text":"Na de warmte van de afgelopen weken gaat het roer nu flink om. De komende tijd is het wisselvallig in Nederland met normale temperaturen en vooral op woensdag staat er veel wind.Vandaag is het wisselend bewolkt en is het in het binnenland nog geruime tijd droog. In de loop van de dag gaan er vanuit het noordwesten buien vallen met in het noorden kans op onweer. Na het middaguur trekken deze buien verder landinwaarts. Tussen de buien door blijft er echter genoeg ruimte voor de zon. Het wordt 21 of 22 graden langs de kust en nog een zomerse 25 graden in het zuidoosten. Er staat een matige en aan zee krachtige zuidwestenwind, windkracht 4 tot 6. Ook komen er in heel het land windstoten rond de 50 km\/h voor, tijdens buien mogelijk oplopend tot 75 km\/h. Aan het eind van de middag komt er langs de zuidwestkust mogelijk een harde zuidwestenwind te staan, windkracht 7.Vanavond klaart het op en trekken de meeste buien naar het oosten weg. Het blijft nog even stevig waaien. Vannacht neemt de wind in het binnenland iets af en verdwijnen daar de windstoten. Er gaan wel opnieuw buien ontstaan in het noorden van het land. Het koelt af naar 17 graden aan zee en 14 graden in het binnenland.&nbsp;Morgen is het wisselend bewolkt en trekken enkele buien over het land. Er staat wel iets minder wind dan vandaag: de westenwind waait matig tot aan zee (vrij) krachtig. In de middag wordt het nog maar 20 graden op de Wadden en 22 graden in het zuidoosten van het land, waarmee de temperatuur rond normaal komt te liggen.De dagen erna is het wisselvallig met enkele buien waarbij het vooral in het noorden soms flink kan doorregenen. Een depressie ligt woensdag boven de Noordzee en deze zorgt dan voor een flinke toename van de wind. Mogelijk wordt het zelfs even stormachtig! In de middag wordt het 19 tot 22 graden, alleen dinsdag kan het in het zuidoosten wel weer 24 graden worden.","title":"Terug naar normaal","summary":"Na de warmte van de afgelopen weken gaat het roer nu flink om. De komende tijd is het wisselvallig in Nederland met normale temperaturen en vooral op woensdag staat er veel wind.","$id":"57"}

   Buienradar_Station_[deviceID] -- {"regio":"Rotterdam","timestamp":"2020-08-22T11:40:00","airpressure":1013.1,"lat":51.95,"weatherdescription":"Zwaar bewolkt","rainFallLast24Hour":0.6,"feeltemperature":20.3,"precipitation":0.0,"stationname":"Meetstation Rotterdam","lon":4.45,"$id":"36","temperature":20.3,"graphUrl":"https:\/\/www.buienradar.nl\/nederland\/weerbericht\/weergrafieken\/c","windgusts":14.4,"sunpower":349.0,"rainFallLastHour":0.0,"winddirection":"ZW","stationid":6344,"groundtemperature":20.7,"winddirectiondegrees":215,"humidity":68.0,"windspeedBft":5,"windspeed":9.3,"visibility":25300.0,"iconurl":"https:\/\/www.buienradar.nl\/resources\/images\/icons\/weather\/30x30\/c.png"}
