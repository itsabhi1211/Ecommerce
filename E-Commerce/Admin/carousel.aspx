<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="carousel.aspx.cs" Inherits="E_Commerce.Admin.carousel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"  />
  
</head>

<body>
    <form id="form1" runat="server">
       <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
  </ol>
  <div class="carousel-inner" role="listbox">
   
    <div class="carousel-item active">
      <img class="d-block w-100" src="../img/11.jpg" data-src="holder.js/900x400?theme=social" alt="900x400" data-holder-rendered="true" style="width: 900px; height: 400px;"/>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="../img/1.png" data-src="holder.js/900x400?theme=industrial" alt="900x400" data-holder-rendered="true" style="width: 900px; height: 400px;"/>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

    </form>
</body>
</html>
