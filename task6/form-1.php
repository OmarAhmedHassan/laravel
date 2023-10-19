<?php 

/*
echo "<pre>";
var_dump($_POST);
echo "</pre>";
*/
$uname = $_POST['username']; 
$upass = $_POST['password']; 
$city = $_POST['city']; 
$webs = $_POST['webserver']; 
$rol = $_POST['role'];
$fav = $_POST['fav']; 
$uname = $_POST['login']; 

echo "form data:";
echo "<br>";

echo $uname; echo "<br>";
echo $upass; echo "<br>";
echo $city;  echo "<br>";
echo $city;  echo "<br>";
echo $webs;  echo "<br>";
echo $rol;   echo "<br>";
echo $fav;   echo "<br>";
echo "<br>";



?>


<!DOCTYPE html>
<html>
<head>
<title>Single Sign-on</title>
<style>
 /* Add your own CSS styling here */
</style>
</head>
<body>
 <form method="post">
    <h2>Form 2</h2>
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required>
    <br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    <br>
    <label for="city">City of Employment:</label>
    <input type="text" id="city" name="city" required>
    <br>    <br>
    <label for="webserver">Web server:</label>

    <select id="webserver" name="webserver" required>
      <option value="webserver1">webserver1</option>
      <option value="webserver2">webserver2</option>
    </select>

    <br>    <br>
    <label for="role">Please specify your role:</label>
    <br>
    <input type="radio" id="admin" name="role" value="admin">
    <label for="admin">admin</label><br>
    <input type="radio" id="engineer" name="role" value="engineer">
    <label for="engineer">engineer</label><br>
    <input type="radio" id="manager" name="role" value="manager">
    <label for="manager">manager</label>
    <br>
    <input type="radio" id="guest" name="role" value="guest">
    <label for="guest">guest</label>
    
    <br>    <br>
    <label for="role">Single Sign-on to the following:</label>
    <br>
    <input type="checkbox" id="mail" name="fav" value="mail">
    <label for="mail">mail</label><br>
    <input type="checkbox" id="payroll" name="fav" value="payroll">
    <label for="payroll">payroll</label><br>
    <input type="checkbox" id="slef-servere" name="fav" value="slef-servere">
    <label for="slef-servere">slef-servere</label>

    <br>    <br>
    <input type="submit" name="login" value="login">
    <input type="submit" name="rest" value="rest">
 </form>
</body>
</html>