<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FacultyReferee.aspx.cs" Inherits="FacultyReferee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>Personal Information:
            </h3>
            <p>
                <asp:Label ID="lblName" runat="server" Text="Name: "></asp:Label>
                <asp:TextBox ID="tbxName" runat="server" type="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredName" runat="server" Display="Dynamic"
                    ControlToValidate="tbxName" ErrorMessage="* Field is required" ForeColor="red"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="lblEmail" runat="server" Text="Email ID: "></asp:Label>
                <asp:TextBox ID="tbxEmail" runat="server" type="email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredEmail" runat="server"
                    ControlToValidate="tbxEmail" ErrorMessage="* Field is required" ForeColor="red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularEmail" runat="server"
                    ErrorMessage="* Invalid Email" ControlToValidate="tbxEmail"
                    SetFocusOnError="True" ForeColor="red"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                </asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:Label ID="lblMobile" runat="server" Text="Mobile No.: "></asp:Label>
                <asp:TextBox ID="tbxMobile" runat="server" type="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredMobile" runat="server" Display="Dynamic"
                    ControlToValidate="tbxMobile" ErrorMessage="* Field is required" ForeColor="red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularMobile" runat="server"
                    Display="Dynamic" ControlToValidate="tbxMobile" ValidationExpression="[7-9][0-9]{9}"
                    ErrorMessage="* Enter a valid phone number" ForeColor="red"></asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:Label ID="lblOrganization" runat="server" Text="Organization: "></asp:Label>
                <asp:TextBox ID="tbxOrganization" runat="server" type="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredOrganization" runat="server" Display="Dynamic"
                    ControlToValidate="tbxOrganization" ErrorMessage="* Field is required" ForeColor="red"></asp:RequiredFieldValidator>
            </p>
            
            <p>
                <asp:Label ID="lblDesignation" runat="server" Text="Designation: "></asp:Label>
                <asp:TextBox ID="tbxDesignation" runat="server" type="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredDesignation" runat="server" Display="Dynamic"
                    ControlToValidate="tbxDesignation" ErrorMessage="* Field is required" ForeColor="red"></asp:RequiredFieldValidator>
            </p>
            <h3>Bank Account Details (Be careful while filling the details):
            </h3>
            <p>
                <asp:Label ID="lblBank" runat="server" Text="Bank Name: "></asp:Label>               
                <asp:DropDownList ID="ddlBank" runat="server" ValidationGroup="GroupBank"></asp:DropDownList>
                <asp:RequiredFieldValidator ControlToValidate="ddlBank" ID="RequiredBank"
                    ValidationGroup="GroupBank" ErrorMessage="* Please select a bank" ForeColor="Red"
                    InitialValue="Select" runat="server" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="lblAccountType" runat="server" Text="Type of Account: "></asp:Label>
                <asp:RadioButtonList ID="rblAccountType" runat="server">
                    <asp:ListItem>Savings</asp:ListItem>
                    <asp:ListItem>Current</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="RequiredAccountType"
                    ControlToValidate="rblAccountType" Text="* Field is required" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="lblAccountNo" runat="server" Text="Account No.: "></asp:Label>
                <asp:TextBox ID="tbxAccountNo" runat="server" type="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredAccountNo" runat="server" Display="Dynamic"
                    ControlToValidate="tbxAccountNo" ErrorMessage="* Field is required" ForeColor="red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularAccountNo" runat="server"
                    Display="Dynamic" ControlToValidate="tbxAccountNo" ValidationExpression="[0-9]+"
                    ErrorMessage="* Enter a valid Account Number" ForeColor="red"></asp:RegularExpressionValidator>

            </p>
            <p>
                <asp:Label ID="lblAccountHolder" runat="server" Text="Account Holder Name: "></asp:Label>
                <asp:TextBox ID="tbxAccountHolder" runat="server" type="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredAccountHolder" runat="server" Display="Dynamic"
                    ControlToValidate="tbxAccountHolder" ErrorMessage="* Field is required" ForeColor="red"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="lblIfsc" runat="server" Text="IFSC Code: "></asp:Label>
                <asp:TextBox ID="tbxIfsc" runat="server" type="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredIfsc" runat="server" Display="Dynamic"
                    ControlToValidate="tbxIfsc" ErrorMessage="* Field is required" ForeColor="red"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="SUBMIT" />
            </p>
        </div>
    </form>
</body>
</html>
