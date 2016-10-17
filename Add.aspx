﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add a Product</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/font-awesome.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1><i class="fa fa-plus">Add a Product</i></h1>
        <br />
        <div class="col-lg-12">
            <div class="well clearfix">
                <form runat="server" class="form-horizontal">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label col-lg-4">Name</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"
                                    MaxLength="50" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Category</label>
                            <div class="col-lg-8">
                                <asp:DropDownList ID="ddlCategory" runat="server"
                                    CssClass="form-control" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Code</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtCode" runat="server" CssClass="form-control"
                                    MaxLength="10" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Description</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"
                                    MaxLength="300" TextMode="MultiLine" Rows="3" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Image</label>
                            <div class="col-lg-8">
                                <asp:FileUpload ID="Images" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Price</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" type="number"
                                    max="500000" step="0.01" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Is Featured?</label>
                            <div class="col-lg-8">
                                <asp:DropDownList ID="ddlFeatured" runat="server"
                                    CssClass="form-control">
                                    <asp:ListItem>Yes</asp:ListItem>
                                    <asp:ListItem>No</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Available</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtAvailable" runat="server" CssClass="form-control"
                                    MaxLength="12" type="number" required></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label col-lg-4">Critical Level</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtcritical" runat="server" CssClass="form-control" type="number" min="1" max="100" required></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Maximum</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtMax" runat="server" CssClass="form-control" type="number"
                                    min="1" MaxLength="1000" required></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-offset-4 col-lg-8">
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success btn-lg pull-right"
                            Text="Add" OnClick="btnAdd_Click" />
                    </div>
                </form>
            </div>
        </div>

    </div>
</body>
</html>
