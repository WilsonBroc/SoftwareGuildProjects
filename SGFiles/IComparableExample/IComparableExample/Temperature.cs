using System;
using System.Collections.Generic;
using System.Diagnostics.Contracts;
using System.Dynamic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IComparableExample
{
    public class Temperature : IComparable
    {
        public double Fahrenheit { get; set; }

        public double Celsius
        {
            get { return ((Fahrenheit - 32)*(5.0/9)); }
            set { Fahrenheit = (value*9.0/5) + 32; }
        }

        public int CompareTo(object obj)
        {
            if (obj == null) return 1;

            var otherTemperature = obj as Temperature;

            if (otherTemperature != null)
            {
                if (this.Fahrenheit < otherTemperature.Fahrenheit)
                    return -1;
                if (this.Fahrenheit == otherTemperature.Fahrenheit)
                    return 0;

                return 1;
            }
            else
            {
                throw new ArgumentException("Object is not a Temperature");
            }

        }
    }
}
