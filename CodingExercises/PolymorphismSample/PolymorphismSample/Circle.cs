using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PolymorphismSample
{
    class Circle : Shape
    {
        public decimal Radius { get; set; }

        public override string Draw()
        {
            return "Drawing a Circle";
        }
    }
}
