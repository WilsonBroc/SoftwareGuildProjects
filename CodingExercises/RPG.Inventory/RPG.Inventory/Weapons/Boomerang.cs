using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RPG.Inventory.Base;

namespace RPG.Inventory.Weapons
{
    public class Boomerang : Item
    {
        public Boomerang()
        {
            Name = "A wooden boomerang";
            Description = "I found this in level 1";
            Weight = 1;
            Value = 5;
            Type = ItemType.Weapon;
        }
    }
}
