using System;

namespace iConsole.DataAccessLayer.Utility
{
    public class Shared
    {
        public static string ConnectionString
        {
            get { return System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"]; }
        }

        public static string OtherConnectionString
        {
            get { return System.Configuration.ConfigurationSettings.AppSettings["OtherConnectionString"]; }
        }
    }
}
