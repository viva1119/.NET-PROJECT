using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 医药费审核管理系统.Admin
{
    public partial class SickersMessage : System.Web.UI.Page
    {
        protected string ErrorMsg { get; set; }
        protected string Snum { get; set; }
        protected string Sname { get; set; }
        protected string Ssex { get; set; }
        protected string Sage { get; set; }
        protected string Sbirthday { get; set; }
        protected string Sillness { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (Request.Form["snum"] != null && !string.IsNullOrEmpty(Request.Form["snum"]))
                {
                    Snum = Request.Form["snum"];
                    string sqlsel = "select * from sickers where snum='" + Snum + "'";
                    DataTable dt = SqlHelper.ExecuteDataTable(sqlsel);
                    if (dt.Rows.Count > 0)
                    {
                        Sname = dt.Rows[0]["sname"].ToString();
                        Ssex = dt.Rows[0]["ssex"].ToString();
                        Sage = dt.Rows[0]["sage"].ToString();
                        Sbirthday = dt.Rows[0]["sbirthday"].ToString();
                        Sillness = dt.Rows[0]["sillness"].ToString();
                    }
                }
                else
                {
                    Snum = "S" + DateTime.Now.ToString("yyyyMMddhhmmss");
                    string sqlbefore = "insert into sickers values(@snum, @sname, @ssex, @sage, @sbirthday, @sillness)";
                    SqlParameter[] pbefore = { 
                                                new SqlParameter("@snum",Snum),
                                                new SqlParameter("@sname",Request.Form["sname"]),
                                                new SqlParameter("@ssex",Request.Form["ssex"]),
                                                new SqlParameter("@sage",Request.Form["sage"]),
                                                new SqlParameter("@sbirthday",Request.Form["sbirthday"]),
                                                new SqlParameter("@sillness",""),
                                             };
                    if (SqlHelper.ExecuteNonQuery(sqlbefore, pbefore) > 0)
                    {

                    }
                    else
                    {
                        ErrorMsg = "操作失败，请稍后重试";
                        return;
                    }
                }
                string sql = "insert into sickersdrug values(@snum, @sddrugname, @sddrugprice, @sddrugcount, @sddrugmoney)";
                SqlParameter[] p = { 
                                new SqlParameter("@snum",Snum),
                                new SqlParameter("@sddrugname",Request.Form["sddrugname"]),
                                new SqlParameter("@sddrugprice",Request.Form["sddrugprice"]),
                                new SqlParameter("@sddrugcount",Request.Form["sddrugcount"]),
                                new SqlParameter("@sddrugmoney",(Convert.ToDecimal(Request.Form["sddrugprice"])*Convert.ToInt32(Request.Form["sddrugcount"])).ToString()),
                               };
                if (SqlHelper.ExecuteNonQuery(sql, p) > 0)
                {
                    Response.Redirect("SickersMessage.aspx?snum=" + Snum);
                }
                else
                {
                    ErrorMsg = "操作失败，请稍后重试";
                }
            }
            else
            {
                Snum = Request["snum"];
                string sqlsel = "select * from sickers where snum='" + Snum + "'";
                DataTable dt = SqlHelper.ExecuteDataTable(sqlsel);
                if (dt.Rows.Count > 0)
                {
                    Sname = dt.Rows[0]["sname"].ToString();
                    Ssex = dt.Rows[0]["ssex"].ToString();
                    Sage = dt.Rows[0]["sage"].ToString();
                    Sbirthday = dt.Rows[0]["sbirthday"].ToString();
                    Sillness = dt.Rows[0]["sillness"].ToString();
                }
                string sql = "select * from sickersdrug where snum='" + Snum + "'";
                DataTable dt1 = SqlHelper.ExecuteDataTable(sql);
                Repeater1.DataSource = dt1;
                Repeater1.DataBind();
            }
        }
    }
}