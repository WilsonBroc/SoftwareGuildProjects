using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Factorizor.BLL;
using Factorizor.Models;
using NUnit.Framework;


namespace Factorizor.Tests
{
    [TestFixture]
    public class FactorCheckerTests
    {
        private FactorChecker _checker;

        [SetUp]
        public void RunBeforeTests()
        {
            _checker = new FactorChecker();
        }

        [TestCase(3, 3)]
        [TestCase(13, 13)]
        public void CheckFactorsReturnsNumberPassed(int number, int expected)
        {
            Factors result = _checker.CheckFactors(number);
            Assert.AreEqual(expected, result.Number);
        }

        [TestCase(6, new int[] {1, 2, 3})]
        [TestCase(13, new int[] {1})]
        public void TestForCorrectFactors(int number, int[] factors)
        {
            Factors result = _checker.CheckFactors(number);
            Assert.AreEqual(factors, result.MyFactors);
        }

        [TestCase(6, true)]
        [TestCase(13, false)]
        public void TestForPerfectNumber(int number, bool expected)
        {
            Factors result = _checker.CheckFactors(number);
            Assert.AreEqual(expected, result.IsPerfect);
        }

        [TestCase(6, false)]
        [TestCase(13, true)]
        public void TestForPrimeNumber(int number, bool expected)
        {
            Factors result = _checker.CheckFactors(number);
            Assert.AreEqual(expected, result.IsPrime);
        }

    }
}
