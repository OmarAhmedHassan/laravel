<?php
include"layout/header.php";


if($_GET)
  {
    $page=$_GET['page'];
    include "layout/" . $page . ".php";
  }else
  {
    include"layout/home.php";
  }




include"layout/footer.php";
?>


  
