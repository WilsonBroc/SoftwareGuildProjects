using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CosmosBlog.Models;

namespace CosmosBlog.Data.Interfaces
{
    public interface iTagRepository
    {
        List<Tag> GetAllTags();
        Tag GetOneTag(int id);
        void AddNewTags(string newTags);
        void DeleteTag(Tag tagToDelete);
        void EditTag(Tag tag);
        List<Tag> AssignTagsToPost(string tagString, int postID);
        List<string> GetTagList(string tagString);
    }
}
