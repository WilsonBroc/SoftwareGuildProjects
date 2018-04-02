using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RPG.Inventory.Base
{
    public abstract class Container : Item
    {
        protected int _capacity;
        protected int _currentIndex;
        protected Item[] _itemsInBag;

        public Container(int capacity)
        {
            _capacity = capacity;
            _itemsInBag = new Item[_capacity];
            _currentIndex = 0;
        }

        public virtual void AddItem(Item itemToAdd)
        {
            _itemsInBag[_currentIndex] = itemToAdd;
            _currentIndex++;
        }

        public virtual Item RemoveItem()
        {
            Item itemToReturn = _itemsInBag[_currentIndex-1];
            _itemsInBag[_currentIndex-1] = null;
            _currentIndex--;
            return itemToReturn;
        }

        public virtual void DisplayContents()
        {
            Console.WriteLine("Items in bag: ");

            foreach (Item item in _itemsInBag)
            {
                if (item != null)
                {
                    Console.WriteLine("\t{0} - {1}", item.Name, item.Description);
                }
            }
        }

        public int ItemCount { get { return _currentIndex;} }
    }
}
