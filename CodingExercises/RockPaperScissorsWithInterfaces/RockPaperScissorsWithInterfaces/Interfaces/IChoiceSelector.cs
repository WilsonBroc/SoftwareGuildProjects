using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RockPaperScissorsWithInterfaces.Interfaces
{
    public interface IChoiceSelector
    {
        Choice GetOpponentChoice();
    }
}
