--[[ QuickApp AIR QUALITY OPENWEATHERMAP

The QuickApp Air Quality OpenWeatherMap provides the current and forecast measurements for your location on Air Quality. 
Besides basic Air Quality Index the QuickApp provides also data about polluting gases such as Carbon monoxide (CO), Nitrogen monoxide (NO), Nitrogen dioxide (NO2), Ozone (O3), Sulphur dioxide (SO2), Ammonia (NH3), and particulates (PM2.5 and PM10). 
This QuickApp has Child Devices for Carbon monoxide (CO), Nitrogen monoxide (NO), Nitrogen dioxide (NO2), Ozone (O3), Sulphur dioxide (SO2), Ammonia (NH3), PM2.5 and PM10 for current measurement. 
This QuickApp has also Child Devices for Air Quality Index, Carbon monoxide (CO), Nitrogen monoxide (NO), Nitrogen dioxide (NO2), Ozone (O3), Sulphur dioxide (SO2), Ammonia (NH3), PM2.5 and PM10 for forecast measurement. 


Common Air Quality Index (CAQI)
The Common Air Quality Index (CAQI) is an air quality index used in Europe since 2006. In November 2017, the European Environment Agency announced the European Air Quality Index (EAQI) and started encouraging its use on websites and for other ways of informing the public about air quality. 
As of 2012, the EU-supported project CiteairII argued that the CAQI had been evaluated on a "large set" of data, and described the CAQI's motivation and definition. CiteairII stated that having an air quality index that would be easy to present to the general public was a major motivation, leaving aside the more complex question of a health-based index, which would require, for example, effects of combined levels of different pollutants. The main aim of the CAQI was to have an index that would encourage wide comparison across the EU, without replacing local indices. CiteairII stated that the "main goal of the CAQI is not to warn people for possible adverse health effects of poor air quality but to attract their attention to urban air pollution and its main source (traffic) and help them decrease their exposure."

The CAQI is a number on a scale from 1 to 100, where a low value means good air quality and a high value means bad air quality. The index is defined in both hourly and daily versions, and separately near roads (a "roadside" or "traffic" index) or away from roads (a "background" index). As of 2012, the CAQI had two mandatory components for the roadside index, NO2 and PM10, and three mandatory components for the background index, NO2, PM10 and O3. It also included optional pollutants PM2.5, CO and SO2. A "sub-index" is calculated for each of the mandatory (and optional if available) components. The CAQI is defined as the sub-index that represents the worst quality among those components.

Here is a description of Air Quality index levels:

Qualitative name	Index	Pollutant concentration in μg/m3: 
          Index   NO2       PM10     O3      PM25 (optional)
Good        1    0-50      0-25     0-60    0-15
Fair        2   50-100    25-50    60-120   15-30
Moderate    3   100-200   50-90    120-180  30-55
Poor        4   200-400   90-180   180-240  55-110
Very Poor   5    >400      >180     >240     >110

See more on CAQI: https://en.wikipedia.org/wiki/Air_quality_index


IMPORTANT
- You need an API key from https://home.openweathermap.org/users/sign_up
- The API is free up to 60 calls per minute


Version 1.1 (10th November 2022)
- Added extra check for partly empty response ("coord" not empty but "list" is empty)
- Added extra message to the labels and de log text if there is no response
- Warning added in case the "forecast measurements" are not available

Version 1.0 (7th November 2021)
- Added forecast measurements with hours you want your forecast. The forecast is shown in child devices and labels for all measurements. 

Version 0.1 (9th October 2021)
- Initial version


Variables (mandatory): 
- apiKey = API key
- latitude = latitude of your location (Default is the latitude of your HC3)
- longitude = longitude of your location (Default is the longitude of your HC3)
- forecast = [number] in hours you wish your forecast to report, no more than 96 hours
- interval = [number] in seconds time to get the data from the API
- timeout = [number] in seconds for http timeout
- debugLevel = Number (1=some, 2=few, 3=all, 4=simulation mode) (default = 1)


No editing of this code is needed 


Current Child Devices --]]


class 'CO'(QuickAppChild)
function CO:__init(dev)
  QuickAppChild.__init(self,dev)
end
function CO:updateValue(data) 
  self:updateProperty("value", tonumber(data.CO)) 
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", " ")
end

class 'NO'(QuickAppChild)
function NO:__init(dev)
  QuickAppChild.__init(self,dev)
end
function NO:updateValue(data) 
  self:updateProperty("value", tonumber(data.NO))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", " ")
end

class 'NO2'(QuickAppChild)
function NO2:__init(dev)
  QuickAppChild.__init(self,dev)
end
function NO2:updateValue(data) 
  self:updateProperty("value", tonumber(data.NO2))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", data.NO2_TEXT)
end

class 'O3'(QuickAppChild)
function O3:__init(dev)
  QuickAppChild.__init(self,dev)
end
function O3:updateValue(data) 
  self:updateProperty("value", tonumber(data.O3))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", data.O3_TEXT)
end

class 'SO2'(QuickAppChild)
function SO2:__init(dev)
  QuickAppChild.__init(self,dev)
end
function SO2:updateValue(data) 
  self:updateProperty("value", tonumber(data.SO2))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", " ")
end

class 'NH3'(QuickAppChild)
function NH3:__init(dev)
  QuickAppChild.__init(self,dev)
end
function NH3:updateValue(data) 
  self:updateProperty("value", tonumber(data.NH3))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", " ")
end

class 'PM25'(QuickAppChild)
function PM25:__init(dev)
  QuickAppChild.__init(self,dev)
end
function PM25:updateValue(data) 
  self:updateProperty("value", tonumber(data.PM25))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", data.PM25_TEXT)
end

class 'PM10'(QuickAppChild)
function PM10:__init(dev)
  QuickAppChild.__init(self,dev)
end
function PM10:updateValue(data) 
  self:updateProperty("value", tonumber(data.PM10))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", data.PM10_TEXT)
end


-- Forecast Child Devices

class 'fcAQI'(QuickAppChild)
function fcAQI:__init(dev)
  QuickAppChild.__init(self,dev)
