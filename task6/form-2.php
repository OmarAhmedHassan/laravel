<?php 

/*
echo "<pre>";
var_dump($_POST);
echo "</pre>";

  ["salutation"]=>
  string(11) "salutation1"
  ["first-name"]=>
  string(5) "asdas"
  ["last-name"]=>
  string(3) "asd"
  ["gender"]=>
  string(4) "male"
  ["email"]=>
  string(18) "admin123@gmail.com"
  ["dob"]=>
  string(10) "2023-11-08"
  ["address"]=>
  string(8) "asdasdas"

*/
$salu = $_POST['salutation']; 
$fname = $_POST['first-name']; 
$lname = $_POST['last-name']; 
$gender = $_POST['gender']; 
$email = $_POST['email'];
$dob = $_POST['dob']; 
$address = $_POST['address']; 

echo "form data:";
echo "<br>";

echo $salu; echo "<br>";
echo $fname; echo "<br>";
echo $lname;  echo "<br>";
echo $gender;  echo "<br>";
echo $email;  echo "<br>";
echo $email;   echo "<br>";
echo $dob;   echo "<br>";
echo $address;  echo "<br>";
echo "<br>";



?>



<!DOCTYPE html> <html lang="en"> 
    <head> <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>Document</title> 
    <style> 
    label { display: block; margin-top: 10px; } 
    input[type="checkbox"] { margin-top: 3px; } 
    </style> 
    </head> 
    <body> 
        <h1>Personal Details</h1> 
    <form method="post"> 
        <label for="salutation">Salutation</label>   
    <select id="salutation" name="salutation" required>
        <option value="salutation1">salutation1</option>
        <option value="salutation2">salutation2</option>
    </select>

    <label for="first-name">First name</label>
    <input type="text" id="first-name" name="first-name">
    <label for="last-name">Last name</label>
    <input type="text" id="last-name" name="last-name">

    <br><br>
    <span for="gender">Gender</span>
    <input type="radio" id="gender1" name="gender" value="male">
    <span for="gender1">Male</span>
    <input type="radio" id="gender2" name="gender" value="female">
    <span for="gender2">Female</span>

    <label for="email">Email</label>
    <input type="email" id="email" name="email">
    <label for="dob">Date of Birth</label>
    <input type="date" id="dob" name="dob">
    <label for="address">Address</label>
    <textarea id="address" name="address" rows="4" cols="50"></textarea>
    <br>
    <button type="submit">Submit</button>

</form>
<div>

</body> </html>