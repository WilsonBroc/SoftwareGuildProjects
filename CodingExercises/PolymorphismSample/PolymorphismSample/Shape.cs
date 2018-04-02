using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PolymorphismSample
{
    public class Shape
    {
        public virtual string Draw()
        {
            return "Drawing a shape";
        }
    }
}
