using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 医药费审核管理系统.Admin
{
    /// <summary>
    /// UserManageRemove 的摘要说明
    /// </summary>
    public class UserManageRemove : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int EmpId = Convert.ToInt32(context.Request.Form["EmpId"]);
            string sql = "delete from EmpInfo where EmpId=" + EmpId;
            if (SqlHelper.ExecuteNonQuery(sql) > 0)
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