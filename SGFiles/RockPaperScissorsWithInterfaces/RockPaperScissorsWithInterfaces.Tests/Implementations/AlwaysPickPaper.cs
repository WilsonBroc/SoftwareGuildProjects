using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RockPaperScissorsWithInterfaces.Interfaces;

namespace RockPaperScissorsWithInterfaces.Tests.Implementations
{
    public class AlwaysPickPaper : IChoiceSelector
    {
        public Choice GetOpponentChoice()
        {
            return Choice.Paper;
        }
    }
}
