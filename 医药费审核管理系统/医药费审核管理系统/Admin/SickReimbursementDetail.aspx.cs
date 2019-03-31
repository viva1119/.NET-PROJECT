using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 医药费审核管理系统.Admin
{
    public partial class SickReimbursementDetail : System.Web.UI.Page
    {
        protected decimal Totle { get; set; }

        protected decimal TotleMoney { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            string snum = Request["snum"];
            string sql = @"select * from sickers left join sickersdrug 
                            on sickers.snum=sickersdrug.snum where sickers.snum=" + snum + "";
            DataTable dt = SqlHelper.ExecuteDataTable(sql);
            DataTable dtview = new DataTable();
            dtview.Columns.Add("单号");
            dtview.Columns.Add("姓名");
            dtview.Columns.Add("药名");
            dtview.Columns.Add("数量");
            dtview.Columns.Add("单价");
            dtview.Columns.Add("金额");
            dtview.Columns.Add("是否可报");
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Totle += Convert.ToDecimal(dt.Rows[i]["sddrugmoney"]);
                    string sqlsub = "select did from drugs where drugsailname='" + dt.Rows[i]["sddrugname"] + "'";
                    DataRow row = dtview.NewRow();
                    row["单号"] = dt.Rows[i]["snum"].ToString();
                    row["姓名"] = dt.Rows[i]["sname"].ToString();
                    row["药名"] = dt.Rows[i]["sddrugname"].ToString();
                    row["数量"] = dt.Rows[i]["sddrugcount"].ToString();
                    row["单价"] = dt.Rows[i]["sddrugprice"].ToString();
                    row["金额"] = dt.Rows[i]["sddrugmoney"].ToString();
                    object obj = SqlHelper.ExecuteScalar(sqlsub);
                    if (obj != null && obj.ToString().Length >= 1)
                    {
                        TotleMoney += Convert.ToDecimal(dt.Rows[i]["sddrugmoney"]);
                        row["是否可报"] = "是";
                    }
                    else
                    {
                        row["是否可报"] = "否";
                    }
                    dtview.Rows.Add(row);
                }
            }
            Repeater1.DataSource = dtview;
            Repeater1.DataBind();
        }
    }
}