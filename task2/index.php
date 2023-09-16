<?php

// seniorsteps laravel course  task 2

/*
solving this task using "use variable , gettype , var_dump , print_r" and 
def types of comment 
def between const & variable scope inside function => global
*/

//first type of constant
define('DB_POST', 3306);

//second type of constant
const DB_NAME = "steps";

//normal variable
$x = 'ahmed';

echo $x ;
echo '<br>';
//normal function
function test()
{
    //making the variable global so it can be used inside the function
    global $x ;
    echo '<br>';
    echo $x;
}

echo test();

echo '<br>';
var_dump(gettype($x));



?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

</body>
</html>