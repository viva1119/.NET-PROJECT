using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace 医药费审核管理系统.Admin
{
    /// <summary>
    /// EmpManageAdd 的摘要说明
    /// </summary>
    public class EmpManageAdd : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string sql = "insert into Empinfo values(@EmpName, @EmpPwd, @EmpSex, @EmpAddress, @EmpPhone, @EmpRole)";
            SqlParameter[] p = { 
                                new SqlParameter("@EmpName",context.Request.Form["username"]),
                                new SqlParameter("@EmpPwd",context.Request.Form["userpwd"]),
                                new SqlParameter("@EmpSex",context.Request.Form["usersex"]),
                                new SqlParameter("@EmpAddress",context.Request.Form["address"]),
                                new SqlParameter("@EmpPhone",context.Request.Form["phone"]),
                                new SqlParameter("@EmpRole",context.Request.Form["userrole"]),
                                };
            if (SqlHelper.ExecuteNonQuery(sql, p) > 0)
            {
                context.Response.Write(1);
            }
            else
            {
                context.Response.Write(0);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}