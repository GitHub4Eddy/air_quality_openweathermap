-- QuickApp AIR QUALITY OPENWEATHERMAP

-- The QuickApp Air Quality OpenWeatherMap provides the current measurement for your location on Air Quality. 
-- Besides basic Air Quality Index the QuickApp provides also data about polluting gases such as Carbon monoxide (CO), Nitrogen monoxide (NO), Nitrogen dioxide (NO2), Ozone (O3), Sulphur dioxide (SO2), Ammonia (NH3), and particulates (PM2.5 and PM10). 
-- This QuickApp has Child Devices for Carbon monoxide (CO), Nitrogen monoxide (NO), Nitrogen dioxide (NO2), Ozone (O3), Sulphur dioxide (SO2), Ammonia (NH3), PM2.5 and PM10. 


-- Common Air Quality Index (CAQI)
-- The Common Air Quality Index (CAQI) is an air quality index used in Europe since 2006. In November 2017, the European Environment Agency announced the European Air Quality Index (EAQI) and started encouraging its use on websites and for other ways of informing the public about air quality. 
-- As of 2012, the EU-supported project CiteairII argued that the CAQI had been evaluated on a "large set" of data, and described the CAQI's motivation and definition. CiteairII stated that having an air quality index that would be easy to present to the general public was a major motivation, leaving aside the more complex question of a health-based index, which would require, for example, effects of combined levels of different pollutants. The main aim of the CAQI was to have an index that would encourage wide comparison across the EU, without replacing local indices. CiteairII stated that the "main goal of the CAQI is not to warn people for possible adverse health effects of poor air quality but to attract their attention to urban air pollution and its main source (traffic) and help them decrease their exposure."
-- The CAQI is a number on a scale from 1 to 100, where a low value means good air quality and a high value means bad air quality. The index is defined in both hourly and daily versions, and separately near roads (a "roadside" or "traffic" index) or away from roads (a "background" index). As of 2012, the CAQI had two mandatory components for the roadside index, NO2 and PM10, and three mandatory components for the background index, NO2, PM10 and O3. It also included optional pollutants PM2.5, CO and SO2. A "sub-index" is calculated for each of the mandatory (and optional if available) components. The CAQI is defined as the sub-index that represents the worst quality among those components.

-- Here is a description of Air Quality index levels:

-- Qualitative name	Index	Pollutant concentration in μg/m3: 
--          Index   NO2       PM10     O3      PM25 (optional)
-- Good        1    0-50      0-25     0-60    0-15
-- Fair        2   50-100    25-50    60-120   15-30
-- Moderate    3   100-200   50-90    120-180  30-55
-- Poor        4   200-400   90-180   180-240  55-110
-- Very Poor   5    >400      >180     >240     >110

-- See more on CAQI: https://en.wikipedia.org/wiki/Air_quality_index


-- IMPORTANT
-- You need an API key and Polygon ID from https://home.openweathermap.org/users/sign_up
-- The API is free up to 60 calls per minute


-- Version 0.1 (9th October 2021)
-- Initial version


-- Variables (mandatory): 
-- apiKey = Get your free API key from https://agromonitoring.com
-- latitude = latitude of your location (Default is the latitude of your HC3)
-- longitude = longitude of your location (Default is the longitude of your HC3)
-- interval = [number] in seconds time to get the data from the API
-- timeout = [number] in seconds for http timeout
-- debugLevel = Number (1=some, 2=few, 3=all, 4=simulation mode) (default = 1)


-- Example response:
--[[
{
  "coord":[
    50,
    50
  ],
  "list":[
    {
      "dt":1605182400,
      "main":{
        "aqi":1
      },
      "components":{
        "co":201.94053649902344,
        "no":0.01877197064459324,
        "no2":0.7711350917816162,
        "o3":68.66455078125,
        "so2":0.6407499313354492,
        "pm2_5":0.5,
        "pm10":0.540438711643219,
        "nh3":0.12369127571582794
      }
    }
  ]
} 
--]]


-- No editing of this code is needed 


class 'CO'(QuickAppChild)
function CO:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("CO initiated, deviceId:",self.id)
end
function CO:updateValue(data) 
  self:updateProperty("value",tonumber(data.CO)) 
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", " ")
end


class 'NO'(QuickAppChild)
function NO:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("NO initiated, deviceId:",self.id)
end
function NO:updateValue(data) 
  self:updateProperty("value",tonumber(data.NO))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", " ")
end

class 'NO2'(QuickAppChild)
function NO2:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("NO2 initiated, deviceId:",self.id)
end
function NO2:updateValue(data) 
  self:updateProperty("value",tonumber(data.NO2))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", data.NO2_TEXT)
end


class 'O3'(QuickAppChild)
function O3:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("O3 initiated, deviceId:",self.id)
end
function O3:updateValue(data) 
  self:updateProperty("value",tonumber(data.O3))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", data.O3_TEXT)
