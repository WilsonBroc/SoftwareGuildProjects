using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PolymorphismSample
{
    public class Square : Shape
    {
        public override string Draw()
        {
            return "Drawing a square (4 sides).";
        }
    }
}
