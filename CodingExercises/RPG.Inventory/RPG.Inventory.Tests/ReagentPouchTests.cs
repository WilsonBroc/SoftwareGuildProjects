using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using RPG.Inventory.Containers;
using RPG.Inventory.Reagents;
using RPG.Inventory.Weapons;

namespace RPG.Inventory.Tests
{
    [TestFixture]
    public class ReagentPouchTests
    {
        [Test]
        public void CanAddReagent()
        {
            ReagentPouch bag = new ReagentPouch();
            Mushroom shroom = new Mushroom();

            bag.AddItem(shroom);

            Assert.AreEqual(1, bag.ItemCount);

            bag.DisplayContents();
        }

        [Test]
        public void CannotAddNonReagent()
        {
            ReagentPouch bag = new ReagentPouch();
            Cloth cloth = new Cloth();
            BattleAxe axe = new BattleAxe();

            bag.AddItem(cloth);
            bag.AddItem(axe);

            Assert.AreEqual(1, bag.ItemCount);

            bag.DisplayContents();
        }
    }
}
