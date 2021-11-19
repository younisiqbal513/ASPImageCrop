<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPImageCrop._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <%-- Now I Will add some js & css file Here. This is required for select crop area --%>
    <%-- you can download this Jcrop.css & jquery.Jcrop.js file from Here : https://github.com/tapmodo/Jcrop --%>
    <link href="Scripts/jquery.Jcrop.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.7.1.min.js"></script>
    <script src="Scripts/jquery.Jcrop.js"></script>
    <script language="javascript">
        $(document).ready(function () {
            $('#<%=imgUpload.ClientID%>').Jcrop({
                onSelect: SelectCropArea
            });
        });
        function SelectCropArea(c) {
            $('#<%=X.ClientID%>').val(parseInt(c.x));
            $('#<%=Y.ClientID%>').val(parseInt(c.y));
            $('#<%=W.ClientID%>').val(parseInt(c.w));
            $('#<%=H.ClientID%>').val(parseInt(c.h));
        }
    </script>
    <h3>Image Upload, Crop & Save using ASP.NET & Jquery</h3>
    <%-- HTML Code --%>
    <table>
        <tr>
            <td>
                Select Image File : 
            </td>
            <td>
                <asp:FileUpload ID="FU1" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblMsg" runat="server" ForeColor="Red" />
            </td>
        </tr>
    </table>
    <asp:Panel ID="panCrop" runat="server" Visible="false">
        <table>
            <tr>
                <td>
                    <asp:Image ID="imgUpload" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnCrop" runat="server" Text="Crop & Save" OnClick="btnCrop_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <%-- Hidden field for store cror area --%>
                    <asp:HiddenField ID="X" runat="server" />
                    <asp:HiddenField ID="Y" runat="server" />
                    <asp:HiddenField ID="W" runat="server" />
                    <asp:HiddenField ID="H" runat="server" />
                    <br />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
