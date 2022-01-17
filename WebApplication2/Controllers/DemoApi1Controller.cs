using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using WebApplication2.Models;

namespace WebApplication2.Controllers
{
    public class DemoApi1Controller : ApiController
    {

        public SqlConnection _conn;

        public WeatherForecast Get(string cityName)
        {
            return GetDataUsingQuery(cityName);

        }


        public WeatherForecast Get(int cityId)
        {
            return GetDataUsingQuery(cityId: cityId);
        }

        public WeatherForecast Get(float lon, float lat)
        {
            return GetDataUsingQuery(lon: lon, lat: lat);
        }


        private WeatherForecast GetDataUsingQuery(string cityName = null, int cityId = 0, float lat = 0, float lon = 0)
        {
            WeatherForecast wf = new WeatherForecast();

            _conn = connection();


            string myString = "select c.Id as cityId, c.City_name as cityName,co.Id as countryId, co.CountryCode as countryCode"
                + ",w.Id as weatherId, w.temperature as temp, w.min_temperature as minTemp, w.max_temperature as maxTemp,"
                + "w.air_pressure as airPressure, w.humidity as humidity, c.lon as lon, c.lat as lat, w.icon as icon, w.main as main,"
                + "w.wind_direction as windDirec, w.wind_speed as windSpeed from Country co ,city c join weather_forecast w "
                + " on c.Id = w.city_id";

            if (cityName != null)
            {
                myString += $" where Lower(City_name) = Lower('{cityName}') and c.Country_id = co.Id";
            }
            else if (cityId != 0)
            {
                myString += $" where c.Id = {cityId} and c.Country_id = co.Id";
            }
            else
            {
                myString += $" where c.lon = {lon} and c.lat = {lat} and c.Country_id = co.Id";

            }
            SqlCommand oCmd = new SqlCommand(myString, _conn);
            _conn.Open();
            SqlDataReader r = oCmd.ExecuteReader();

            while (r.Read())
            {
                WeatherForecast weatherForecast = new WeatherForecast
                {
                    Id = (Int32)r["cityId"],
                    Name = r["cityName"].ToString(),
                    Base = "Base",
                    Cod = 200,
                    Dt = 3600,
                    Visibility = 1001,
                    Coord = new Coord
                    {
                        Lat = float.Parse(r["lat"].ToString()),
                        Lon = float.Parse(r["lon"].ToString())
                    },
                    Main = new Main
                    {
                        Temp = float.Parse(r["temp"].ToString()),
                        Temp_min = float.Parse(r["mintemp"].ToString()),
                        Temp_max = float.Parse(r["maxtemp"].ToString()),
                        Humidity = (Int32)r["humidity"],
                        Pressure = (Int32)r["airPressure"],
                        Feels_like = 142,
                        Grnd_level = 144,
                        Sea_level = 54
                    },
                    Clouds = new Clouds
                    {
                        all = 12
                    },
                    Sys = new Sys
                    {
                        Id = (Int32)r["countryId"],
                        Country = r["countryCode"].ToString(),
                        Sunrise = 123,
                        Sunset = 1235,
                        Type = 12
                    },



                };
                wf = weatherForecast;

            }

            _conn.Close();
            return wf;
        }
        private SqlConnection connection()
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = "data source=DESKTOP-GTLFN9H; Initial catalog=weather;Trusted_Connection=True";
            cnn = new SqlConnection(connetionString);
            return cnn;
        }
    }
}
