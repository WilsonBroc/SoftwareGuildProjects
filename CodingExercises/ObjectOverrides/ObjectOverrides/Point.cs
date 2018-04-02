using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ObjectOverrides
{
    public class Point
    {
        public int x;
        public int y;

        public Point(int x, int y)
        {
            this.x = x;
            this.y = y;
        }

        /// <summary>
        /// Returns my version of ToString() Gives you x and y
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            return string.Format($"{x}, {y}");
        }

        /// <summary>
        ///     Overrides base object equals and provides x y comparison.
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public override bool Equals(object obj)
        {
            if (obj.GetType() != this.GetType())
            {
                return false;
            }

            Point other = (Point) obj;
            return (this.x == other.x && this.y == other.y);
        }
    }
}
