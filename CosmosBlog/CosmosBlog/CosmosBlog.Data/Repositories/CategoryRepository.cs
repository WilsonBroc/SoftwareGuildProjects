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
    public class CategoryRepository : iCategoryRepository
    {
        private SqlConnection cn = new SqlConnection(Settings.ConnectionString);

        public List<Category> GetAllCategories()
        {
            using (cn)
            {
                var categories = cn.Query<Category>("GetAllCategories", commandType: CommandType.StoredProcedure).ToList();
                return categories;
            }
        }

        public Category GetOneCategory(int id)
        {
            using (cn)
            {
                var p = new DynamicParameters();
                p.Add("@ID", id);
                var category = cn.Query<Category>("GetOneCategory", p, commandType: CommandType.StoredProcedure).FirstOrDefault();

                return category;
            }
        }

        public Category GetOneCategory(string categoryName)
        {
            using (cn)
            {
                var p = new DynamicParameters();
                p.Add("@CategoryName", categoryName);
                var category = cn.Query<Category>("GetCategoryByName", p, commandType: CommandType.StoredProcedure).FirstOrDefault();

                return category;
            }
        }

        public void AddNewCategory(Category newCategory)
        {
            using (cn)
            {
                
                var p = new DynamicParameters();

                if (newCategory.CategoryName.ToLower() != "general")
                {
                    p.Add("@CategoryName", newCategory.CategoryName);
                    cn.Execute("WriteNewCategory", p, commandType: CommandType.StoredProcedure);
                }
                
            }
        }

        public void DeleteCategory(Category oldCategory)
        {
            SqlConnection ccn = new SqlConnection(Settings.ConnectionString);
            using (ccn)
            {
                var p = new DynamicParameters();
                p.Add("@ID", oldCategory.CategoryID);

                ccn.Execute("DeleteCategory", p, commandType: CommandType.StoredProcedure);
            }
        }

        public void EditCategory(Category category)
        {
            SqlConnection cnn = new SqlConnection(Settings.ConnectionString);
            using (cnn)
            {
                var p = new DynamicParameters();

                if (category.CategoryName.ToLower() != "general")
                {
                    p.Add("@ID", category.CategoryID);
                    p.Add("@CategoryName", category.CategoryName);

                    cnn.Execute("EditCategory", p, commandType: CommandType.StoredProcedure);
                }                    
            }
        }

        public int GetNumberOfPostsByCategory(Category category)
        {
            SqlConnection cnn = new SqlConnection(Settings.ConnectionString);
            using (cnn)
            {
                var p = new DynamicParameters();
                p.Add("@CategoryId", category.CategoryID);
                return cnn.Query<int>("NumberOfPostsPerCategory", p, commandType: CommandType.StoredProcedure).First();
            }
        }
    }
}
