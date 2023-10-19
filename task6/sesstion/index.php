<?php 
echo "<pre>";
var_dump($_REQUEST);
echo "</pre>";
echo "<pre>";
var_dump($_GET);
echo "</pre>";
echo "<pre>";
var_dump($_POST);
echo "</pre>";
extract($_REQUEST);
//require_once 'database.php';
$users_data =
[
    ['username' => 'islam mohamed' , 'pass' => 15975],
    ['username' => 'ahmed sayed' , 'pass' => 123456],
    ['username' => 'mohamed sayed' , 'pass' => 896523],
];

//$username = 'islam mohamed';
//$password = 15975;

foreach($users_data as $user) {

    // var_dump($user);

    if($user['username'] == $username && $user['pass'] == $password) {
        echo "data is correct";
        break;
    } else {
        echo "user is not found <br>";
    };
};
/*
$username='omar';
echo array_search($username,$user_data,true);
*/

?>


<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
    <script src='main.js'></script>
</head>
<body>

<form id="form22" method="post">
    <input type="text" name="uname" value="">username
    <input type="text" name="upass" value="">password
    <button>submit</button>
</form>
    
</body>
</html>