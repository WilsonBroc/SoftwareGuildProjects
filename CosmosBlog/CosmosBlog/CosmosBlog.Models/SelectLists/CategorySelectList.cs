using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using System.Data.SqlClient;

namespace CosmosBlog.Models.SelectLists
{

    public static class CategorySelectList
    {
        private static SqlConnection _cn = new SqlConnection(Settings.ConnectionString);

        public static List<Category> GetAllCategories()
        {
            return _cn.Query<Category>("GetAllCategories", commandType: CommandType.StoredProcedure).ToList();
        }

        public static List<Tag> GetAllTags()
        {
            return _cn.Query<Tag>("GetAllTags", commandType: CommandType.StoredProcedure).ToList();
        }
    }

    
}
