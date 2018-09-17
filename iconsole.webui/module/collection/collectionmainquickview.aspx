<%@ Page Language="C#" MasterPageFile="~/iconsole.master" AutoEventWireup="true" CodeFile="collectionmainquickview.aspx.cs" Inherits="module_collection_collectionmainquickview" Title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpb" Runat="Server">
   
   <link href="../../css/sb-admin-2.css" rel="stylesheet">
   <link href="../../css/font-awesome.min.css" rel="stylesheet">
   <link href="../../css/font-awesome.css" rel="stylesheet">
   
   <script type="text/javascript">
       $(document).ready(function() {
       (function() {
               document.getElementById("totalCollection").innerHTML = "<%=TotalCollection%>";
               document.getElementById("totalPaymentAmount").innerHTML = "<%=TotalAmount%>";
               document.getElementById("RestOfBill").innerHTML = "<%=RestOfTheBill%>";
           })();
       });
     </script>
   
      <div class="row">
        <div class="col-lg-3 col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-shopping-cart fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class=""><h2>Total Collection</h2></div>
                            <div id="totalCollection"></div>
                        </div>
                    </div>
                </div>
<%--                <a href="<%= ResolveUrl("collectionmainquickviewdetail.aspx") + "?filter=totalcollection"%>">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>--%>
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="panel panel-green">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-archive fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class=""><h2>Paid Amount</h2></div>
                            <div id="totalPaymentAmount"></div>
                        </div>
                    </div>
                </div>
<%--                <a href="<%= ResolveUrl("collectionmainquickviewdetail.aspx") + "?filter=paidamount"%>">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>--%>
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="panel panel-yellow">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-edit fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class=""><h2>Un Paid Amount</h2></div>
                            <div id="RestOfBill"></div>
                        </div>
                    </div>
                </div>
<%--                <a href="<%= ResolveUrl("collectionmainquickviewdetail.aspx") + "?filter=unpaidamount"%>">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>--%>
            </div>
        </div>
    </div>
      
      <section class="panel">
        <div class="panel-heading">
           <div class="row">
                <label id="lblCollector" runat="server" class="col-sm-1">Collector</label>
                <div class="col-sm-3">
                    <cc1:XUIDropDownList ID="ddlCollector" AutoPostBack="true" runat="server" CssClass="form-control" DataType="String" BindType="None" OnSelectedIndexChanged="ddlCollector_Changed">
                    </cc1:XUIDropDownList>
                </div>
                <div class="col-sm-4" style="float:left; display:inline;">
                     <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnReset" class="input-group">
                        <div class="input-group-btn">
                            <asp:LinkButton ID="btnReset" runat="server" CssClass="btn btn-info" OnClick="btnReset_Click"><i class="icon-refresh"></i> Reset</asp:LinkButton>
                        </div>
                     </asp:Panel>
                </div>
            </div>
         </div>
         <div class="panel-body form-horizontal"/>
         
         <div class="panel-body">
            <label class="col-sm-3">Detail Collection</label>
            <asp:UpdatePanel ID="upd" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvwList" runat="server" AutoGenerateColumns="false" CssClass="display table table-bordered table-striped"
                        AllowPaging="true" PageSize="10" DataKeyNames="collector_code" OnPageIndexChanging="gvwListCollection_PageIndexChanging" 
                        onselectedindexchanged="SelectedIndexChanged" EmptyDataText="There is no data"
                        OnRowDataBound="gvwList_OnRowDataBound">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <span>No</span>
                                </HeaderTemplate> 
                                <ItemStyle Width="5%"/>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="COLLECTOR" HeaderText="collector">
                                <ItemStyle Width="25%" HorizontalAlign="Left"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="total_collection" HeaderText="Total Collection" DataFormatString="{0:N2}">
                                <ItemStyle Width="30%" HorizontalAlign="Left"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="payment_amount" HeaderText="Paid" DataFormatString="{0:N2}">
                                <ItemStyle Width="30%" HorizontalAlign="Left"/>
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                </Triggers>
            </asp:UpdatePanel>
         </div>
         </div>
      </section>

</asp:Content>