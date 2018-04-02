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
    public class PostRepository : iPostRepository
    {
        private SqlConnection cn = new SqlConnection(Settings.ConnectionString);

        public List<Post> GetAllPosts()
        {
            using (cn)
            {
                var posts = cn.Query<Post>("GetAllPosts", commandType: CommandType.StoredProcedure).ToList();

                foreach (var post in posts)
                {
                    var p = new DynamicParameters();
                    p.Add("@ID", post.PostID);
                    post.PostTags = cn.Query<Tag>("GetPostTags", p, commandType: CommandType.StoredProcedure).ToList();
                }

                return posts;
            }
        }

        public Post GetOnePost(int id)
        {
            using (cn)
            {
                var p = new DynamicParameters();
                p.Add("@ID", id);
                var post = cn.Query<Post>("GetOnePost", p, commandType: CommandType.StoredProcedure).FirstOrDefault();

                post.PostTags = cn.Query<Tag>("GetPostTags", p, commandType: CommandType.StoredProcedure).ToList();
                post.Tags = "";
                foreach (var tag in post.PostTags)
                {
                    post.Tags += "#" + tag.TagName + " ";
                }
                post.PostComments =
                    cn.Query<Comment>("GetPostComments", p, commandType: CommandType.StoredProcedure).ToList();

                return post;
            }
        }

        public void DeletePost(Post oldPost)
        {
            using (cn)
            {
                var p = new DynamicParameters();

                p.Add("@ID", oldPost.PostID);

                cn.Execute("DeletePost", p, commandType: CommandType.StoredProcedure);
            }
        }

        public void AddNewPost(Post newPost)
        {
            using (cn)
            {


                var p = new DynamicParameters();
                p.Add("@Title", newPost.Title);
                p.Add("@PostContent", newPost.PostContent);
                p.Add("@UserID", 1);
                p.Add("@CategoryID", newPost.CategoryID);
                p.Add("@StatusID", 1);
                p.Add("@DateCreated", DateTime.Now);
                p.Add("@ExpirationDate", newPost.ExpirationDate);
                p.Add("@Critique", newPost.Critique);
                p.Add("@PostImage", newPost.PostImage);
                p.Add("@Description", newPost.Description);
                p.Add("PostID", DbType.Int32, direction: ParameterDirection.Output);

                cn.Execute("AddPost", p, commandType: CommandType.StoredProcedure);

                newPost.PostID = p.Get<int>("PostID");
            }

            TagRepository tagRepo = new TagRepository();
            tagRepo.AddNewTags(newPost.Tags);
            newPost.PostTags = tagRepo.AssignTagsToPost(newPost.Tags, newPost.PostID);
        }

        public void EditPost(Post post)
        {
            SqlConnection cnn = new SqlConnection(Settings.ConnectionString);

            using (cnn)
            {
                var p = new DynamicParameters();
                p.Add("@ID", post.PostID);
                p.Add("@Title", post.Title);
                p.Add("@Content", post.PostContent);
                p.Add("@UserID", post.UserID);
                p.Add("@CategoryID", post.CategoryID);
                p.Add("@StatusID", post.StatusID);
                p.Add("@DateCreated", post.DateCreated);
                p.Add("@DateExpired", post.ExpirationDate);
                p.Add("@Critique", post.Critique);
                p.Add("@Image", post.PostImage);
                p.Add("@Description", post.Description);

                var p2 = new DynamicParameters();
                p2.Add("@ID", post.PostID);

                cnn.Execute("EditPost", p, commandType: CommandType.StoredProcedure);
                cnn.Execute("RemoveTagsFromPost", p2, commandType: CommandType.StoredProcedure);
                TagRepository tagRepo = new TagRepository();
                tagRepo.AddNewTags(post.Tags);
                post.PostTags = tagRepo.AssignTagsToPost(post.Tags, post.PostID);
            }
        }

        public void UpdatePostStatus(Post post)
        {
            SqlConnection cnn = new SqlConnection(Settings.ConnectionString);

            using (cnn)
            {
                var p = new DynamicParameters();
                p.Add("@PostID", post.PostID);
                p.Add("@StatusID", post.StatusID);

                cnn.Execute("AdminUpdateStatus", p, commandType: CommandType.StoredProcedure);
            }
        }

        public void SaveComments(Post post, Post postwComm)
        {
            string[] comments = postwComm.Comments.Split('\n');


            SqlConnection cnn = new SqlConnection(Settings.ConnectionString);
            using (cnn)
            {

                var p2 = new DynamicParameters();

                p2.Add("@PostID", post.PostID);
                cnn.Execute("DeleteCommentByPostID", p2, commandType: CommandType.StoredProcedure);

                if (postwComm.Comments != null)
                {
                    var p = new DynamicParameters();
                    p.Add("@Comment", postwComm.Comments);
                    p.Add("@PostID", post.PostID);
                    cnn.Execute("AddComment", p, commandType: CommandType.StoredProcedure);
                }

            }

        }
    }
}

