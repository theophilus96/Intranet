<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<script>
    function doSubmit() {
        document.getElementById("btnSubmit").click();
    
    }
</script>
<body onload="doSubmit();">
  
        <div>
            <form id="abc" name="abc" action="http://www.office.biz-era.net:8088/webservice/adsignon/login.aspx" method="post">
            <input type="hidden" name="challenge" value="" id="challenge" runat="server"/><br />
            <input type="hidden" name="returnURL" value="" id="returnURL" runat="server"/><br />
            <input type="submit" id="btnSubmit" style="visibility:hidden;"/>
           </form>
        </div>

   <!--http://localhost:59993/loginsuccess.aspx-->
</body>
</html>
