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
    public class TagManager
    {
        private TagRepository _tagRepo = new TagRepository();

        public List<Tag> GetAllTags()
        {
            return _tagRepo.GetAllTags();
        }

        public Tag GetOneTag(int id)
        {
            return _tagRepo.GetOneTag(id);
        }

        public void AddNewTags(string newTags)
        {
            _tagRepo.AddNewTags(newTags);
        }

        public List<string> GetTagList(string tagString)
        {
            return _tagRepo.GetTagList(tagString);
        }

        public List<Tag> AssignTagsToPost(string tagString, int postID)
        {
            return _tagRepo.AssignTagsToPost(tagString, postID);
        }

        public void DeleteTag(Tag tagToDelete)
        {
            _tagRepo.DeleteTag(tagToDelete);
        }

        public void EditTag(Tag tag)
        {
            _tagRepo.EditTag(tag);
        }
    }
}
