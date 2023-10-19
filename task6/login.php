<?php 

if($_POST){
/*
echo "<pre>";
var_dump($_POST);
echo "</pre>";
*/




$username = $_POST['username']; 
$password = $_POST['password']; 

$users_data =
[
    ['username' => 'islam mohamed' , 'pass' => 15975],
    ['username' => 'omar' , 'pass' => 123],
    ['username' => 'mohamed sayed' , 'pass' => 896523],
];

$flag=0;

foreach($users_data as $user) {

    // var_dump($user);

    if($user['username'] == $username && $user['pass'] == $password) {
        $flag = 1;
        break;
    } else {
        $flag = 0;

    };
};

if($flag == 1){header('Location: index.php');}else{echo "user is not found <br>";};


}

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
    
<style> 
#con{
    width: 100%;
    display: flex; 
    flex-direction: column; 
    align-items: center; 


}
form { 
    width: 30%;
    display: flex; 
    flex-direction: column; 
    align-items: center; 
    padding: 20px; 
    border: 1px solid #ccc; 
    border-radius: 5px; 
    background-color: #f9f9f9; } 
    label { margin-top: 0px; } 
    input[type="text"], input[type="password"] { width: 100%; padding: 4px; margin-top: 2px; margin-bottom: 5px; border: 1px solid #ccc; border-radius: 4px}

</style> 
</head>
<body>
    <dev id="con">
        <form  method="post"> 
            <label for="username">Username:</label><br> 
            <input type="text" id="username" name="username"><br> 
            <label for="password">Password:</label><br> 
            <input type="password" id="password" name="password"><br> 
            <input type="submit" value="Login">
        </form>
    </dev>
</body>
</html>



