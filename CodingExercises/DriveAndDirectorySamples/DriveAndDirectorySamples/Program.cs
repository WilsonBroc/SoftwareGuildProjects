using System;
using System.CodeDom;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace DriveAndDirectorySamples
{
    class Program
    {
        static void Main(string[] args)
        {
            //ShowMyDrives();
            //ShowWindowsDirectoryInfo();
            //DisplayImageFiles();
            //ModifyAppDirectory();
            RemoveDirectory();

            Console.ReadLine();
        }

        private static void RemoveDirectory()
        {
            try
            {
                DirectoryInfo dir = new DirectoryInfo(@".\MyFolder");
                dir.Delete(true);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        private static void ModifyAppDirectory()
        {
            DirectoryInfo dir = new DirectoryInfo(".");
            dir.CreateSubdirectory("MyFolder");

            DirectoryInfo myDataFolder = dir.CreateSubdirectory(@"MyFolder\Data");

            Console.WriteLine("Done");
        }

        private static void DisplayImageFiles()
        {
            DirectoryInfo dir = new DirectoryInfo(@"C:\Windows\Web\Wallpaper");
            FileInfo[] imgFiles = dir.GetFiles("*.jpg", SearchOption.AllDirectories);

            Console.WriteLine("Found {0} *.jpg files\n", imgFiles.Length);

            foreach (var fileInfo in imgFiles)
            {
                Console.WriteLine("****************");
                Console.WriteLine("File name: {0}", fileInfo.Name);
                Console.WriteLine("File size: {0}", fileInfo.Length);
                Console.WriteLine("File creation: {0}", fileInfo.CreationTime);
                Console.WriteLine("File attributes: {0}", fileInfo.Attributes);
                Console.WriteLine("****************\n");
            }
        }

        private static void ShowWindowsDirectoryInfo()
        {
            DirectoryInfo dir = new DirectoryInfo(@"C:\Windows");
            Console.WriteLine("Full Name: {0}", dir.FullName);
            Console.WriteLine("Name: {0}", dir.Name);
            Console.WriteLine("Parent: {0}", dir.Parent);
            Console.WriteLine("Creation Time: {0}", dir.CreationTime);
            Console.WriteLine("Attributes: {0}", dir.Attributes);
            Console.WriteLine("Root: {0}", dir.Root);
        }

        private static void ShowMyDrives()
        {
            DriveInfo[] myDrives = DriveInfo.GetDrives();

            foreach (var d in myDrives)
            {
                Console.WriteLine($"Name {d.Name}");
                Console.WriteLine($"Type {d.DriveType}");

                if (d.IsReady)
                {
                    Console.WriteLine($"Free Space {d.TotalFreeSpace}");
                    Console.WriteLine($"Format {d.DriveFormat}");
                    Console.WriteLine($"Label {d.VolumeLabel}");
                }
                Console.WriteLine();
            }
            
        }
    }
}
