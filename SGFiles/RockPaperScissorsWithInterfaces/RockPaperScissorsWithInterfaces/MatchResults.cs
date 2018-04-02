using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RockPaperScissorsWithInterfaces
{
    public class MatchResults
    {
        public Choice UserChoice { get; set; }
        public Choice OpponentChoice { get; set; }
        public GameResult Result { get; set; }
    }
}
