using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CosmosBlog.Models;

namespace CosmosBlog.Data.Interfaces
{
    public interface iCategoryRepository
    {
        List<Category> GetAllCategories();
        Category GetOneCategory(int id);
        void AddNewCategory(Category newCategory);
        void DeleteCategory(Category oldCategory);
        void EditCategory(Category category);
    }
}
