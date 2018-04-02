using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RockPaperScissorsWithInterfaces.Implementations;
using RockPaperScissorsWithInterfaces.Interfaces;

namespace RockPaperScissorsWithInterfaces
{
    public class RPSGame
    {
        private IChoiceSelector _myChoiceSelector;

        public RPSGame(IChoiceSelector choiceSelector)
        {
            _myChoiceSelector = choiceSelector;
        }
        
        public MatchResults PlayRound(Choice userChoice)
        {

            var result = new MatchResults();

            result.UserChoice = userChoice;
            result.OpponentChoice = _myChoiceSelector.GetOpponentChoice();

            if (result.UserChoice == result.OpponentChoice)
            {
                result.Result = GameResult.Tie;
                return result;
            }

            if ((result.OpponentChoice == Choice.Rock && result.UserChoice == Choice.Scissors) ||
                (result.OpponentChoice == Choice.Scissors && result.UserChoice == Choice.Paper) ||
                (result.OpponentChoice == Choice.Paper && result.UserChoice == Choice.Rock))
            {
                result.Result = GameResult.Loss;
                return result;
            }

            result.Result = GameResult.Win;
            return result;


        }
    }
}