end
function fcAQI:updateValue(data) 
  self:updateProperty("value", tonumber(data.fcAQI)) 
  self:updateProperty("unit", data.fcAQI_TEXT)
  self:updateProperty("log", data.fcDT)
end

class 'fcCO'(QuickAppChild)
function fcCO:__init(dev)
  QuickAppChild.__init(self,dev)
end
function fcCO:updateValue(data) 
  self:updateProperty("value", tonumber(data.fcCO)) 
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", data.fcCO-data.CO .." µg/m³")
end

class 'fcNO'(QuickAppChild)
function fcNO:__init(dev)
  QuickAppChild.__init(self,dev)
end
function fcNO:updateValue(data) 
  self:updateProperty("value", tonumber(data.fcNO))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", data.fcNO-data.NO .." µg/m³")
end

class 'fcNO2'(QuickAppChild)
function fcNO2:__init(dev)
  QuickAppChild.__init(self,dev)
end
function fcNO2:updateValue(data) 
  self:updateProperty("value", tonumber(data.fcNO2))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", data.fcNO2-data.NO2 .." µg/m³ " ..data.fcNO2_TEXT)
end

class 'fcO3'(QuickAppChild)
function fcO3:__init(dev)
  QuickAppChild.__init(self,dev)
end
function fcO3:updateValue(data) 
  self:updateProperty("value", tonumber(data.fcO3))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", data.fcO3-data.O3 .." µg/m³ " ..data.fcO3_TEXT)
end

class 'fcSO2'(QuickAppChild)
function fcSO2:__init(dev)
  QuickAppChild.__init(self,dev)
end
function fcSO2:updateValue(data) 
  self:updateProperty("value", tonumber(data.fcSO2))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", data.fcSO2-data.SO2 .." µg/m³")
end

class 'fcNH3'(QuickAppChild)
function fcNH3:__init(dev)
  QuickAppChild.__init(self,dev)
end
function fcNH3:updateValue(data) 
  self:updateProperty("value", tonumber(data.fcNH3))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", data.fcNH3-data.NH3 .." µg/m³")
end

class 'fcPM25'(QuickAppChild)
function fcPM25:__init(dev)
  QuickAppChild.__init(self,dev)
end
function fcPM25:updateValue(data) 
  self:updateProperty("value", tonumber(data.fcPM25))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", data.fcPM25-data.PM25 .." µg/m³" ..data.fcPM25_TEXT)
end

class 'fcPM10'(QuickAppChild)
function fcPM10:__init(dev)
  QuickAppChild.__init(self,dev)
end
function fcPM10:updateValue(data) 
  self:updateProperty("value", tonumber(data.fcPM10))
  self:updateProperty("unit", "µg/m³")
  self:updateProperty("log", data.fcPM10-data.PM10 .." µg/m³" ..data.fcPM10_TEXT)
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


function QuickApp:getTrend(valueCurrent,valueForecast) -- Get trend from current to forecast measurement
  self:logging(3,"Start getTrend")
  if tonumber(valueForecast) > tonumber(valueCurrent) then
    return " ↑"
  elseif tonumber(valueForecast) < tonumber(valueCurrent) then
    return " ↓"
  else
    return " ="
  end 
end


