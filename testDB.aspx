<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testDB.aspx.cs" Inherits="testDB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>

            <hr />
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>This is the Header</HeaderTemplate>
                <ItemTemplate>

                    <div class="col-md-3 filter <%# Eval("iconFilter").ToString() %>">
                        <div class="each-item">
                            <svg width="140" height="140" xmlns="http://www.w3.org/2000/svg">
                                <image width="140" height="140" xlink:href="pictures/<%# Eval("iconImageFile").ToString() %>" alt="vacation Icon">
                            </svg>
                            <h3><%# Eval("iconTitle").ToString() %></h3>
                            <p><%# Eval("iconDescription").ToString() %></p>
                            <p>
                                <%--<a class="btn btn-secondary" href="<%# Eval("iconLink").ToString() %>" role="button">
                                <%# Eval("iconButton").ToString() %>&raquo;
                               </a>--%>
                                <%--<asp:LinkButton ID="butt" CommandName="<%# Eval("iconLink").ToString() %>" runat="server" OnClick="abc" CssClass ="btn btn-secondary"><%# Eval("iconButton").ToString() %>&raquo;</asp:LinkButton>--%>
                                <asp:Label ID="Label3" runat="server" Text="<%# Container.ItemIndex %>" Visible="false"></asp:Label> 
                                <asp:LinkButton id="link2" CommandName='<%# Eval("iconLink").ToString() %>' runat="server" OnClick="abc"><%# Eval("iconButton").ToString() %></asp:LinkButton>
                            </p>
                        </div>
                    </div>
                    <br />
                </ItemTemplate>

            </asp:Repeater>
            <asp:LinkButton id="butt" CommandName="https://www.infotech-cloudhr.com.sg/" runat="server" OnClick="abc">counter</asp:LinkButton>

           <%-- <asp:Label id="lbl" runat="server" Text=""></asp:Label>
            <asp:LinkButton ID="clickme" runat="server" OnClick="abc">HyperLink</asp:LinkButton>--%>
        </div>
    </form>
</body>
</html>
