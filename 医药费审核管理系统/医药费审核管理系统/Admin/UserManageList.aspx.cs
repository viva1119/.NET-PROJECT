using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 医药费审核管理系统.Admin
{
    public partial class UserManageList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sql = "select * from EmpInfo";
                DataTable dt = SqlHelper.ExecuteDataTable(sql);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
        }
    }
}