using System;
using System.Collections.Generic;
using System.Linq;
using System.Media;
using System.Text;
using System.Threading.Tasks;

namespace UsingFilesWithRelativesPaths
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Playing a sound file");
            SoundPlayer player = new SoundPlayer(@"Sounds\AlGore_DevCoaches.wav");
            player.Play();
            Console.ReadLine();
        }
    }
}
