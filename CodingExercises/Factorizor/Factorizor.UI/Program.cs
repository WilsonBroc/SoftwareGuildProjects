using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Factorizor.UI.Workflows;

namespace Factorizor.UI
{
    class Program
    {
        static void Main(string[] args)
        {
            FactorWorkflow workflow = new FactorWorkflow();
            workflow.Execute();
        }
    }
}
