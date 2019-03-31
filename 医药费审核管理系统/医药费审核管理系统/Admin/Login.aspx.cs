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
    public partial class Log : System.Web.UI.Page
    {
        protected string ErrorMsg { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string sql = "select * from EmpInfo where EmpName=@EmpName and EmpPwd=@EmpPwd";
                SqlParameter[] p = { 
                                new SqlParameter("@EmpName",Request.Form["EmpName"]),
                                new SqlParameter("@EmpPwd",Request.Form["EmpPwd"]),
                               };
                DataTable dt = SqlHelper.ExecuteDataTable(sql, p);
                if (dt.Rows.Count > 0)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    ErrorMsg = "登录失败，请稍后重试。";
                }
            }
        }
    }
}