end


class 'SO2'(QuickAppChild)
function SO2:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("SO2 initiated, deviceId:",self.id)
end
function SO2:updateValue(data) 
  self:updateProperty("value",tonumber(data.SO2))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", " ")
end


class 'NH3'(QuickAppChild)
function NH3:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("NH3 initiated, deviceId:",self.id)
end
function NH3:updateValue(data) 
  self:updateProperty("value",tonumber(data.NH3))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", " ")
end


class 'PM25'(QuickAppChild)
function PM25:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("PM25 initiated, deviceId:",self.id)
end
function PM25:updateValue(data) 
  self:updateProperty("value",tonumber(data.PM25))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", data.PM25_TEXT)
end


class 'PM10'(QuickAppChild)
function PM10:__init(dev)
  QuickAppChild.__init(self,dev)
  --self:trace("PM10 initiated, deviceId:",self.id)
end
function PM10:updateValue(data) 
  self:updateProperty("value",tonumber(data.PM10))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", data.PM10_TEXT)
end


local function getChildVariable(child,varName)
  for _,v in ipairs(child.properties.quickAppVariables or {}) do
    if v.name==varName then return v.value end
  end
  return ""
end


-- QuickApp functions


function QuickApp:updateChildDevices() -- Update Child Devices
  for id,child in pairs(self.childDevices) do 
    child:updateValue(data) 
  end
end


function QuickApp:logging(level,text) -- Logging function for debug messages
  if tonumber(debugLevel) >= tonumber(level) then 
    self:debug(text)
  end
end


function QuickApp:updateProperties() --Update properties
  self:logging(3,"Start updateProperties")
  self:updateProperty("value", tonumber(data.AQI))
  self:updateProperty("unit", data.AQI_TEXT)
  self:updateProperty("log", data.DT)
end


function QuickApp:updateLabels() -- Update labels
  self:logging(3,"updateLabels")
  local labelText = ""
  if debugLevel == 4 then
    labelText = labelText .."SIMULATION MODE" .."\n\n"
  end

  labelText = labelText .."Basic Air Quality Index: " ..data.AQI  ..data.AQI_TEXT .."\n\n"
  labelText = labelText .."Carbon monoxide (CO): "    ..data.CO   .." µg/m³" .."\n"
  labelText = labelText .."Nitrogen monoxide (NO): "  ..data.NO   .." µg/m³" .."\n"
  labelText = labelText .."Nitrogen dioxide (NO2): "  ..data.NO2  .." µg/m³" ..data.NO2_TEXT .."\n"
  labelText = labelText .."Ozone (O3): "              ..data.O3   .." µg/m³" ..data.O3_TEXT .."\n"
  labelText = labelText .."Sulphur dioxide (SO2): "   ..data.SO2  .." µg/m³" .."\n"
  labelText = labelText .."Ammonia (NH3): "           ..data.NH3  .." µg/m³" .."\n"
  labelText = labelText .."PM2.5: "                   ..data.PM25 .." µg/m³" ..data.PM25_TEXT .."\n"
  labelText = labelText .."PM10: "                    ..data.PM10 .." µg/m³" ..data.PM10_TEXT .."\n\n"
  labelText = labelText .."Last update: "             ..data.DT   .."\n" 

  self:logging(2,"labelText: " ..labelText)
  self:updateView("label1", "text", labelText) 
end


