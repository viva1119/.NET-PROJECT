using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 医药费审核管理系统.Admin
{
    /// <summary>
    /// DrugsRemove 的摘要说明
    /// </summary>
    public class DrugsRemove : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int did = Convert.ToInt32(context.Request.Form["id"]);
            string sql = "delete from drugs where did=" + did;
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