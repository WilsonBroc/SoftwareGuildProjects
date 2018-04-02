using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RPG.Inventory.Base
{
    public abstract class Item
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public int Weight { get; set; }
        public int Value { get; set; }
        public ItemType Type { get; set; }

        public Item()
        {
            Type = ItemType.Unknown;
        }
    }

    public enum ItemType
    {
        Unknown,
        Reagent,
        Weapon,
        Container
    }
}
