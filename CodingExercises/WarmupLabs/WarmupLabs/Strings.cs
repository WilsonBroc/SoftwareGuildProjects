using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WarmupLabs
{
    public class Strings
    {

        //SayHi
        public string SayHi(string name)
        {
            return string.Format("Hello {0}!", name);
        }

        //Abba
        public string Abba(string a, string b)
        {
            return string.Format("{0}{1}{1}{0}", a, b);
        }
    }
}
