<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FacultyRegistrations.aspx.cs" Inherits="FacultyRegistrations" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="GridViewData" runat="server" OnRowCommand="GridViewData_RowCommand" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Double" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Both" style="margin-left: 47px; margin-top: 40px;" Width="824px">
            <Columns>
                   <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnAccept" runat="server" CommandName="Accept" CommandArgument='<%# Eval("ID") %>' Text="Accept" />
                            <asp:Button ID="btnReject" runat="server" CommandName="Reject" CommandArgument='<%# Eval("ID") %>' Text="Reject" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                         <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mobile">
                        <ItemTemplate>
                            <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Organization">
                        <ItemTemplate>
                            <asp:Label ID="lblOrganization" runat="server" Text='<%# Eval("Organization") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Designation">
                        <ItemTemplate>
                            <asp:Label ID="lblDesignation" runat="server" Text='<%# Eval("Designation") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bank">
                        <ItemTemplate>
                            <asp:Label ID="lblBank" runat="server" Text='<%# Eval("BankID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Account Type">
                        <ItemTemplate>
                            <asp:Label ID="lblAccountType" runat="server" Text='<%# Eval("AccountType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Account Holder Name">
                        <ItemTemplate>
                            <asp:Label ID="lblAccountHolderName" runat="server" Text='<%# Eval("AccountHolderName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IFSC Code">
                        <ItemTemplate>
                            <asp:Label ID="lblIFSC" runat="server" Text='<%# Eval("IFSC") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        
    </div>
    </form>
</body>
</html>