function QuickApp:getText(sensor,value) -- Get text
  self:logging(3,"Start getText")
  
  if sensor == "AQI" then 
    if value == "1" then
      return " (Good)"
    elseif value == "2" then
      return " (Fair)"
    elseif value == "3" then
      return " (Moderate)"
    elseif value == "4" then
      return " (Poor)"
    elseif value == "5" then
      return " (Very Poor)"
    else
      return "(Unknown)"
    end
  elseif sensor == "NO2" then 
    if tonumber(value) <= 50 then
      return " (Good)"
    elseif tonumber(value) > 50 and tonumber(value) <= 100 then
      return " (Fair)"
    elseif tonumber(value) > 100 and tonumber(value) <= 200 then
      return " (Moderate)"
    elseif tonumber(value) > 200 and tonumber(value) <= 400 then
      return " (Poor)"
    elseif tonumber(value) > 400 then
      return " (Very Poor)"
    end
  elseif sensor == "O3" then 
    if tonumber(value) <= 60 then
      return " (Good)"
    elseif tonumber(value) > 60 and tonumber(value) <= 120 then
      return " (Fair)"
    elseif tonumber(value) > 120 and tonumber(value) <= 180 then
      return " (Moderate)"
    elseif tonumber(value) > 180 and tonumber(value) <= 240 then
      return " (Poor)"
    elseif tonumber(value) > 240 then
      return " (Very Poor)"
    end
  elseif sensor == "PM25" then 
    if tonumber(value) <= 60 then
      return " (Good)"
    elseif tonumber(value) > 60 and tonumber(value) <= 120 then
      return " (Fair)"
    elseif tonumber(value) > 120 and tonumber(value) <= 180 then
      return " (Moderate)"
    elseif tonumber(value) > 180 and tonumber(value) <= 240 then
      return " (Poor)"
    elseif tonumber(value) > 240 then
      return " (Very Poor)"
    end
  elseif sensor == "PM10" then 
    if tonumber(value) <= 25 then
      return " (Good)"
    elseif tonumber(value) > 25 and tonumber(value) <= 50 then
      return " (Fair)"
    elseif tonumber(value) > 50 and tonumber(value) <= 90 then
      return " (Moderate)"
    elseif tonumber(value) > 90 and tonumber(value) <= 180 then
      return " (Poor)"
    elseif tonumber(value) > 180 then
      return " (Very Poor)"
    end
  else
    return "N/A"
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

  labelText = labelText .."Air Quality Index: "      ..data.AQI ..data.AQI_TEXT  .."\n"
  labelText = labelText .."Carbon monoxide (CO): "   ..data.CO .." µg/m³" .."\n"
  labelText = labelText .."Nitrogen monoxide (NO): " ..data.NO .." µg/m³" .."\n"
  labelText = labelText .."Nitrogen dioxide (NO2): " ..data.NO2 .." µg/m³" ..data.NO2_TEXT .."\n"
  labelText = labelText .."Ozone (O3): "             ..data.O3 .." µg/m³" ..data.O3_TEXT .."\n"
  labelText = labelText .."Sulphur dioxide (SO2): "  ..data.SO2 .." µg/m³" .."\n"
  labelText = labelText .."Ammonia (NH3): "          ..data.NH3 .." µg/m³" .."\n"
  labelText = labelText .."PM2.5: "                  ..data.PM25 .." µg/m³" ..data.PM25_TEXT .."\n"
  labelText = labelText .."PM10: "                   ..data.PM10 .." µg/m³" ..data.PM10_TEXT .."\n"
  labelText = labelText .."Last update: "            ..data.DT .."\n\n\n" 
  
  labelText = labelText .."Forecast "                ..tostring(forecast) .." hours" .."\n\n" 
  labelText = labelText .."Air Quality Index: "      ..data.fcAQI ..data.fcAQI_TEXT ..self:getTrend(data.AQI,data.fcAQI) .."\n"
  labelText = labelText .."Carbon monoxide (CO): "   ..data.fcCO .." (" ..data.fcCO-data.CO ..") µg/m³" ..self:getTrend(data.CO,data.fcCO) .."\n"
  labelText = labelText .."Nitrogen monoxide (NO): " ..data.fcNO .." (" ..data.fcNO-data.NO ..") µg/m³" ..self:getTrend(data.NO,data.fcNO) .."\n"
  labelText = labelText .."Nitrogen dioxide (NO2): " ..data.fcNO2 .." (" ..data.fcNO2-data.NO2 ..") µg/m³" ..data.fcNO2_TEXT ..self:getTrend(data.NO2,data.fcNO2) .."\n"
  labelText = labelText .."Ozone (O3): "             ..data.fcO3 .." (" ..data.fcO3-data.O3 ..") µg/m³" ..data.fcO3_TEXT ..self:getTrend(data.O3,data.fcO3) .."\n"
  labelText = labelText .."Sulphur dioxide (SO2): "  ..data.fcSO2 .." (" ..data.fcSO2-data.SO2 ..") µg/m³" ..self:getTrend(data.SO2,data.fcSO2) .."\n"
  labelText = labelText .."Ammonia (NH3): "          ..data.fcNH3 .." (" ..data.fcNH3-data.NH3 ..") µg/m³" ..self:getTrend(data.NH3,data.fcNH3) .."\n"
  labelText = labelText .."PM2.5: "                  ..data.fcPM25 .." (" ..data.fcPM25-data.PM25 ..") µg/m³" ..data.fcPM25_TEXT ..self:getTrend(data.PM25,data.fcPM25) .."\n"
  labelText = labelText .."PM10: "                   ..data.fcPM10 .." (" ..data.fcPM10-data.PM10 ..") µg/m³" ..data.fcPM10_TEXT ..self:getTrend(data.PM10,data.fcPM10) .."\n"
  labelText = labelText .."Forecast date/time: "     ..data.fcDT

  self:logging(2,"labelText: " ..labelText)
  self:updateView("label1", "text", labelText) 
end


function QuickApp:getValues() -- Get the values
  self:logging(3,"Start getValues")
  data.AQI =  string.format("%.0f",(jsonTable.list[1].main.aqi or 0)) -- Current values
  data.CO =   string.format("%.2f",(jsonTable.list[1].components.co or 0))
  data.NO =   string.format("%.2f",(jsonTable.list[1].components.no or 0))
  data.NO2 =  string.format("%.2f",(jsonTable.list[1].components.no2 or 0))
  data.O3 =   string.format("%.2f",(jsonTable.list[1].components.o3 or 0))
  data.SO2 =  string.format("%.2f",(jsonTable.list[1].components.so2 or 0))
  data.NH3 =  string.format("%.2f",(jsonTable.list[1].components.nh3 or 0))
  data.PM25 = string.format("%.2f",(jsonTable.list[1].components.pm2_5 or 0))
  data.PM10 = string.format("%.2f",(jsonTable.list[1].components.pm10 or 0))
  data.DT =   os.date("%d-%m-%Y %H:%M", tonumber((jsonTable.list[1].dt or 0)))
  data.AQI_TEXT =  self:getText("AQI",data.AQI)
  data.NO2_TEXT =  self:getText("NO2",data.NO2)
  data.O3_TEXT =   self:getText("O3",data.O3)
  data.PM25_TEXT = self:getText("PM25",data.PM25)
  data.PM10_TEXT = self:getText("PM10",data.PM10)
  
  if jsonTable.list[forecast+1] then
    data.fcAQI =  string.format("%.0f",(jsonTable.list[forecast+1].main.aqi or 0)) -- Forecast values
    data.fcCO =   string.format("%.2f",(jsonTable.list[forecast+1].components.co or 0))
    data.fcNO =   string.format("%.2f",(jsonTable.list[forecast+1].components.no or 0))
    data.fcNO2 =  string.format("%.2f",(jsonTable.list[forecast+1].components.no2 or 0))
    data.fcO3 =   string.format("%.2f",(jsonTable.list[forecast+1].components.o3 or 0))
    data.fcSO2 =  string.format("%.2f",(jsonTable.list[forecast+1].components.so2 or 0))
    data.fcNH3 =  string.format("%.2f",(jsonTable.list[forecast+1].components.nh3 or 0))
    data.fcPM25 = string.format("%.2f",(jsonTable.list[forecast+1].components.pm2_5 or 0))
    data.fcPM10 = string.format("%.2f",(jsonTable.list[forecast+1].components.pm10 or 0))
    data.fcDT =   os.date("%d-%m-%Y %H:%M", tonumber((jsonTable.list[forecast+1].dt or 0)))
  else
    data.fcAQI = "0"
    data.fcCO = "0"
    data.fcNO = "0"
    data.fcNO2 = "0"
    data.fcO3 = "0"
    data.fcSO2 = "0"
    data.fcNH3 = "0"
    data.fcPM25 = "0"
    data.fcPM10 = "0"
    data.fcDT = "0"
    self:warning("Forecast measurements "..forecast .." hours temporarily not available")
  end
  data.fcAQI_TEXT =  self:getText("AQI",data.fcAQI)
  data.fcNO2_TEXT =  self:getText("NO2",data.fcNO2 )
  data.fcO3_TEXT =   self:getText("O3",data.fcO3)
  data.fcPM25_TEXT = self:getText("PM25",data.fcPM25)
  data.fcPM10_TEXT = self:getText("PM10",data.fcPM10)
