using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RockPaperScissorsWithInterfaces.Interfaces;

namespace RockPaperScissorsWithInterfaces.Implementations
{
    public class WeightedRockPicker : IChoiceSelector
    {
        private Random rng = new Random();

        public Choice GetOpponentChoice()
        {
            int i = rng.Next(1, 101);

            if (i <= 70)
                return Choice.Rock;

            if (i <= 90)
                return  Choice.Paper;

            return Choice.Scissors;
        }
    }
}
