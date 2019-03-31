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
    public partial class DrugReimbursementList : System.Web.UI.Page
    {
        public string ErrorMsg { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string sql = @"insert into drugs values(@drugsailname, @drugcommonname, @drugprice, @drugfactory, @drugbility, @drugability, @drugmakedate, @druglife);";
                SqlParameter[] p = { 
                                    new SqlParameter("@drugsailname",Request.Form["drugsailname"]),
                                    new SqlParameter("@drugcommonname",Request.Form["drugcommonname"]),
                                    new SqlParameter("@drugprice",Request.Form["drugprice"]),
                                    new SqlParameter("@drugfactory",Request.Form["drugfactory"]),
                                    new SqlParameter("@drugbility",Request.Form["drugbility"]),
                                    new SqlParameter("@drugability",Request.Form["drugability"]),
                                    new SqlParameter("@drugmakedate",Request.Form["drugmakedate"]),
                                    new SqlParameter("@druglife",Request.Form["druglife"]),
                                   };
                if (SqlHelper.ExecuteNonQuery(sql, p) > 0)
                {
                    Response.Redirect("DrugReimbursementList.aspx");
                }
                else
                {
                    ErrorMsg = "添加出错，请稍后重试。";
                }
            }
            else
            {
                string sql = "select * from drugs";
                DataTable dt = SqlHelper.ExecuteDataTable(sql);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
        }
    }
}