end


function QuickApp:simData() -- Simulate API 
  self:logging(3,"Start simData")
  local apiResult = '{"coord":{"lon":5,"lat":52.38},"list":[{"main":{"aqi":1},"components":{"co":270.37,"no":0.58,"no2":10.37,"o3":32.19,"so2":0.86,"pm2_5":2.19,"pm10":3.01,"nh3":1.63},"dt":1635681600},{"main":{"aqi":1},"components":{"co":260.35,"no":0.27,"no2":9.6,"o3":41.84,"so2":0.77,"pm2_5":1.57,"pm10":2.43,"nh3":1.52},"dt":1635685200},{"main":{"aqi":1},"components":{"co":250.34,"no":0.14,"no2":9.08,"o3":50.07,"so2":0.72,"pm2_5":1.37,"pm10":2.09,"nh3":1.41},"dt":1635688800},{"main":{"aqi":1},"components":{"co":247,"no":0.05,"no2":8.82,"o3":55.79,"so2":0.69,"pm2_5":1.15,"pm10":1.69,"nh3":1.57},"dt":1635692400},{"main":{"aqi":1},"components":{"co":247,"no":0.01,"no2":9.34,"o3":59.37,"so2":0.6,"pm2_5":0.88,"pm10":1.15,"nh3":1.28},"dt":1635696000},{"main":{"aqi":1},"components":{"co":247,"no":0,"no2":10.28,"o3":56.51,"so2":0.52,"pm2_5":0.88,"pm10":1.06,"nh3":0.86},"dt":1635699600},{"main":{"aqi":1},"components":{"co":257.02,"no":0,"no2":17.14,"o3":44.7,"so2":1.07,"pm2_5":1.11,"pm10":1.28,"nh3":0.55},"dt":1635703200},{"main":{"aqi":1},"components":{"co":263.69,"no":0.01,"no2":17.82,"o3":38.27,"so2":1.33,"pm2_5":1.31,"pm10":1.5,"nh3":0.41},"dt":1635706800},{"main":{"aqi":1},"components":{"co":263.69,"no":0,"no2":14.22,"o3":43.27,"so2":1.51,"pm2_5":1.35,"pm10":1.61,"nh3":0.42},"dt":1635710400},{"main":{"aqi":1},"components":{"co":263.69,"no":0,"no2":12.68,"o3":48.64,"so2":1.94,"pm2_5":1.56,"pm10":2.05,"nh3":0.49},"dt":1635714000},{"main":{"aqi":1},"components":{"co":267.03,"no":0,"no2":11.82,"o3":50.78,"so2":2.06,"pm2_5":2.11,"pm10":3.22,"nh3":0.72},"dt":1635717600},{"main":{"aqi":1},"components":{"co":270.37,"no":0,"no2":10.8,"o3":51.5,"so2":2,"pm2_5":2.51,"pm10":4.44,"nh3":1.05},"dt":1635721200},{"main":{"aqi":1},"components":{"co":270.37,"no":0,"no2":9.94,"o3":52.21,"so2":2.03,"pm2_5":2.72,"pm10":5.45,"nh3":1.28},"dt":1635724800},{"main":{"aqi":1},"components":{"co":270.37,"no":0,"no2":10.03,"o3":50.07,"so2":2.21,"pm2_5":2.86,"pm10":6.12,"nh3":1.28},"dt":1635728400},{"main":{"aqi":1},"components":{"co":273.71,"no":0,"no2":10.45,"o3":46.49,"so2":2.41,"pm2_5":3.05,"pm10":6.41,"nh3":1.17},"dt":1635732000},{"main":{"aqi":1},"components":{"co":273.71,"no":0,"no2":10.63,"o3":42.92,"so2":2.65,"pm2_5":3.18,"pm10":6.38,"nh3":1.12},"dt":1635735600},{"main":{"aqi":1},"components":{"co":270.37,"no":0,"no2":10.45,"o3":40.77,"so2":2.62,"pm2_5":3.05,"pm10":6.06,"nh3":1.12},"dt":1635739200},{"main":{"aqi":1},"components":{"co":267.03,"no":0,"no2":10.37,"o3":40.41,"so2":2.41,"pm2_5":2.79,"pm10":5.69,"nh3":1.16},"dt":1635742800},{"main":{"aqi":1},"components":{"co":270.37,"no":0.01,"no2":12.34,"o3":38.62,"so2":2.33,"pm2_5":2.65,"pm10":5.57,"nh3":1.2},"dt":1635746400},{"main":{"aqi":1},"components":{"co":277.04,"no":0.02,"no2":15.25,"o3":36.48,"so2":2.38,"pm2_5":2.6,"pm10":5.58,"nh3":1.22},"dt":1635750000},{"main":{"aqi":1},"components":{"co":280.38,"no":0.18,"no2":16.28,"o3":35.76,"so2":2.47,"pm2_5":2.55,"pm10":5.55,"nh3":1.25},"dt":1635753600},{"main":{"aqi":1},"components":{"co":283.72,"no":1.01,"no2":14.74,"o3":37.91,"so2":2.62,"pm2_5":2.44,"pm10":5.28,"nh3":1.25},"dt":1635757200},{"main":{"aqi":1},"components":{"co":283.72,"no":1.68,"no2":12.85,"o3":41.13,"so2":2.77,"pm2_5":2.29,"pm10":4.75,"nh3":1.25},"dt":1635760800},{"main":{"aqi":1},"components":{"co":287.06,"no":1.98,"no2":12.34,"o3":42.92,"so2":2.95,"pm2_5":2.18,"pm10":4.2,"nh3":1.28},"dt":1635764400},{"main":{"aqi":1},"components":{"co":290.39,"no":2.12,"no2":12.85,"o3":43.99,"so2":3.16,"pm2_5":2.11,"pm10":3.82,"nh3":1.39},"dt":1635768000},{"main":{"aqi":1},"components":{"co":293.73,"no":2.18,"no2":13.71,"o3":44.35,"so2":3.22,"pm2_5":1.93,"pm10":3.16,"nh3":1.38},"dt":1635771600},{"main":{"aqi":1},"components":{"co":293.73,"no":1.93,"no2":15.25,"o3":42.92,"so2":3.22,"pm2_5":1.86,"pm10":2.75,"nh3":1.33},"dt":1635775200},{"main":{"aqi":1},"components":{"co":290.39,"no":1.27,"no2":17.31,"o3":40.05,"so2":3.13,"pm2_5":1.83,"pm10":2.55,"nh3":1.27},"dt":1635778800},{"main":{"aqi":1},"components":{"co":293.73,"no":0.36,"no2":21.94,"o3":33.98,"so2":3.1,"pm2_5":1.85,"pm10":2.54,"nh3":1.27},"dt":1635782400},{"main":{"aqi":1},"components":{"co":297.07,"no":0.08,"no2":27.08,"o3":27.18,"so2":3.13,"pm2_5":1.94,"pm10":2.64,"nh3":1.25},"dt":1635786000},{"main":{"aqi":1},"components":{"co":300.41,"no":0.13,"no2":30.16,"o3":23.6,"so2":3.22,"pm2_5":1.98,"pm10":2.68,"nh3":1.14},"dt":1635789600},{"main":{"aqi":1},"components":{"co":303.75,"no":0.14,"no2":30.85,"o3":21.99,"so2":3.28,"pm2_5":2.05,"pm10":2.86,"nh3":1.11},"dt":1635793200},{"main":{"aqi":1},"components":{"co":310.42,"no":0.16,"no2":31.53,"o3":20.21,"so2":3.34,"pm2_5":2.25,"pm10":3.3,"nh3":1.19},"dt":1635796800},{"main":{"aqi":1},"components":{"co":317.1,"no":0.22,"no2":32.9,"o3":17.52,"so2":3.4,"pm2_5":2.79,"pm10":4.03,"nh3":1.19},"dt":1635800400},{"main":{"aqi":1},"components":{"co":320.44,"no":0.26,"no2":34.27,"o3":15.38,"so2":3.31,"pm2_5":3.33,"pm10":4.77,"nh3":1.19},"dt":1635804000},{"main":{"aqi":1},"components":{"co":323.77,"no":0.16,"no2":33.24,"o3":15.02,"so2":3.1,"pm2_5":3.96,"pm10":5.59,"nh3":1.2},"dt":1635807600},{"main":{"aqi":1},"components":{"co":327.11,"no":0.09,"no2":30.5,"o3":16.45,"so2":2.83,"pm2_5":4.65,"pm10":6.49,"nh3":1.17},"dt":1635811200},{"main":{"aqi":1},"components":{"co":327.11,"no":0.05,"no2":27.08,"o3":19.67,"so2":2.62,"pm2_5":5.21,"pm10":7.27,"nh3":1.14},"dt":1635814800},{"main":{"aqi":1},"components":{"co":327.11,"no":0.03,"no2":23.99,"o3":23.25,"so2":2.5,"pm2_5":5.67,"pm10":7.81,"nh3":1.09},"dt":1635818400},{"main":{"aqi":1},"components":{"co":327.11,"no":0.02,"no2":22.28,"o3":24.68,"so2":2.5,"pm2_5":6.16,"pm10":8.22,"nh3":1.06},"dt":1635822000},{"main":{"aqi":1},"components":{"co":327.11,"no":0.04,"no2":22.28,"o3":22.53,"so2":2.56,"pm2_5":6.65,"pm10":8.62,"nh3":1.06},"dt":1635825600},{"main":{"aqi":1},"components":{"co":323.77,"no":0.13,"no2":23.31,"o3":16.99,"so2":2.59,"pm2_5":6.7,"pm10":8.68,"nh3":1.12},"dt":1635829200},{"main":{"aqi":1},"components":{"co":327.11,"no":1.08,"no2":27.76,"o3":8.32,"so2":2.5,"pm2_5":6.54,"pm10":8.52,"nh3":1.28},"dt":1635832800},{"main":{"aqi":1},"components":{"co":337.12,"no":4.64,"no2":31.19,"o3":1.79,"so2":2.18,"pm2_5":6.32,"pm10":8.15,"nh3":1.36},"dt":1635836400},{"main":{"aqi":1},"components":{"co":347.14,"no":9.05,"no2":30.85,"o3":0.73,"so2":1.97,"pm2_5":6.25,"pm10":7.99,"nh3":1.44},"dt":1635840000},{"main":{"aqi":1},"components":{"co":350.48,"no":10.84,"no2":28.1,"o3":2.95,"so2":1.94,"pm2_5":6.48,"pm10":8.21,"nh3":1.5},"dt":1635843600},{"main":{"aqi":1},"components":{"co":350.48,"no":7.49,"no2":26.39,"o3":6.26,"so2":1.97,"pm2_5":6.81,"pm10":8.37,"nh3":1.41},"dt":1635847200},{"main":{"aqi":1},"components":{"co":350.48,"no":6.37,"no2":24.68,"o3":9.3,"so2":2.09,"pm2_5":6.14,"pm10":7.49,"nh3":1.38},"dt":1635850800},{"main":{"aqi":1},"components":{"co":347.14,"no":5.7,"no2":23.65,"o3":11.62,"so2":2.24,"pm2_5":5.04,"pm10":6.2,"nh3":1.43},"dt":1635854400},{"main":{"aqi":1},"components":{"co":340.46,"no":5.2,"no2":23.99,"o3":13.59,"so2":2.3,"pm2_5":3.99,"pm10":4.99,"nh3":1.41},"dt":1635858000},{"main":{"aqi":1},"components":{"co":337.12,"no":5.59,"no2":27.08,"o3":10.37,"so2":2.3,"pm2_5":3.28,"pm10":4.22,"nh3":1.47},"dt":1635861600},{"main":{"aqi":1},"components":{"co":340.46,"no":5.64,"no2":30.85,"o3":6.53,"so2":2.27,"pm2_5":2.97,"pm10":3.81,"nh3":1.46},"dt":1635865200},{"main":{"aqi":1},"components":{"co":350.48,"no":11.4,"no2":36.33,"o3":1.04,"so2":2.27,"pm2_5":2.92,"pm10":3.7,"nh3":1.62},"dt":1635868800},{"main":{"aqi":1},"components":{"co":367.17,"no":22.58,"no2":36.67,"o3":0.01,"so2":2.27,"pm2_5":3.01,"pm10":3.79,"nh3":1.66},"dt":1635872400},{"main":{"aqi":1},"components":{"co":373.84,"no":27.27,"no2":34.96,"o3":0,"so2":2.27,"pm2_5":2.94,"pm10":3.75,"nh3":1.66},"dt":1635876000},{"main":{"aqi":1},"components":{"co":393.87,"no":38.89,"no2":31.87,"o3":0,"so2":2.59,"pm2_5":3.25,"pm10":4.3,"nh3":1.87},"dt":1635879600},{"main":{"aqi":1},"components":{"co":433.92,"no":59.01,"no2":29.13,"o3":0,"so2":3.22,"pm2_5":4.06,"pm10":5.5,"nh3":2.44},"dt":1635883200},{"main":{"aqi":1},"components":{"co":467.3,"no":79.57,"no2":28.1,"o3":0,"so2":4.35,"pm2_5":5.02,"pm10":6.78,"nh3":3.55},"dt":1635886800},{"main":{"aqi":1},"components":{"co":494,"no":97.45,"no2":28.1,"o3":0,"so2":5.42,"pm2_5":5.82,"pm10":7.35,"nh3":4.88},"dt":1635890400},{"main":{"aqi":1},"components":{"co":494,"no":101.03,"no2":27.42,"o3":0,"so2":5.01,"pm2_5":5.97,"pm10":7.16,"nh3":5.64},"dt":1635894000},{"main":{"aqi":1},"components":{"co":467.3,"no":92.09,"no2":27.08,"o3":0,"so2":4.11,"pm2_5":5.63,"pm10":6.5,"nh3":6.08},"dt":1635897600},{"main":{"aqi":1},"components":{"co":433.92,"no":71.53,"no2":28.79,"o3":0,"so2":3.46,"pm2_5":4.51,"pm10":5.18,"nh3":6.02},"dt":1635901200},{"main":{"aqi":1},"components":{"co":420.57,"no":64.37,"no2":30.5,"o3":0,"so2":3.73,"pm2_5":4.05,"pm10":4.72,"nh3":6.65},"dt":1635904800},{"main":{"aqi":1},"components":{"co":427.25,"no":67.06,"no2":32.22,"o3":0,"so2":4.53,"pm2_5":4.09,"pm10":4.85,"nh3":7.92},"dt":1635908400},{"main":{"aqi":1},"components":{"co":440.6,"no":72.42,"no2":33.93,"o3":0,"so2":5.36,"pm2_5":4.2,"pm10":5.19,"nh3":9.25},"dt":1635912000},{"main":{"aqi":1},"components":{"co":460.63,"no":81.36,"no2":35.99,"o3":0,"so2":6.2,"pm2_5":4.45,"pm10":6,"nh3":10.39},"dt":1635915600},{"main":{"aqi":1},"components":{"co":500.68,"no":102.82,"no2":38.73,"o3":0,"so2":7.87,"pm2_5":5.33,"pm10":7.67,"nh3":11.15},"dt":1635919200},{"main":{"aqi":2},"components":{"co":540.73,"no":128.75,"no2":41.47,"o3":0,"so2":9.3,"pm2_5":6.43,"pm10":9.65,"nh3":10.64},"dt":1635922800},{"main":{"aqi":2},"components":{"co":554.09,"no":143.05,"no2":42.16,"o3":0.02,"so2":9.18,"pm2_5":7.3,"pm10":11.22,"nh3":8.87},"dt":1635926400},{"main":{"aqi":2},"components":{"co":540.73,"no":139.48,"no2":40.78,"o3":0.14,"so2":7.45,"pm2_5":7.84,"pm10":12.23,"nh3":6.14},"dt":1635930000},{"main":{"aqi":1},"components":{"co":427.25,"no":72.42,"no2":38.04,"o3":0.64,"so2":5.54,"pm2_5":9.04,"pm10":13.21,"nh3":2.85},"dt":1635933600},{"main":{"aqi":1},"components":{"co":393.87,"no":52.3,"no2":35.64,"o3":1.2,"so2":4.59,"pm2_5":9.93,"pm10":13.93,"nh3":2.12},"dt":1635937200},{"main":{"aqi":2},"components":{"co":380.52,"no":47.39,"no2":34.62,"o3":1.35,"so2":4.29,"pm2_5":10.46,"pm10":14.58,"nh3":2.03},"dt":1635940800},{"main":{"aqi":2},"components":{"co":363.83,"no":34.87,"no2":34.62,"o3":1.83,"so2":3.61,"pm2_5":11.12,"pm10":14.41,"nh3":1.54},"dt":1635944400},{"main":{"aqi":2},"components":{"co":360.49,"no":29.95,"no2":35.3,"o3":1.31,"so2":3.34,"pm2_5":11.53,"pm10":14.41,"nh3":1.39},"dt":1635948000},{"main":{"aqi":2},"components":{"co":360.49,"no":29.95,"no2":35.64,"o3":0.52,"so2":3.31,"pm2_5":11.44,"pm10":14.24,"nh3":1.39},"dt":1635951600},{"main":{"aqi":2},"components":{"co":403.88,"no":58.12,"no2":33.59,"o3":0.06,"so2":3.16,"pm2_5":12.06,"pm10":14.97,"nh3":2.01},"dt":1635955200},{"main":{"aqi":2},"components":{"co":467.3,"no":100.14,"no2":30.85,"o3":0,"so2":3.46,"pm2_5":13.09,"pm10":16.14,"nh3":2.69},"dt":1635958800},{"main":{"aqi":2},"components":{"co":500.68,"no":118.02,"no2":29.82,"o3":0,"so2":4.53,"pm2_5":13.42,"pm10":16.3,"nh3":3.45},"dt":1635962400},{"main":{"aqi":2},"components":{"co":507.36,"no":116.23,"no2":31.19,"o3":0,"so2":6.14,"pm2_5":13.45,"pm10":16.33,"nh3":4.43},"dt":1635966000},{"main":{"aqi":2},"components":{"co":554.09,"no":139.48,"no2":32.56,"o3":0,"so2":8.11,"pm2_5":14.74,"pm10":17.95,"nh3":6.08},"dt":1635969600},{"main":{"aqi":2},"components":{"co":634.19,"no":189.54,"no2":33.93,"o3":0,"so2":10.25,"pm2_5":16.94,"pm10":20.58,"nh3":8.23},"dt":1635973200},{"main":{"aqi":2},"components":{"co":694.28,"no":232.46,"no2":34.96,"o3":0,"so2":10.13,"pm2_5":18.82,"pm10":22.59,"nh3":8.99},"dt":1635976800},{"main":{"aqi":2},"components":{"co":674.25,"no":236.03,"no2":33.93,"o3":0,"so2":7.75,"pm2_5":19.09,"pm10":22.62,"nh3":8.74},"dt":1635980400},{"main":{"aqi":2},"components":{"co":627.52,"no":214.58,"no2":32.56,"o3":0,"so2":5.31,"pm2_5":18.5,"pm10":21.55,"nh3":7.73},"dt":1635984000},{"main":{"aqi":2},"components":{"co":554.09,"no":162.72,"no2":32.9,"o3":0,"so2":3.87,"pm2_5":17.07,"pm10":19.55,"nh3":5.83},"dt":1635987600},{"main":{"aqi":2},"components":{"co":514.03,"no":132.32,"no2":32.9,"o3":0,"so2":3.4,"pm2_5":16.46,"pm10":18.62,"nh3":5.45},"dt":1635991200},{"main":{"aqi":2},"components":{"co":487.33,"no":114.44,"no2":32.9,"o3":0,"so2":3.22,"pm2_5":16.1,"pm10":18.14,"nh3":5.32},"dt":1635994800},{"main":{"aqi":2},"components":{"co":460.63,"no":92.98,"no2":33.59,"o3":0,"so2":3.25,"pm2_5":15.47,"pm10":17.59,"nh3":4.69},"dt":1635998400},{"main":{"aqi":2},"components":{"co":440.6,"no":81.36,"no2":34.62,"o3":0,"so2":3.46,"pm2_5":14.89,"pm10":16.98,"nh3":4.37},"dt":1636002000},{"main":{"aqi":2},"components":{"co":467.3,"no":92.09,"no2":35.64,"o3":0,"so2":4.47,"pm2_5":14.99,"pm10":17.08,"nh3":4.81},"dt":1636005600},{"main":{"aqi":2},"components":{"co":507.36,"no":116.23,"no2":37.7,"o3":0,"so2":5.42,"pm2_5":14.79,"pm10":16.93,"nh3":5.13},"dt":1636009200},{"main":{"aqi":2},"components":{"co":534.06,"no":135.9,"no2":38.39,"o3":0.02,"so2":5.31,"pm2_5":14.12,"pm10":16.45,"nh3":4.56},"dt":1636012800},{"main":{"aqi":2},"components":{"co":534.06,"no":135.9,"no2":37.36,"o3":0.11,"so2":4.71,"pm2_5":13.16,"pm10":15.76,"nh3":3.33},"dt":1636016400},{"main":{"aqi":2},"components":{"co":500.68,"no":111.76,"no2":37.7,"o3":0.37,"so2":4.53,"pm2_5":13.27,"pm10":16.41,"nh3":2.22},"dt":1636020000},{"main":{"aqi":2},"components":{"co":473.98,"no":91.2,"no2":38.73,"o3":0.74,"so2":4.65,"pm2_5":14.18,"pm10":17.69,"nh3":1.73},"dt":1636023600},{"main":{"aqi":2},"components":{"co":473.98,"no":92.98,"no2":39.41,"o3":0.88,"so2":4.89,"pm2_5":14.36,"pm10":17.9,"nh3":1.73},"dt":1636027200},{"main":{"aqi":2},"components":{"co":383.85,"no":31.74,"no2":54.84,"o3":3,"so2":4.89,"pm2_5":7.94,"pm10":10.06,"nh3":0.9},"dt":1636030800},{"main":{"aqi":2},"components":{"co":377.18,"no":22.58,"no2":56.21,"o3":4.34,"so2":4.89,"pm2_5":5.13,"pm10":6.72,"nh3":0.9},"dt":1636034400},{"main":{"aqi":2},"components":{"co":347.14,"no":9.72,"no2":51.41,"o3":7.06,"so2":4.35,"pm2_5":2.99,"pm10":4.21,"nh3":0.88},"dt":1636038000},{"main":{"aqi":2},"components":{"co":333.79,"no":4.3,"no2":52.09,"o3":5.01,"so2":3.79,"pm2_5":2.17,"pm10":3.32,"nh3":1.19},"dt":1636041600},{"main":{"aqi":2},"components":{"co":337.12,"no":5.81,"no2":55.52,"o3":1.88,"so2":2.98,"pm2_5":2.13,"pm10":3.25,"nh3":1.57},"dt":1636045200},{"main":{"aqi":2},"components":{"co":330.45,"no":4.08,"no2":48.67,"o3":3.8,"so2":2.12,"pm2_5":1.97,"pm10":2.89,"nh3":1.58},"dt":1636048800},{"main":{"aqi":1},"components":{"co":317.1,"no":1.1,"no2":39.76,"o3":12.52,"so2":1.64,"pm2_5":1.86,"pm10":2.7,"nh3":1.46},"dt":1636052400},{"main":{"aqi":1},"components":{"co":307.08,"no":0.24,"no2":33.59,"o3":23.25,"so2":1.46,"pm2_5":1.88,"pm10":2.88,"nh3":1.41},"dt":1636056000},{"main":{"aqi":1},"components":{"co":307.08,"no":0.1,"no2":30.16,"o3":29.33,"so2":1.42,"pm2_5":1.88,"pm10":3.27,"nh3":1.47},"dt":1636059600},{"main":{"aqi":1},"components":{"co":300.41,"no":0.06,"no2":26.73,"o3":32.9,"so2":1.3,"pm2_5":1.83,"pm10":3.47,"nh3":1.44},"dt":1636063200},{"main":{"aqi":1},"components":{"co":290.39,"no":0.01,"no2":18.34,"o3":41.13,"so2":1,"pm2_5":1.65,"pm10":3.2,"nh3":1.38},"dt":1636066800},{"main":{"aqi":1},"components":{"co":280.38,"no":0,"no2":10.97,"o3":50.07,"so2":0.85,"pm2_5":1.36,"pm10":2.56,"nh3":1.28},"dt":1793462226}]}'
  self:logging(3,"apiResult: " ..apiResult)

  jsonTable = json.decode(apiResult) -- Decode the json string from api to lua-table 
  
  self:getValues() -- Get the Values
  self:updateProperties() -- Update the Properties
  self:updateLabels() -- Update the Labels
  self:updateChildDevices() -- Update the Child Devices
  
  self:logging(3,"SetTimeout " ..interval .." seconds")
  fibaro.setTimeout(interval*1000, function() self:simData() end)
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

        if response.data == nil or response.data == "" or response.data == "[]" or response.status > 200 or not json.decode(response.data).list then -- Check for empty result
          self:warning("Temporarily no data from OpenWeatherMap.org")
          self:updateView("label1", "text", "Temporarily no data from OpenWeatherMap.org") 
          self:updateProperty("log", "No response")
          return 
        end

        jsonTable = json.decode(response.data) -- JSON decode from api to lua-table

        self:getValues() -- Get the Values
        self:updateProperties() -- Update the Properties
        self:updateLabels() -- Update the Labels
        self:updateChildDevices() -- Update the Child Devices

      end,
      error = function(error)
        self:error('error: ' ..json.encode(error))
        self:updateProperty("log", "error: " ..json.encode(error))
      end
    }) 

  self:logging(3,"SetTimeout " ..interval .." seconds")
  fibaro.setTimeout(interval*1000, function() self:getData() end)
