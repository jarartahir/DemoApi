using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using WebApplication2.Models;

namespace WebApplication2.Controllers
{
    public class DemoApiController : ApiController
    {
        // GET api/values
        weatherEntities _context = new weatherEntities();


        public WeatherForecast Get(string cityName)
        {
            var result = (from c in _context.Cities
                          from co in _context.Countries
                          where c.Country_Id == co.Id
                          join w in _context.weather_forecast
                          on c.Id equals w.city_id
                          where c.City_Name.ToLower() == cityName.ToLower()
                          select new WeatherForecast
                          {
                              Id = c.Id,
                              Name = c.City_Name,
                              Base = "BaseValue",
                              Dt = 1,
                              Clouds = new Clouds
                              {
                                  all = 1
                              },
                              Cod = 1,
                              Visibility = 12,
                              Coord = new Coord
                              {
                                  Lat = c.lat,
                                  Lon = c.lon
                              },
                              Main = new Main
                              {
                                  Temp = w.temperature,
                                  Temp_min = w.min_temperature,
                                  Temp_max = w.max_temperature,
                                  Humidity = w.humidity,
                                  Feels_like = 12,
                                  Grnd_level = 22,
                                  Pressure = w.air_pressure,
                                  Sea_level = 12
                              },
                              Sys = new Sys
                              {
                                  Id = co.Id,
                                  Country = co.CountryCode,
                                  Sunrise = 122,
                                  Sunset = 222,
                                  Type = 12
                              },
                              Weather = new Weather
                              {
                                  Id = w.Id,
                                  Description = "",
                                  Icon = w.icon,
                                  Main = w.main
                              },
                              Wind = new Wind
                              {
                                  Deg = w.wind_direction,
                                  Gust = 22,
                                  Speed = 23
                              }

                          }).FirstOrDefault();


            return result;
        }

        public WeatherForecast Get(int cityId)
        {
            var result = (from c in _context.Cities
                          from co in _context.Countries
                          where c.Country_Id == co.Id
                          join w in _context.weather_forecast
                          on c.Id equals w.city_id
                          where c.Id == cityId
                          select new WeatherForecast
                          {
                              Id = c.Id,
                              Name = c.City_Name,
                              Base = "BaseValue",
                              Dt = 1,
                              Clouds = new Clouds
                              {
                                  all = 1
                              },
                              Cod = 1,
                              Visibility = 12,
                              Coord = new Coord
                              {
                                  Lat = c.lat,
                                  Lon = c.lon
                              },
                              Main = new Main
                              {
                                  Temp = w.temperature,
                                  Temp_min = w.min_temperature,
                                  Temp_max = w.max_temperature,
                                  Humidity = w.humidity,
                                  Feels_like = 12,
                                  Grnd_level = 22,
                                  Pressure = w.air_pressure,
                                  Sea_level = 12
                              },
                              Sys = new Sys
                              {
                                  Id = co.Id,
                                  Country = co.CountryCode,
                                  Sunrise = 122,
                                  Sunset = 222,
                                  Type = 12
                              },
                              Weather = new Weather
                              {
                                  Id = w.Id,
                                  Description = "",
                                  Icon = w.icon,
                                  Main = w.main
                              },
                              Wind = new Wind
                              {
                                  Deg = w.wind_direction,
                                  Gust = 22,
                                  Speed = 23
                              }

                          }).FirstOrDefault();


            return result;
        }

        public WeatherForecast Get(int lat, int lon)
        {
            var result = (from c in _context.Cities
                          from co in _context.Countries
                          where c.Country_Id == co.Id
                          join w in _context.weather_forecast
                          on c.Id equals w.city_id
                          where c.lat == lat && c.lon == lon
                          select new WeatherForecast
                          {
                              Id = c.Id,
                              Name = c.City_Name,
                              Base = "BaseValue",
                              Dt = 1,
                              Clouds = new Clouds
                              {
                                  all = 1
                              },
                              Cod = 1,
                              Visibility = 12,
                              Coord = new Coord
                              {
                                  Lat = c.lat,
                                  Lon = c.lon
                              },
                              Main = new Main
                              {
                                  Temp = w.temperature,
                                  Temp_min = w.min_temperature,
                                  Temp_max = w.max_temperature,
                                  Humidity = w.humidity,
                                  Feels_like = 12,
                                  Grnd_level = 22,
                                  Pressure = w.air_pressure,
                                  Sea_level = 12
                              },
                              Sys = new Sys
                              {
                                  Id = co.Id,
                                  Country = co.CountryCode,
                                  Sunrise = 122,
                                  Sunset = 222,
                                  Type = 12
                              },
                              Weather = new Weather
                              {
                                  Id = w.Id,
                                  Description = "",
                                  Icon = w.icon,
                                  Main = w.main
                              },
                              Wind = new Wind
                              {
                                  Deg = w.wind_direction,
                                  Gust = 22,
                                  Speed = 23
                              }

                          }).FirstOrDefault();


            return result;
        }


    }
}
