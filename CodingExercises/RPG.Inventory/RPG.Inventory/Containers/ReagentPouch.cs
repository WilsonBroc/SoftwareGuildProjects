using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RPG.Inventory.Base;

namespace RPG.Inventory.Containers
{
    public class ReagentPouch : SpecificContainer
    {
        public ReagentPouch() : base(ItemType.Reagent, 12)
        {
            Name = "A small pouch";
            Description = string.Format("This belt pouch could hold {0} small reagents.", _capacity);
            Weight = 1;
            Value = 150;
            Type = ItemType.Container;
        }
    }
}
