using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasicInheritance
{
    public class MiniVan : Car
    {
        public MiniVan() : base(45)
        {
            
        }

        public MiniVan(int maxSpeed) : base(maxSpeed)
        {
            
        }
    }
}
