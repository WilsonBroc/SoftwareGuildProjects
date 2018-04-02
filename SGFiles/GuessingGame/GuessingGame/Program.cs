using System;
using System.Collections.Generic;
using System.Linq;
using System.Speech.Synthesis;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace GuessingGame
{
    class Program
    {
        static void Main(string[] args)
        {
            string playerName;
            
            PromptTheUser("Welcome to the Guessing Game!");
            PlayThemeMusic();
            PromptTheUser("Please enter your name before we start: ");
            playerName = Console.ReadLine();

            Console.Clear();
            PromptTheUser($"Alright {playerName}, just press enter when you are ready to begin.");
            Console.ReadLine();

            string input;
            do
            {
                PlayGame(playerName);
                PromptTheUser("Press Y to Play Again or Q to quit");
                input = Console.ReadKey().Key.ToString();
                if (input.ToUpper() != "Y")
                    break;
            } while (true);

            Console.Clear();
            PromptTheUser($"{playerName} Thanks for playing.  Come back again!");
            Thread.Sleep(2000);
        }

        static void PlayGame(string playerName)
        {
            string playerInput;
            int playerInputInt;
            int theAnswer;
            bool isNumberGuessed = false;
            int guesses = 0;

            Random rng = new Random();
            theAnswer = 5; //rng.Next(1, 21);
            Console.Clear();

            PromptTheUser($"OK {playerName}, Enter your guess (1-20): ");
            do
            {
                playerInput = Console.ReadLine();

                if (playerInput.ToUpper() == "Q")
                    break;

                //attempt to convert to a number
                if (int.TryParse(playerInput, out playerInputInt))
                {
                    if (playerInputInt > 0 && playerInputInt < 21)
                    {
                        guesses++;
                        // see if the user won
                        Console.Clear();
                        PromptTheUser($"You guessed {playerInput}");
                        if (playerInputInt == theAnswer)
                        {
                            if (guesses == 1)
                                PromptTheUser($"You got it in the first try!  You are a rock star {playerName}!");
                            else
                                PromptTheUser($"{playerName} you Got It!! It took you {guesses} guesses to get it right.");

                            isNumberGuessed = true;
                        }
                        else
                        {
                            if (playerInputInt > theAnswer)
                                PromptTheUser("Too High! Enter another guess.");
                            else
                                PromptTheUser("Too Low! Enter another guess.");
                        }
                    }
                    else
                    {
                        Console.Clear();
                        PromptTheUser("Your number was not between 1 and 20.");
                    }
                    
                }
                else
                {
                    PromptTheUser("Don't you know what a number is?  Try again.");
                }

            } while (!isNumberGuessed);
        }

        static void PlayThemeMusic()
        {

            Console.Beep(440, 500);
            Console.Beep(440, 500);
            Console.Beep(440, 500);
            Console.Beep(349, 350);
            Console.Beep(523, 150);
            Console.Beep(440, 500);
            Console.Beep(349, 350);
            Console.Beep(523, 150);
            Console.Beep(440, 1000);
            Console.Beep(659, 500);
            Console.Beep(659, 500);
            Console.Beep(659, 500);
            Console.Beep(698, 350);
            Console.Beep(523, 150);
            Console.Beep(415, 500);
            Console.Beep(349, 350);
            Console.Beep(523, 150);
            Console.Beep(440, 1000);
        }

        static void PromptTheUser(string prompt)
        {
            SpeechSynthesizer synth = new SpeechSynthesizer();
            synth.SetOutputToDefaultAudioDevice();
            Console.WriteLine(prompt);
            synth.Speak(prompt);
        }
    }
}
