using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace FunWithLinq
{
    class Program
    {
        static void Main(string[] args)
        {
            ProductInfo[] itemsInStock = new[]
            {
                new ProductInfo
                {
                    Name="Mac's Coffee",
                    Description = "Coffee with Teeth",
                    NumberInStock = 24
                },
                new ProductInfo
                {
                    Name="Milk Maid Milk",
                    Description = "Milk cow's love it",
                    NumberInStock = 100
                },
                new ProductInfo
                {
                    Name="Pure Silk Tofu",
                    Description = "Really Bland",
                    NumberInStock = 120
                },
                new ProductInfo
                {
                    Name="Crunchy Pops",
                    Description = "Cheezy",
                    NumberInStock = 2
                },
                new ProductInfo
                {
                    Name="RipOff Water",
                    Description = "From the tap to your wallet",
                    NumberInStock = 100
                },
                new ProductInfo
                {
                    Name="Classic Valpo Pizza",
                    Description = "Everyone loves pizza",
                    NumberInStock = 73
                }
            };

            SelectEverything(itemsInStock);
            Console.WriteLine();
            ListProductNames(itemsInStock);
            Console.WriteLine();
            GetOverstockItems(itemsInStock);
            Console.WriteLine();
            GetNamesAndDescriptions(itemsInStock);
            Console.WriteLine();
            GetCountFromQuery();
            Console.WriteLine();
            AlphabetizeProductNames(itemsInStock);
            Console.WriteLine();
            DisplayDiff();
            Console.WriteLine();
            DisplayIntersect();
            Console.WriteLine();
            DisplayUnion();
            Console.WriteLine();
            DisplayConcat();
            Console.WriteLine();
            AggregateOps();
            Console.WriteLine();

            Console.ReadLine();
        }

        static void SelectEverything(ProductInfo[] products)
        {
            Console.WriteLine("All product details: ");
            var allProducts = from p in products
                select p;

            foreach (var product in allProducts)
            {
                Console.WriteLine(product.ToString());
            }
        }

        static void ListProductNames(ProductInfo[] products)
        {
            Console.WriteLine("Only Product Names:");
            var names = from p in products
                select p.Name;

            foreach (var name in names)
            {
                Console.WriteLine("Name: {0}", name);
            }
        }

        static void GetOverstockItems(ProductInfo[] products)
        {
            Console.WriteLine("The overstock items:");

            var overstock = from p in products
                where p.NumberInStock > 25
                select p;

            foreach (var c in overstock)
            {
                Console.WriteLine(c.ToString());
            }
        }

        static void GetNamesAndDescriptions(ProductInfo[] products)
        {
            Console.WriteLine("Names and Descriptions: ");

            var nameDesc = products.Where(p => p.NumberInStock >= 100)
                .Select(p => new {p.Name, p.Description});

            foreach (var item in nameDesc)
            {
                Console.WriteLine("Name: {0}, Description: {1}", item.Name, item.Description);
            }
        }

        static void GetCountFromQuery()
        {
            string[] videoGames = {"Fallout 4", "Halo", "Disney Infinity", "Project Spark", "COD"};

            int number = (from g in videoGames where g.Length > 6 select g).Count();

            Console.WriteLine("{0} intems in the query", number);
        }

        static void AlphabetizeProductNames(ProductInfo[] products)
        {
            var subset = from p in products
                orderby p.Name
                select p;

            Console.WriteLine("Ordered by Name: ");
            foreach (var p in subset)
            {
                Console.WriteLine(p.ToString());
            }
        }

        static void DisplayDiff()
        {
            List<string> myCars = new List<string>()
            {
                "Yugo",
                "Aztec",
                "BMW"
            };
            List<string> yourCars = new List<string>()
            {
                "BMW",
                "Saab",
                "Aztec"
            };

            var carDiff = (from c in myCars select c)
                .Except(from c2 in yourCars select c2);

            Console.WriteLine("Here is what I have but you dont:");
            foreach (var c in carDiff)
            {
                Console.WriteLine(c);
            }
        }

        static void DisplayIntersect()
        {
            List<string> myCars = new List<string>()
            {
                "Yugo",
                "Aztec",
                "BMW"
            };
            List<string> yourCars = new List<string>()
            {
                "BMW",
                "Saab",
                "Aztec"
            };

            var carIntersect = (from c in myCars select c)
                .Intersect(from c2 in yourCars select c2);

            Console.WriteLine("Here is what we have in common:");
            foreach (var c in carIntersect)
            {
                Console.WriteLine(c);
            }
        }

        static void DisplayUnion()
        {
            List<string> myCars = new List<string>()
            {
                "Yugo",
                "Aztec",
                "BMW"
            };
            List<string> yourCars = new List<string>()
            {
                "BMW",
                "Saab",
                "Aztec"
            };

            Console.WriteLine("Here is everything:");

            var carUnion = (from c in myCars select c)
                .Union(from c2 in yourCars select c2);

            foreach (var c in carUnion)
            {
                Console.WriteLine(c);
            }
        }

        static void DisplayConcat()
        {
            List<string> myCars = new List<string>()
            {
                "Yugo",
                "Aztec",
                "BMW"
            };
            List<string> yourCars = new List<string>()
            {
                "BMW",
                "Saab",
                "Aztec"
            };

            var carConcat = (from c in myCars select c)
                .Concat(from c2 in yourCars select c2);

            Console.WriteLine("Concatenated lists");
            foreach (var c in carConcat)
            {
                Console.WriteLine(c);
            }
        }

        static void AggregateOps()
        {
            double[] winterTemps = {2.0, -21.3, 8, -4, 0, 8.2};

            Console.WriteLine("Aggregation Operators: ");

            Console.WriteLine("Max temp: {0}", (from t in winterTemps select t).Max());

            Console.WriteLine("Min temp: {0}", (from t in winterTemps select t).Min());

            Console.WriteLine("Avg temp: {0}", winterTemps.Select(t => t).Average());

            Console.WriteLine("Sum of all temp: {0}", winterTemps.Select(t => t).Sum());

        }
    }
}