function QuickApp:getValues() -- Get the values
  self:logging(3,"Start getValues")
  data.AQI =  string.format("%.0f",jsonTable.list[1].main.aqi)
  data.CO =   string.format("%.2f",jsonTable.list[1].components.co)
  data.NO =   string.format("%.2f",jsonTable.list[1].components.no)
  data.NO2 =  string.format("%.2f",jsonTable.list[1].components.no2)
  data.O3 =   string.format("%.2f",jsonTable.list[1].components.o3)
  data.SO2 =  string.format("%.2f",jsonTable.list[1].components.so2)
  data.NH3 =  string.format("%.2f",jsonTable.list[1].components.nh3)
  data.PM25 = string.format("%.2f",jsonTable.list[1].components.pm2_5)
  data.PM10 = string.format("%.2f",jsonTable.list[1].components.pm10)
  data.DT =   os.date("%d-%m-%Y %H:%M", tonumber(jsonTable.list[1].dt))
 
  if data.AQI == "1" then
    data.AQI_TEXT = " (Good)"
  elseif data.AQI == "2" then
    data.AQI_TEXT = " (Fair)"
  elseif data.AQI == "3" then
    data.AQI_TEXT = " (Moderate)"
  elseif data.AQI == "4" then
    data.AQI_TEXT = " (Poor)"
  elseif data.AQI == "5" then
    data.AQI_TEXT = " (Very Poor)"
  end
  
  if tonumber(data.NO2) <= 50 then
    data.NO2_TEXT = " (Good)"
  elseif tonumber(data.NO2) > 50 and tonumber(data.NO2) <= 100 then
    data.NO2_TEXT = " (Fair)"
  elseif tonumber(data.NO2) > 100 and tonumber(data.NO2) <= 200 then
    data.NO2_TEXT = " (Moderate)"
  elseif tonumber(data.NO2) > 200 and tonumber(data.NO2) <= 400 then
    data.NO2_TEXT = " (Poor)"
  elseif tonumber(data.NO2) > 400 then
    data.NO2_TEXT = " (Very Poor)"
  end
  
  if tonumber(data.O3) <= 60 then
    data.O3_TEXT = " (Good)"
  elseif tonumber(data.O3) > 60 and tonumber(data.O3) <= 120 then
    data.O3_TEXT = " (Fair)"
  elseif tonumber(data.O3) > 120 and tonumber(data.O3) <= 180 then
    data.O3_TEXT = " (Moderate)"
  elseif tonumber(data.O3) > 180 and tonumber(data.O3) <= 240 then
    data.O3_TEXT = " (Poor)"
  elseif tonumber(data.O3) > 240 then
    data.O3_TEXT = " (Very Poor)"
  end
  
  if tonumber(data.PM25) <= 60 then
    data.PM25_TEXT = " (Good)"
  elseif tonumber(data.PM25) > 60 and tonumber(data.PM25) <= 120 then
    data.PM25_TEXT = " (Fair)"
  elseif tonumber(data.PM25) > 120 and tonumber(data.PM25) <= 180 then
    data.PM25_TEXT = " (Moderate)"
  elseif tonumber(data.PM25) > 180 and tonumber(data.PM25) <= 240 then
    data.PM25_TEXT = " (Poor)"
  elseif tonumber(data.PM25) > 240 then
    data.PM25_TEXT = " (Very Poor)"
  end
  
  if tonumber(data.PM10) <= 25 then
    data.PM10_TEXT = " (Good)"
  elseif tonumber(data.PM10) > 25 and tonumber(data.PM10) <= 50 then
    data.PM10_TEXT = " (Fair)"
  elseif tonumber(data.PM10) > 50 and tonumber(data.PM10) <= 90 then
    data.PM10_TEXT = " (Moderate)"
  elseif tonumber(data.PM10) > 90 and tonumber(data.PM10) <= 180 then
    data.PM10_TEXT = " (Poor)"
  elseif tonumber(data.PM10) > 180 then
    data.PM10_TEXT = " (Very Poor)"
  end
  
end


function QuickApp:simData() -- Simulate Agro Monitoring API
  self:logging(3,"Start Simulation mode")
  local apiResult = '{"coord":[50,50],"list":[{"dt":1605182400,"main":{"aqi":1},"components":{"co":201.94053649902344,"no":0.01877197064459324,"no2":0.7711350917816162,"o3":68.66455078125,"so2":0.6407499313354492,"pm2_5":0.5,"pm10":0.540438711643219,"nh3":0.12369127571582794}}]}'
  self:logging(3,"apiResult: " ..apiResult)

  jsonTable = json.decode(apiResult) -- Decode the json string from api to lua-table 
  
  self:getValues() -- Update the Values
  self:updateLabels() -- Update the Labels
  self:updateProperties() -- Update the Properties
  self:updateChildDevices() -- Update the Child Devices
  
  self:logging(3,"SetTimeout " ..interval .." seconds")
  fibaro.setTimeout(interval*1000, function() 
     self:simData()
  end)
end


function QuickApp:getData()
  self:logging(3,"Start getData")
  self:logging(2,"URL: " ..address)

  self.http:request(address, {
    options = {data = Method, method = "GET", headers = {["Content-Type"] = "application/json",["Accept"] = "application/json",}},

      success = function(response)
        self:logging(3,"response status: " ..response.status)
        self:logging(3,"headers: " ..response.headers["Content-Type"])
        self:logging(2,"Response data: " ..response.data)

        if response.data == nil or response.data == "" or response.data == "[]" or response.status > 200 then -- Check for empty result
          self:warning("Temporarily no data from OpenWeatherMap.org")
          return 
        end

        jsonTable = json.decode(response.data) -- JSON decode from api to lua-table

        self:getValues() -- Update the Values
        self:updateLabels() -- Update the Labels
        self:updateProperties() -- Update the Properties
        self:updateChildDevices() -- Update the Child Devices

      end,
      error = function(error)
        self:error('error: ' ..json.encode(error))
        self:updateProperty("log", "error: " ..json.encode(error))
      end
    }) 

  self:logging(3,"SetTimeout " ..interval .." seconds")
  fibaro.setTimeout((interval)*1000, function() 
     self:getData()
  end)
