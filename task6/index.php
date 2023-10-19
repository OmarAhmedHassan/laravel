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

form { 
    display: flex; 
    flex-direction: column; 
    align-items: center; 
    padding: 20px; 
    border: 1px solid #ccc; 
    border-radius: 5px; 
    background-color: #f9f9f9; } 
    label { margin-top: 10px; } 
    input[type="text"], input[type="password"] { width: 100%; padding: 8px; margin-top: 6px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 4px}

</style> 
</head>
<body>
<form action="/submit_form" method="post"> 
    <label for="username">Username:</label><br> 
    <input type="text" id="username" name="username"><br> 
    <label for="password">Password:</label><br> 
    <input type="password" id="password" name="password"><br> 
    <input type="submit" value="Login"> 
</form>
</body>
</html>



