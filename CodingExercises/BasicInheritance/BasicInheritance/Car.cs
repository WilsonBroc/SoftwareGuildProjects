using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasicInheritance
{
    public class Car
    {
        public readonly int _maxSpeed;

        public Car()
        {
            _maxSpeed = 55;
        }

        public Car(int max)
        {
            _maxSpeed = max;
        }

        private int _curSpeed;

        public int Speed
        {
            get { return _curSpeed; }
            set
            {
                _curSpeed = value;
                if (_curSpeed > _maxSpeed)
                    _curSpeed = _maxSpeed;
            }
        }
    }
}
