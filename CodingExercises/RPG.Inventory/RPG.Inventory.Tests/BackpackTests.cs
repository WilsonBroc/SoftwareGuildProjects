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
    public class BackpackTests
    {
        [Test]
        public void PutItemInBackpackSuccessfully()
        {
            //Arrange
            Backpack bag = new Backpack();
            Boomerang rang = new Boomerang();
            WoodenSword sword = new WoodenSword();
            BattleAxe axe = new BattleAxe();

            //Act
            bag.AddItem(rang);
            bag.AddItem(sword);
            bag.AddItem(axe);

            //Assert
            Assert.AreEqual(3, bag.ItemCount);

            bag.DisplayContents();
        }
    }
}
