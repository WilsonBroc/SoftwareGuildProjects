using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CosmosBlog.Models;

namespace CosmosBlog.Data.Interfaces
{
    public interface iStaticPageRepository
    {
        List<StaticPage> GetAllStaticPages();
        StaticPage GetOneStaticPage(int id);
        void AddNewStaticPage(StaticPage newStaticPage);
        void DeleteStaticPage(StaticPage oldStaticPage);
        void EditStaticPage(StaticPage staticPage);
    }
}
