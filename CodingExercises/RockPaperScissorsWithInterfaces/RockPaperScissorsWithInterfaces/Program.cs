using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RockPaperScissorsWithInterfaces.Implementations;
using RockPaperScissorsWithInterfaces.Interfaces;

namespace RockPaperScissorsWithInterfaces
{
    class Program
    {
        static void Main(string[] args)
        {
            string mode;
            Console.WriteLine("ROCK PAPER SCISSORS!!!");
            Console.Write("Choose your game mode (N)ormal, (E)asy:");
            mode = Console.ReadLine().ToUpper();
            IChoiceSelector choiceType;
            switch (mode)
            {
                case "N":
                    choiceType = new RandomChoicePicker();
                    break;
                default:
                    choiceType = new WeightedRockPicker();
                    break;
            }

            RPSGame game = new RPSGame(choiceType);
            string input = "";

            do
            {
                Choice userChoice = GetUserChoice();
                var result = game.PlayRound(userChoice);
                ProcessResult(result);

                Console.Write("Press Q to quit: ");
                input = Console.ReadLine().ToUpper();
            } while (input != "Q");
        }

        private static void ProcessResult(MatchResults result)
        {
            Console.WriteLine("You picked {0}, your opponent picked {1}",
                Enum.GetName(typeof(Choice), result.UserChoice), 
                Enum.GetName(typeof(Choice), result.OpponentChoice));

            switch (result.Result)
            {
                case GameResult.Tie:
                    Console.WriteLine("You Tied!");
                    break;
                case GameResult.Win:
                    Console.WriteLine("You Won!");
                    break;
                default:
                    Console.WriteLine("You Lose!");
                    break;
            }
        }

        private static Choice GetUserChoice()
        {
            Console.Clear();
            Console.Write("Player 1: Enter a choice (R)ock, (P)aper, (S)cissors: ");
            string input = Console.ReadLine().ToUpper();

            switch (input)
            {
                case "P":
                    return Choice.Paper;
                case "S":
                    return Choice.Scissors;
                default:
                    return Choice.Rock;
            }
        }
    }
}
