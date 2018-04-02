using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RPG.Inventory.Base
{
    public abstract class SpecificContainer : Container
    {
        private ItemType _typeMustBe;

        public SpecificContainer(ItemType containerType, int capacity) : base(capacity)
        {
            _typeMustBe = containerType;
        }

        public override void AddItem(Item itemToAdd)
        {
            if (itemToAdd.Type != _typeMustBe)
                Console.WriteLine("This is not a valid item for this container!");
            else
                base.AddItem(itemToAdd);
        }
    }
}
