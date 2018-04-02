using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using WarmpupLoops;

namespace WarmupLoopsTests
{
    [TestFixture]
    public class LoopsTests
    {
        private Loops _loops;

        [SetUp]
        public void RunBeforeTests()
        {
            _loops = new Loops();
        }

        [TestCase("Hi", 2, "HiHi")]
        [TestCase("Hi", 3, "HiHiHi")]
        [TestCase("Hi", 1, "Hi")]
        public void StringTimesTest(string str, int n, string expected)
        {

            //Act
            string result = _loops.StringTimes(str, n);

            //Assert
            Assert.AreEqual(result, expected);
        }
    }
}
