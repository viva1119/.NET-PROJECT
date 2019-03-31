using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace 医药费审核管理系统.Admin
{
    /// <summary>
    /// SickersDrugAdd 的摘要说明
    /// </summary>
    public class SickersDrugAdd : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string sql = "insert into sickersdrug valus(@sid, @sddrugname, @sddrugprice, @sddrugcount, @sddrugmoney)";
            SqlParameter[] p = { 
                                new SqlParameter("@sid","-1"),
                                new SqlParameter("@sddrugname",context.Request.Form["sddrugname"]),
                                new SqlParameter("@sddrugprice",context.Request.Form["sddrugprice"]),
                                new SqlParameter("@sddrugcount",context.Request.Form["sddrugcount"]),
                                new SqlParameter("@sddrugmoney",(Convert.ToDecimal(context.Request.Form["sddrugprice"])*Convert.ToInt32(context.Request.Form["sddrugcount"])).ToString()),
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