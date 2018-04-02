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
    public class TagRepository : iTagRepository
    {
        private SqlConnection cn = new SqlConnection(Settings.ConnectionString);

        public List<Tag> GetAllTags()
        {
            using (SqlConnection conn = new SqlConnection(Settings.ConnectionString))
            {
                var tags = conn.Query<Tag>("GetAllTags", commandType: CommandType.StoredProcedure).ToList();
                return tags;
            }
        }

        public Tag GetOneTag(int id)
        {
            using (cn)
            {
                var p = new DynamicParameters();
                p.Add("@ID", id);
                var tag = cn.Query<Tag>("GetOneTag", p, commandType: CommandType.StoredProcedure).FirstOrDefault();

                return tag;
            }
        }

        public void AddNewTags(string newTags)
        {
            List<Tag> existingTags = GetAllTags();
            List<string> tagList = GetTagList(newTags);
            
            for (int i = 0; i < tagList.Count; i++)
            {
                var found = false;
                for (int j = 0; j < existingTags.Count; j++)
                {
                    if ((tagList.ElementAt(i) == "") || (tagList.ElementAt(i) == "#"))
                    {
                        break;
                    }
                    if (tagList.ElementAt(i) == existingTags.ElementAt(j).TagName)
                    {
                        found = true;
                        break;
                    }

                }
                using (SqlConnection conn = new SqlConnection(Settings.ConnectionString))
                {
                    if ((found == false) && (tagList.ElementAt(i) != ""))
                    {
                        var p = new DynamicParameters();

                        p.Add("@TagName", tagList.ElementAt(i));
                        conn.Execute("AddTags", p, commandType: CommandType.StoredProcedure);
                    }
          
                }
            }
        }

        public void DeleteTag(Tag tagToDelete)
        {
            using (cn)
            {
                var p = new DynamicParameters();
                p.Add("@ID", tagToDelete.TagID);

                cn.Execute("DeleteTag", p, commandType: CommandType.StoredProcedure);
            }
        }

        public void EditTag(Tag tag)
        {
            using (cn)
            {
                var p = new DynamicParameters();
                p.Add("@ID", tag.TagID);
                p.Add("@TagName", tag.TagName);

                cn.Execute("EditTag", p, commandType: CommandType.StoredProcedure);
            }
        }

        public List<string> GetTagList(string tagString)
        {
            List<string> tagList = new List<string>();
            string[] tagsArray = tagString.Split('#');

            foreach (var tag in tagsArray)
            {
                tag.Trim();
                tagList.Add(tag);
            }

            return tagList;
        }

        public List<Tag> AssignTagsToPost(string tagString, int postID)
        {
            List<string> tagList = GetTagList(tagString);
            List<Tag> postTags = new List<Tag>();

            foreach (var tag in tagList)
            {
                postTags.Add(GetAllTags().FirstOrDefault(t => t.TagName == tag));
            }

            using (SqlConnection conn = new SqlConnection(Settings.ConnectionString))
            {
                var p = new DynamicParameters();
                foreach (var tag in postTags)
                {
                    
                    if (tag != null)
                    {                
                        p.Add("@PostID", postID);
                        p.Add("@TagID", tag.TagID);
                        conn.Execute("AssignTagsToPost", p, commandType: CommandType.StoredProcedure);
                    }
                }
                
            }

            return postTags;
        }

        public void AssignExistingTagsToPost(List<Tag> selectedTags, int postID)
        {
            using (cn)
            {
                foreach (var tag in selectedTags)
                {
                    var p = new DynamicParameters();
                    p.Add("PostID", postID);
                    p.Add("TagID", tag.TagID);

                    cn.Execute("AssignTagsToPost", p, commandType: CommandType.StoredProcedure);
                }
            }
        }
    }
}

