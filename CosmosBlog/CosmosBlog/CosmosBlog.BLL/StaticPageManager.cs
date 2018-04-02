using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CosmosBlog.Data.Interfaces;
using CosmosBlog.Data.Repositories;
using CosmosBlog.Models;

namespace CosmosBlog.BLL
{
    public class StaticPageManager
    {
        private StaticPageRepository _staticPageRepo = new StaticPageRepository();

        public List<StaticPage> GetAllStaticPages()
        {
            return _staticPageRepo.GetAllStaticPages();
        }

        public StaticPage GetOneStaticPage(int id)
        {
            return _staticPageRepo.GetOneStaticPage(id);
        }

        public void AddNewStaticPage(StaticPage newPage)
        {
          _staticPageRepo.AddNewStaticPage(newPage);
        }

        public void EditStaticPage(StaticPage staticPage)
        {
            _staticPageRepo.EditStaticPage(staticPage);
        }

        public void DeleteStaticPage(StaticPage staticPage)
        {
            _staticPageRepo.DeleteStaticPage(staticPage);
        }
    }
}
