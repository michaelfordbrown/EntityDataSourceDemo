<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EntityDataSourceDemo.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Select a Sales Person:
        <asp:DropDownList ID="SalesPersonDropDownList" runat="server" AutoPostBack="True"
            DataSourceID="SalesPersonEntityDataSource" DataTextField="SalesPerson">
            <asp:ListItem>Choose Sales Person</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:EntityDataSource ID="SalesPersonEntityDataSource" runat="server"
            ConnectionString="name=AdventureWorksLT_DataEntities"
            DefaultContainerName="AdventureWorksLT_DataEntities" EnableFlattening="false"
            EntitySetName="Customers" Select="DISTINCT it.[SalesPerson]">
        </asp:EntityDataSource>
        <br />
        Customer:<br />
        <br />
        <asp:GridView ID="CustomersGridView" runat="server" 
            AllowPaging="true" AllowSorting="true"
            DataSourceID="CustomerEntityDataSource">
            <Columns>
                <asp:CommandField ShowDeleteButton="false" ShowEditButton="true" />
            </Columns>
        </asp:GridView>
    
        <asp:EntityDataSource ID="CustomerEntityDataSource" runat="server"
            ConnectionString="name=AdventureWorksLT_DataEntities"
            DefaultContainerName="AdventureWorksLT_DataEntities" EnableDelete="true"
            EnableFlattening="false" EnableInsert="true" EnableUpdate="true"
            EntitySetName="Customers" >
        </asp:EntityDataSource>

        <asp:QueryExtender ID="CustomersQueryExtender" runat="server" TargetControlID="CustomerEntityDataSource">
            <asp:PropertyExpression>
                <asp:ControlParameter ControlID="SalesPersonDropDownList" Name="SalesPerson" />
            </asp:PropertyExpression>
            <asp:OrderByExpression DataField="Lastname" Direction="Descending" />
        </asp:QueryExtender>
    
    </div>
    </form>
</body>
</html>
