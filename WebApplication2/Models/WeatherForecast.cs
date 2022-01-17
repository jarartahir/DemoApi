using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication2.Models
{
    public class WeatherForecast
    {
        public int Id;
        public string Name;
        public string Base;
        public int Cod;
        public int Dt;
        public int Visibility;
        public Sys Sys;
        public Clouds Clouds;
        public Wind Wind;
        public Main Main;
        public Weather Weather;
        public Coord Coord;
    }

    public class Sys
    {
        public int Id;
        public string Country;
        public int Type;
        public int Sunrise;
        public int Sunset;
    }
    public class Clouds
    {
        public int all;
    }

    public class Wind
    {
        public int Speed;
        public int Deg;
        public int Gust;
    }

    public class Main
    {
        public double Temp;
        public int Feels_like;
        public double Temp_min;
        public double Temp_max;
        public int Pressure;
        public int Humidity;
        public int Sea_level;
        public int Grnd_level;

    }
    public class Weather
    {
        public int Id;
        public string Main;
        public string Description;
        public string Icon;
    }

    public class Coord
    {
        public double Lon;
        public double Lat;

    }
}