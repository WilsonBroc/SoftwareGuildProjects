using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PolymorphismSample
{
    public class Triangle : Shape
    {
        public override string Draw()
        {
            return "I am a triangle!";
        }
    }
}
