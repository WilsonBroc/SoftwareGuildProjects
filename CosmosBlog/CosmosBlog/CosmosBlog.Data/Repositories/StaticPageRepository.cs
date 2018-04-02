using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CosmosBlog.Data.Interfaces;
using CosmosBlog.Models;
using Dapper;

namespace CosmosBlog.Data.Repositories
{
    public class StaticPageRepository : iStaticPageRepository
    {
        private SqlConnection cn = new SqlConnection(Settings.ConnectionString);

        public List<StaticPage> GetAllStaticPages()
        {
            return cn.Query<StaticPage>("GetAllStaticPages", commandType: CommandType.StoredProcedure).ToList();
        }

        public StaticPage GetOneStaticPage(int id)
        {
            var p = new DynamicParameters();
            p.Add("@PageID", id);

            return cn.Query<StaticPage>("GetOneStaticPage", p, commandType: CommandType.StoredProcedure).FirstOrDefault();
        }

        public void AddNewStaticPage(StaticPage newStaticPage)
        {
            var p = new DynamicParameters();
            p.Add("@PageTitle", newStaticPage.PageTitle);
            p.Add("@PageContent", newStaticPage.PageContent);

            cn.Execute("AddNewStaticPage", p, commandType: CommandType.StoredProcedure);
        }

        public void DeleteStaticPage(StaticPage oldStaticPage)
        {
            var p = new DynamicParameters();
            p.Add("@PageID", oldStaticPage.PageID);

            cn.Execute("DeleteStaticPage", p, commandType: CommandType.StoredProcedure);
        }

        public void EditStaticPage(StaticPage staticPage)
        {
            var p = new DynamicParameters();
            p.Add("@PageID", staticPage.PageID);
            p.Add("@PageTitle", staticPage.PageTitle);
            p.Add("@PageContent", staticPage.PageContent);

            cn.Execute("EditStaticPage", p, commandType: CommandType.StoredProcedure);


        }
    }
}
