SOON TO COME
The QuickApp Air Quality OpenWeatherMap provides the current measurement for your location on Air Quality. 
Besides basic Air Quality Index the QuickApp provides also data about polluting gases such as Carbon monoxide (CO), Nitrogen monoxide (NO), Nitrogen dioxide (NO2), Ozone (O3), Sulphur dioxide (SO2), Ammonia (NH3), and particulates (PM2.5 and PM10). 
This QuickApp has Child Devices for Carbon monoxide (CO), Nitrogen monoxide (NO), Nitrogen dioxide (NO2), Ozone (O3), Sulphur dioxide (SO2), Ammonia (NH3), PM2.5 and PM10. 


Common Air Quality Index (CAQI)
The Common Air Quality Index (CAQI) is an air quality index used in Europe since 2006. In November 2017, the European Environment Agency announced the European Air Quality Index (EAQI) and started encouraging its use on websites and for other ways of informing the public about air quality. 
As of 2012, the EU-supported project CiteairII argued that the CAQI had been evaluated on a "large set" of data, and described the CAQI's motivation and definition. CiteairII stated that having an air quality index that would be easy to present to the general public was a major motivation, leaving aside the more complex question of a health-based index, which would require, for example, effects of combined levels of different pollutants. The main aim of the CAQI was to have an index that would encourage wide comparison across the EU, without replacing local indices. CiteairII stated that the "main goal of the CAQI is not to warn people for possible adverse health effects of poor air quality but to attract their attention to urban air pollution and its main source (traffic) and help them decrease their exposure."
The CAQI is a number on a scale from 1 to 100, where a low value means good air quality and a high value means bad air quality. The index is defined in both hourly and daily versions, and separately near roads (a "roadside" or "traffic" index) or away from roads (a "background" index). As of 2012, the CAQI had two mandatory components for the roadside index, NO2 and PM10, and three mandatory components for the background index, NO2, PM10 and O3. It also included optional pollutants PM2.5, CO and SO2. A "sub-index" is calculated for each of the mandatory (and optional if available) components. The CAQI is defined as the sub-index that represents the worst quality among those components.

Here is a description of Air Quality index levels:

Qualitative name Index Pollutant concentration in μg/m3: 
-          Index   NO2       PM10     O3      PM25 (optional)
- Good        1    0-50      0-25     0-60    0-15
- Fair        2   50-100    25-50    60-120   15-30
- Moderate    3   100-200   50-90    120-180  30-55
- Poor        4   200-400   90-180   180-240  55-110
- Very Poor   5    >400      >180     >240     >110

See more on CAQI: https://en.wikipedia.org/wiki/Air_quality_index


IMPORTANT
- You need an API key and Polygon ID from https://home.openweathermap.org/users/sign_up
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
- apiKey = Get your free API key from https://agromonitoring.com
- latitude = latitude of your location (Default is the latitude of your HC3)
- longitude = longitude of your location (Default is the longitude of your HC3)
- interval = [number] in seconds time to get the data from the API
- timeout = [number] in seconds for http timeout
- debugLevel = Number (1=some, 2=few, 3=all, 4=simulation mode) (default = 1)
