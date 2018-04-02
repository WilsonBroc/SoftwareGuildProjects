using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RPG.Inventory.Base;

namespace RPG.Inventory.Weapons
{
    public class WoodenSword : Item
    {
        public WoodenSword()
        {
            Name = "A wooden sword";
            Description = "It's dangerous to go alone, take this.";
            Weight = 1;
            Value = 10;
            Type = ItemType.Weapon;
        }
    }
}