end


function QuickApp:createVariables() -- Get all Variables or create them
  self:logging(3,"Start createVariables")
  data = {}
  data.AQI = "0"
  data.CO = "0"
  data.NO = "0"
  data.NO2 = "0"
  data.SO2 = "0"
  data.NH3 = "0"
  data.PM25 = "0"
  data.PM10 = "0"
  data.O3 = "0"
  data.DT = "0"
  data.AQI_TEXT = ""
  data.CO_TEXT = ""
  data.NO_TEXT = ""
  data.O3_TEXT = ""
  data.SO2_TEXT = ""
  data.NH3_TEXT = ""
  data.PM25_TEXT = ""
  data.PM10_TEXT = ""
end


function QuickApp:getQuickAppVariables() -- Get all QuickApp Variables 
  local apiKey = self:getVariable("apiKey")
  local latitude = tonumber(self:getVariable("latitude"))
  local longitude = tonumber(self:getVariable("longitude"))
  interval = tonumber(self:getVariable("interval")) 
  httpTimeout = tonumber(self:getVariable("httpTimeout")) 
  debugLevel = tonumber(self:getVariable("debugLevel"))

  if apiKey =="" or apiKey == nil then
    apiKey = "0" 
    self:setVariable("apiKey",apiKey)
    self:trace("Added QuickApp variable apiKey")
  end
  if latitude == 0 or latitude == nil then 
    latitude = string.format("%.2f",api.get("/settings/location")["latitude"]) -- Default latitude of your HC3
    self:setVariable("latitude", latitude)
    self:trace("Added QuickApp variable latitude with default value " ..latitude)
  end  
  if longitude == 0 or longitude == nil then
    longitude = string.format("%.2f",api.get("/settings/location")["longitude"]) -- Default longitude of your HC3
    self:setVariable("longitude", longitude)
    self:trace("Added QuickApp variable longitude with default value " ..longitude)
  end
  if interval == "" or interval == nil then
    interval = "601" 
    self:setVariable("interval",interval)
    self:trace("Added QuickApp variable interval")
    interval = tonumber(interval)
  end  
  if httpTimeout == "" or httpTimeout == nil then
    httpTimeout = "5" -- timeoout in seconds
    self:setVariable("httpTimeout",httpTimeout)
    self:trace("Added QuickApp variable httpTimeout")
    httpTimeout = tonumber(httpTimeout)
  end
  if debugLevel == "" or debugLevel == nil then
    debugLevel = "1" -- Default value for debugLevel response in seconds
    self:setVariable("debugLevel",debugLevel)
    self:trace("Added QuickApp variable debugLevel")
    debugLevel = tonumber(debugLevel)
  end
  if apiKey == nil or apiKey == ""  or apiKey =="0" then -- Check mandatory API key 
    self:error("API key is empty! Get your free API key from https://openweathermap.org")
    self:warning("No API Key: Switched to Simulation Mode")
    debugLevel = 4 -- Simulation mode due to empty API key
  end
  address = "http://api.openweathermap.org/data/2.5/air_pollution?lat=" ..latitude .."&lon=" ..longitude .."&appid=" ..apiKey -- Combine webaddress, location info and API key
end


function QuickApp:setupChildDevices() -- Setup Child Devices
  local cdevs = api.get("/devices?parentId="..self.id) or {} -- Pick up all Child Devices
  function self:initChildDevices() end -- Null function, else Fibaro calls it after onInit()...

  if #cdevs == 0 then -- If no Child Devices, create them
    local initChildData = { 
      {className="CO",   name="Carbon monoxide",   type="com.fibaro.multilevelSensor", value=0},
      {className="NO",   name="Nitrogen monoxide", type="com.fibaro.multilevelSensor", value=0},
      {className="NO2",  name="Nitrogen dioxide",  type="com.fibaro.multilevelSensor", value=0},
      {className="O3",   name="Ozone",             type="com.fibaro.multilevelSensor", value=0},
      {className="SO2",  name="Sulphur dioxide",   type="com.fibaro.multilevelSensor", value=0},
      {className="NH3",  name="Ammonia",           type="com.fibaro.multilevelSensor", value=0},
      {className="PM25", name="PM2.5",             type="com.fibaro.multilevelSensor", value=0},
      {className="PM10", name="PM10",              type="com.fibaro.multilevelSensor", value=0},
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

  self:setupChildDevices() -- Setup the Child Devices
  self:getQuickAppVariables() -- Get Quickapp Variables or create them
  self:createVariables() -- Create Variables

  self.http = net.HTTPClient({timeout=httpTimeout*1000})

  if tonumber(debugLevel) >= 4 then 
    self:simData() -- Go in simulation
  else
    self:getData() -- Get data from API
  end
end

--EOF
