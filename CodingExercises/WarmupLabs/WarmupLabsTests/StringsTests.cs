using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using WarmupLabs;

namespace WarmupLabsTests
{
    [TestFixture]
    public class StringsTests
    {
        private Strings _strings;

        [SetUp]
        public void BeforeEachTest()
        {
            _strings = new Strings();
        }

        [TestCase("Bob", "Hello Bob!")]
        [TestCase("Alice", "Hello Alice!")]
        [TestCase("X", "Hello X!")]
        public void SayHiReturnsExpected(string input, string expected)
        {
            string result = _strings.SayHi(input);
            Assert.AreEqual(expected, result);
        }

        [TestCase("Hi", "Bye", "HiByeByeHi")]
        [TestCase("Yo", "Alice", "YoAliceAliceYo")]
        [TestCase("What", "Up", "WhatUpUpWhat")]
        public void AbbaReturnsExpected(string a, string b, string expected)
        {
            string result = _strings.Abba(a, b);
            Assert.AreEqual(expected, result);
        }
    }
}