end


function QuickApp:createVariables() -- Get all Variables or create them
  self:logging(3,"Start createVariables")
  data = {}
  data.AQI = "0"
  data.CO = "0"
  data.NO = "0"
  data.NO2 = "0"
  data.O3 = "0"
  data.SO2 = "0"
  data.NH3 = "0"
  data.PM25 = "0"
  data.PM10 = "0"
  data.DT = "0"
  
  data.AQI_TEXT = ""
  --data.CO_TEXT = ""
  --data.NO_TEXT = ""
  data.NO2_TEXT = ""
  data.O3_TEXT = ""
  --data.SO2_TEXT = ""
  --data.NH3_TEXT = ""
  data.PM25_TEXT = ""
  data.PM10_TEXT = ""
  
  data.fcAQI = "0"
  data.fcCO = "0"
  data.fcNO = "0"
  data.fcNO2 = "0"
  data.fcSO2 = "0"
  data.fcNH3 = "0"
  data.fcPM25 = "0"
  data.fcPM10 = "0"
  data.fcO3 = "0"
  data.fcDT = "0"
  
  data.fcAQI_TEXT = ""
  --data.fcCO_TEXT = ""
  --data.fcNO_TEXT = ""
  data.fcNO2_TEXT = ""
  data.fcO3_TEXT = ""
  --data.fcSO2_TEXT = ""
  --data.fcNH3_TEXT = ""
  data.fcPM25_TEXT = ""
  data.fcPM10_TEXT = ""
