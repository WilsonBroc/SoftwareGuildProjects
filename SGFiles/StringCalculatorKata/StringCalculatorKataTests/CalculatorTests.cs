using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using StringCalculatorKata;

namespace StringCalculatorKataTests
{
    [TestFixture]
    public class CalculatorTests
    {
        private Calculator _stringCalc;

        [SetUp]
        public void BeforeEachTest()
        {
            _stringCalc = new Calculator();
        }

        [Test]
        public void Add_EmptyStringReturnsZero()
        {
            //Act
            int result = _stringCalc.Add("");

            //Assert
            Assert.AreEqual(0, result);
        }

        [Test]
        public void Add_ReturnsNumberWithOneInput()
        {
            //Act
            int result = _stringCalc.Add("5");

            //Assert
            Assert.AreEqual(5, result);
        }

        [TestCase("1,2", 3)]
        [TestCase("2,3", 5)]
        [TestCase("10,20", 30)]
        public void Add_HandleTwoNumbers(string input, int expected)
        {
            int result = _stringCalc.Add(input);

            Assert.AreEqual(expected, result);
        }

        [TestCase("1,2,3", 6)]
        [TestCase("10,20,30,40", 100)]
        [TestCase("1,1,1,1,1", 5)]
        public void Add_HandleUnkownNumberOfArgs(string input, int expected)
        {
            int result = _stringCalc.Add(input);

            Assert.AreEqual(expected, result);
        }
    }
}
