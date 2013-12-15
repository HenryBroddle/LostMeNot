<%@ Page Title="Home Page" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="LostMeNot._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="leftColumn">
    <h2>Welcome to Lost Me Not</h2>
        <p style="max-width: 550px">
            This is intended as an interface prototype.  This is where you will track your property's location.
            It is also where you can manage devices purchased and configure settings accordingly.  We look 
            forward to seeing you when we put our products to market and would love to hear feedback at
            <a href="mailto:Henry.Broddle@Gmail.com?subject=About Lost me not..." >Henry Broddle's Gmail.</a>  Thanks again, and see you soon.
        </p>
    </div>
    <div class="rightColumn">
        <asp:LoginView ID="MainLoginView" runat="server">
                    <AnonymousTemplate>
                        <asp:Login ID="Login2" runat="server" >
                            <LayoutTemplate>
                                <fieldset style="padding: 5px; height: 50px;">
                                    <div class="group">
                                        <label>
                                            User Name<br />
                                            <asp:TextBox ID="UserName" runat="server" Width="60px" style="margin-bottom: 0px; min-height: 0px; height: 10px; " />
                                        </label>
                                        <label>
                                            Password:<br />
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="60px" style="margin-bottom: 0px; min-height: 0px; height: 10px;" />
                                        </label>
                                        <label>
                                            <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me" />
                                        </label>                                        
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        <asp:LinkButton CssClass="SmallCommandButton" ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="ctl00$ctl00$Login2" />
                                    </div>
                                </fieldset>
                            </LayoutTemplate>
                        </asp:Login>
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        <fieldset style="padding: 5px;">
                            <asp:LoginName ID="LoginName1" Font-Bold="true" runat="server" SkinID="LoginName"></asp:LoginName>
                            <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutPageUrl="~/Account/Login.aspx"
                                SkinID="LoginStatus" Font-Bold="True" Font-Size="Small" ForeColor="#6a6a6a" />
                        </fieldset>
                    </LoggedInTemplate>
                </asp:LoginView>
        <asp:HyperLink runat="server" CssClass="NavLink" ID="RouteHistoryLink" Text="Route History" NavigateUrl="~/RouteManager/RouteDetail.aspx" />
        <asp:HyperLink runat="server" CssClass="NavLink" ID="DeviceLink" Text="Device Management" NavigateUrl="~/Account/Devices/DeviceDetail.aspx" />
        <asp:HyperLink ID="HyperLink1" class="top-item pageTitle NavLink" runat="server" NavigateUrl="~/Front/Default.aspx" >Lost Me Not</asp:HyperLink>
    </div>
</asp:Content>
