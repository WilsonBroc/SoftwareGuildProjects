using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExceptionExamples
{
    public class MySpecificException : Exception
    {
        public MySpecificException(string message) : base(message)
        {
            HelpLink = "http://www.google.com";
        }
    }
}
