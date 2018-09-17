<%@ Page Language="C#" AutoEventWireup="true" CodeFile="genericupload.aspx.cs" Inherits="lookup_genericupload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lookup</title>
    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../css/bootstrap-reset.css" rel="stylesheet"/>
    <!--external css-->
    <link href="../assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet"/>
    <link href="../css/style-responsive.css" rel="stylesheet" />

    <!-- CUSTOM -->
    <script src="../js/custom.js" type="text/javascript"></script>
    <link href="../css/general.css" rel="Stylesheet" />
</head>
<body>
    <%--<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="upd">
        <ProgressTemplate>
            <div class="progress_bg">
                <label class="progress_img" id="lblProgress"></label>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>--%>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="smMain" runat="server">
    </asp:ScriptManager>
    <section class="panel" style="position: fixed; height: 100%; width:100%;">
   <%--     <asp:UpdatePanel ID="upd" runat="server">
            <ContentTemplate>--%>
              <div class="panel-body">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <asp:FileUpload ID="FileUploadControl" runat="server"/>
                        <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ErrorMessage="Format Harus Text" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.txt|.doc|.docx|.text|.etlerr|.log)$" ControlToValidate="FileUploadControl"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="This is a required field!" ControlToValidate="FileUploadControl"></asp:RequiredFieldValidator>
                    </div>
                </div>
                  <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <asp:LinkButton ID="btnSave" runat="server" CausesValidation="false"  CssClass="btn btn-info" OnClick="btnSave_Click"><i class="icon-pencil"></i>  Save</asp:LinkButton>
                     </div>
                  </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="col-sm-4">Month</label>
                                         <div class="col-sm-4">
                                             <asp:DropDownList ID="ddlBulan" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                         </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label class="col-sm-4">Year</label>
                                         <div class="col-sm-4">
                                             <asp:DropDownList ID="ddlTahun" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                         </div>
                                    </div>
                                </div>
                            </div>
                    <%--<Triggers>
                        <asp:PostBackTrigger ControlID="btnSave" />
                    </Triggers>--%>
                </div>
            </div>
            <div class="row" runat="server" visible="true" id="msgError">
                 <div class="col-sm-12 col-md-12">
                     <asp:label class="col-sm-4" runat="server" ToolTip="Close to Click" ID="lblError" ForeColor="Red"></asp:label>
                </div>
            </div>
           <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
        
    </section>
 </form>
</body>
</html>
