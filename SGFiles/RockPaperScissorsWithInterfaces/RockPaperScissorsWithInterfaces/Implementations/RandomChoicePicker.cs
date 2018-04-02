using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RockPaperScissorsWithInterfaces.Interfaces;

namespace RockPaperScissorsWithInterfaces.Implementations
{
    public class RandomChoicePicker : IChoiceSelector
    {
        private Random rng = new Random();

        public Choice GetOpponentChoice()
        {
            int i = rng.Next(0, 3);

            switch (i)
            {
                case 0:
                    return Choice.Rock;
                case 1:
                    return Choice.Paper;
                default:
                    return Choice.Scissors;
                 
            }
        }
    }
}
