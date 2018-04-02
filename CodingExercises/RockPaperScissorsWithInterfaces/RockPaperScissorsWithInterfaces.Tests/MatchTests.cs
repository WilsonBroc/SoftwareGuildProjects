using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using RockPaperScissorsWithInterfaces.Implementations;
using RockPaperScissorsWithInterfaces.Tests.Implementations;

namespace RockPaperScissorsWithInterfaces.Tests
{
    [TestFixture]
    public class MatchTests
    {
        [Test]
        public void PaperBeatsRock()
        {
            var userChoice = Choice.Rock;
            var g = new RPSGame(new AlwaysPickPaper());

            var result = g.PlayRound(userChoice);

            Assert.AreEqual(GameResult.Loss, result.Result);
        }
    }
}
