using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LINQ
{
    public class Exercises
    {

        public void Ex01()
        {
            //Find all products that are out of stock...

            var products = DataLoader.LoadProducts();

            var results = products.Where(p => p.UnitsInStock == 0);

            foreach (var product in results)
            {
                Console.WriteLine(product.ProductName);
            }
        }

        public void Ex02()
        {
            var products = DataLoader.LoadProducts();

            var results = products.Where(p => p.UnitsInStock > 0 && p.UnitPrice > 3.00m);

            foreach (var product in results)
            {
                Console.WriteLine($"{product.ProductName,-35} {product.UnitsInStock,10} {product.UnitPrice,10:c}");
            }
        }

        public void Ex03()
        {
            var customers = DataLoader.LoadCustomers();
            var results = customers.Where(c => c.Region == "WA");
            foreach (var customer in results)
            {
                Console.WriteLine(customer.CompanyName);
                foreach (var order in customer.Orders)
                {
                    Console.WriteLine($"\t{order.OrderID} {order.Total:c}");
                }
            }
        }

        public void Ex04()
        {
            var products = DataLoader.LoadProducts();
            var results = products.Select(p => new {p.ProductName});

            foreach (var result in results)
            {
                Console.WriteLine($"{result.ProductName}");
            }
        }

        public void Ex05()
        {
            var products = DataLoader.LoadProducts();
            var results = products.Select(p => new {p, NewPrice = p.UnitPrice*1.25m});
            foreach (var result in results)
            {
                Console.WriteLine($"{result.p.ProductName,-35} {result.p.UnitPrice,15:c} {result.NewPrice,15:c}");
            }
        }

        public void Ex06()
        {
            var products = DataLoader.LoadProducts();
            var results = products
                .Select(p => new {ProductName = p.ProductName.ToUpper()});

            foreach (var result in results)
            {
                Console.WriteLine($"{result.ProductName}");
            }
        }

        public void Ex07()
        {
            var products = DataLoader.LoadProducts();

            var results = products.Where(p => p.UnitsInStock%2 == 0);

            foreach (var product in results)
            {
                Console.WriteLine($"{product.ProductName,-35} {product.UnitsInStock,5}");
            }
        }

        public void Ex08()
        {
            var products = DataLoader.LoadProducts();

            var results = products.Select(p => new {p.ProductName, p.Category, Price = p.UnitPrice});

            foreach (var result in results)
            {
                Console.WriteLine($"{result.ProductName,-35} {result.Category,-15} {result.Price:c}");
            }
        }

        public void Ex09()
        {
            var numB = DataLoader.NumbersB;
            var numC = DataLoader.NumbersC;

            var results = numB.Select((val, index) => new {valB = val, valC = numC[index]})
                .Where(item => item.valB < item.valC);

            foreach (var r in results)
            {
                Console.WriteLine($"{r.valB} - {r.valC}");
            }
        }

        public void Ex10()
        {
            var customers = DataLoader.LoadCustomers();
            var results = customers.Select(c => c.Orders.Where(o => o.Total < 500.00m));

            foreach (var result in results)
            {
                
            }
        }

        public void Ex11()
        {
            var nums = DataLoader.NumbersA;
            var results = nums.Take(3);

            foreach (var result in results)
            {
                Console.WriteLine(result);
            }
        }

        public void Ex12()
        {
            var customers = DataLoader.LoadCustomers();
            var results = customers.Where(c => c.Region == "WA");
            foreach (var customer in results)
            {
                Console.WriteLine(customer.CompanyName);
                var orders = customer.Orders.Take(3);
                foreach (var order in orders)
                {
                    Console.WriteLine($"\t{order.OrderID} {order.Total:c}");
                }
            }
        }

        public void Ex13()
        {
            var nums = DataLoader.NumbersA.Skip(3);

            foreach (var num in nums)
            {
                Console.WriteLine(num);
            }
        }

        public void Ex14()
        {
            var customers = DataLoader.LoadCustomers().Where(c => c.Region == "WA");

            foreach (var customer in customers)
            {
                Console.WriteLine($"{customer.CompanyName}");
                foreach (var order in customer.Orders.Skip(2))
                {
                    Console.WriteLine($"\t{order.OrderID} {order.Total:c}");
                }
            }
        }

        public void Ex15()
        {
            var nums = DataLoader.NumbersC.TakeWhile(c => c <= 6);

            foreach (var num in nums)
            {
                Console.WriteLine(num);
            }
        }

        public void Ex16()
        {
            var nums = DataLoader.NumbersC.TakeWhile((i,index) => i >= index);

            foreach (var num in nums)
            {
                Console.WriteLine(num);
            }
        }

        public void Ex17()
        {
            var nums = DataLoader.NumbersC.Where(c => c%3 == 0);

            foreach (var num in nums)
            {
                Console.WriteLine(num);
            }
        }

        public void Ex18()
        {
            var products = DataLoader.LoadProducts().OrderBy(p => p.ProductName);

            foreach (var product in products)
            {
                Console.WriteLine($"{product.ProductName}");
            }
        }

        public void Ex19()
        {
            var products = DataLoader.LoadProducts()
                .OrderByDescending(p => p.UnitsInStock);

            foreach (var product in products)
            {
                Console.WriteLine($"{product.ProductName,-35} {product.UnitsInStock}");
            }
        }

        public void Ex20()
        {
            var products = DataLoader.LoadProducts().OrderBy(p => p.Category).ThenByDescending(p => p.UnitPrice);

            foreach (var product in products)
            {
                Console.WriteLine($"{product.Category,-20} {product.UnitPrice,10:c} {product.ProductName}");
            }
        }

        public void Ex21()
        {
            var nums = DataLoader.NumbersC.Reverse();

            foreach (var num in nums)
            {
                Console.WriteLine(num);
            }
        }

        public void Ex22()
        {
            var nums = DataLoader.NumbersC;
            var results = nums.GroupBy(n => n%5);
            foreach (var result in results)
            {
                Console.WriteLine(result.Key);
                foreach (var i in result)
                {
                    Console.WriteLine("\t{0}", i);
                }
            }
        }

        public void Ex23()
        {
            var results = DataLoader.LoadProducts().GroupBy(p => p.Category);

            foreach (var result in results)
            {
                Console.WriteLine(result.Key);
                foreach (var product in result)
                {
                    Console.WriteLine($"\t{product.ProductName}");
                }
            }
        }

        public void Ex24()
        {
            var customers = DataLoader.LoadCustomers();

            var result = from c in customers
                select
                    new
                    {
                        c.CompanyName,
                        yearOrder = from o in c.Orders
                            group o by o.OrderDate.Year
                            into yo
                            select new
                            {
                                year = yo.Key,
                                MonthGroup = from o in yo
                                    group o by o.OrderDate.Month
                                    into mo
                                    select new
                                    {
                                        Month = mo.Key,
                                        Orders = from o in mo
                                            group o by o.OrderID
                                            into oid
                                            select new
                                            {
                                                orderId = oid.Key
                                            }
                                    }
                            }
                    };

            foreach (var r in result)
            {
                Console.WriteLine("{0}", r.CompanyName);
                foreach (var y  in r.yearOrder)
                {
                    Console.WriteLine("\t{0}", y.year);
                    foreach (var m in y.MonthGroup)
                    {
                        Console.WriteLine("\t\t{0}", m.Month);
                        foreach (var o in m.Orders)
                        {
                            Console.WriteLine("\t\t\t{0}", o.orderId);
                        }
                    }
                }
            }
        }

        public void Ex25()
        {
            var results = DataLoader.LoadProducts().Select(c => c.Category).Distinct();
            foreach (var result in results)
            {
                Console.WriteLine(result);
            }
        }

        public void Ex26()
        {
            var nums = DataLoader.NumbersA.Union(DataLoader.NumbersB);
            foreach (var num in nums)
            {
                Console.WriteLine(num);
            }
        }

        public void Ex27()
        {
            var nums = DataLoader.NumbersA.Intersect(DataLoader.NumbersB);
            foreach (var num in nums)
            {
                Console.WriteLine(num);
            }
        }

        public void Ex28()
        {
            var nums = DataLoader.NumbersA.Except(DataLoader.NumbersB);
            foreach (var num in nums)
            {
                Console.WriteLine(num);
            }
        }

        public void Ex29()
        {
            var product = DataLoader.LoadProducts().First(p => p.ProductID == 12);

            Console.WriteLine(product.ProductName);
        }

        public void Ex30()
        {
            var exists = DataLoader.LoadProducts().Exists(p => p.ProductID == 789);

            Console.WriteLine(exists);
        }

        public void Ex31()
        {
            Console.WriteLine("Not Implemented");
        }

        public void Ex32()
        {
            Console.WriteLine("Not Implemented");
        }

        public void Ex33()
        {
            var products = DataLoader.LoadProducts();

            var results = products.GroupBy(p => p.Category)
                .Where(p => p.All(i => i.UnitsInStock > 0));

            foreach (var result in results)
            {
                Console.WriteLine(result.Key);
                foreach (var product in result)
                {
                    Console.WriteLine("\t{0} {1}", product.ProductName, product.UnitsInStock);
                }
            }
        }

        public void Ex34()
        {
            Console.WriteLine("Not Implemented");
        }

        public void Ex35()
        {
            Console.WriteLine("Not Implemented");
        }

        public void Ex36()
        {
            Console.WriteLine("Not Implemented");
        }

        public void Ex37()
        {
            Console.WriteLine("Not Implemented");
        }

        public void Ex38()
        {
            var products = DataLoader.LoadProducts();

            var result = products.GroupBy(p => p.Category).Select(pcat => new
            {
                catecory = pcat.Key,
                prod = (
                    pcat.OrderBy(pu => pu.UnitPrice).Select(pu => new
                    {
                        pu.ProductName, pu.UnitPrice
                    }).First()
                )
            });
        }

        public void Ex39()
        {
            var products = DataLoader.LoadProducts();

            var result = products.GroupBy(p => p.Category).Select(pcat => new
            {
                category = pcat.Key,
                count =
                    (pcat.OrderByDescending(pu => pu.UnitPrice)
                        .Select(pu => new {pu.ProductName, pu.UnitPrice})).First(),
            });

            foreach (var i in result)
            {
                Console.WriteLine("\n {0} - {1} - {2}", i.category, i.count.ProductName, i.count.UnitPrice);
            }
        }

        public void Ex40()
        {
            Console.WriteLine("Not Implemented");
        }
    }
}
