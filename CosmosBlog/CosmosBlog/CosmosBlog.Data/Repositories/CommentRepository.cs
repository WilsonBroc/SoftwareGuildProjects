using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;

namespace CosmosBlog.Data.Repositories
{
    public class CommentRepository
    {
        public string GetComment(int id)
        {
            SqlConnection cn = new SqlConnection(Settings.ConnectionString);

            using (cn)
            {
                var p = new DynamicParameters();
                p.Add("@PostID", id);
                string comment =  cn.Query<string>("GetCommentByPostId", p, commandType: CommandType.StoredProcedure).ToList().FirstOrDefault();
                return comment;
            }
            
        }
    }
}
