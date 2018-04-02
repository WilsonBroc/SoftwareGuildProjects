using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using RPG.Inventory.Containers;
using RPG.Inventory.Weapons;

namespace RPG.Inventory.Tests
{
    [TestFixture]
    public class SatchelTests
    {
        [Test]
        public void CanAddLittleItems()
        {
            Satchel bag = new Satchel();
            Boomerang rang = new Boomerang();
            WoodenSword sword = new WoodenSword();

            bag.AddItem(rang);
            bag.AddItem(sword);

            Assert.AreEqual(2, bag.ItemCount);

            bag.DisplayContents();
        }

        [Test]
        public void CannotAddBigItems()
        {
            Satchel bag = new Satchel();
            WoodenSword sword = new WoodenSword();
            BattleAxe axe = new BattleAxe();

            bag.AddItem(sword);
            bag.AddItem(axe);

            Assert.AreEqual(1, bag.ItemCount);

            bag.DisplayContents();
        }
    }
}