end


function QuickApp:getQuickAppVariables() -- Get all QuickApp Variables 
  local apiKey = self:getVariable("apiKey")
  local latitude = tonumber(self:getVariable("latitude"))
  local longitude = tonumber(self:getVariable("longitude"))
  forecast = tonumber(self:getVariable("forecast"))
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
  if forecast == 0 or forecast == nil or forecast > 96 then
    forecast = "24" -- default forecast period is 24 hours 
    self:setVariable("forecast", forecast)
    self:trace("Added QuickApp variable forecast with default value " ..forecast)
    forecast = tonumber(forecast) 
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
  address = "http://api.openweathermap.org/data/2.5/air_pollution/forecast" .."?lat=" ..latitude .."&lon=" ..longitude .."&appid=" ..apiKey -- Default path (Forecast) measurement
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
      {className="fcAQI",  name="AQI (fc)",               type="com.fibaro.multilevelSensor", value=0},
      {className="fcCO",   name="Carbon monoxide (fc)",   type="com.fibaro.multilevelSensor", value=0},
      {className="fcNO",   name="Nitrogen monoxide (fc)", type="com.fibaro.multilevelSensor", value=0},
      {className="fcNO2",  name="Nitrogen dioxide (fc)",  type="com.fibaro.multilevelSensor", value=0},
      {className="fcO3",   name="Ozone (fc)",             type="com.fibaro.multilevelSensor", value=0},
      {className="fcSO2",  name="Sulphur dioxide (fc)",   type="com.fibaro.multilevelSensor", value=0},
      {className="fcNH3",  name="Ammonia (fc)",           type="com.fibaro.multilevelSensor", value=0},
      {className="fcPM25", name="PM2.5 (fc)",             type="com.fibaro.multilevelSensor", value=0},
      {className="fcPM10", name="PM10 (fc)",              type="com.fibaro.multilevelSensor", value=0},
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
  
  if not api.get("/devices/"..self.id).enabled then
    self:warning("Device", fibaro.getName(plugin.mainDeviceId), "is disabled")
    return
  end
  
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