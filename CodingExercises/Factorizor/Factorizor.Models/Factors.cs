using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Factorizor.Models
{
    public class Factors
    {
        public int Number { get; set; }
        public List<int> MyFactors { get; set; }
        public bool IsPerfect { get; set; }
        public bool IsPrime { get; set; }
    }
}
