<?php 
echo "<pre>"; echo"</pre>";
echo "Task 5.1| "; 

//1. Write a function to calculate the factorial of a number (a non-negative integer). The function accepts the number as an argument.

// PHP code to get the factorial of a number 
// function to get factorial in iterative way 
function Factorial($number)
{ 
    $factorial = 1; 
    for ($i = 1; $i <= $number; $i++){ 
    $factorial = $factorial * $i; 
    } 
    return $factorial; 
} 

// Driver Code 
$number = 10; 
$fact = Factorial($number); 
echo "Factorial = $fact"; 
//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

echo "<pre>"; echo"</pre>";
echo "Task 5.2| "; 
//. Write a function to reverse any inputs you give ( if you give it ahmed it return demha ).
function reverse($word)
{
    return strrev($word);
}

$word=reverse('ahmed');
echo "reversed word:$word";
//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

echo "<pre>"; echo"</pre>";
echo "Task 5.3| ";
//3. search on recursive function and make an example 
//Recursive functions are a powerful feature in PHP that allows a function to call itself repeatedly until a certain condition is met.
function display_numbers($n) 
{
    if ($n > 0) 
    {
        display_numbers($n - 1);
        echo $n . " ";
    }
}
display_numbers(40);
//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

echo "<pre>"; echo"</pre>";
echo "Task 5.4| ";
//4. Write a PHP script to get the first word of a sentence
$s = 'The quick brown fox';
$arr1 = explode(' ',trim($s));
echo $arr1[0]."\n";
//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

echo "<pre>"; echo"</pre>";
echo "Task 5.5| ";
//5. Write a PHP script to generate simple random password from a given string (password will be from => '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcefghijklmnopqrstuvwxyz')
function password_generate($chars) 
{
    $data = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcefghijklmnopqrstuvwxyz';
    return substr(str_shuffle($data), 0, $chars);
}
echo password_generate(7);
//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

echo "<pre>"; echo"</pre>";
echo "Task 5.6| ";
//6. Write a PHP script that displays 1 2 3 4 5 6 7 8 9 10 numbers on one line
for($num=1; $num<=10; $num++){echo "$num";};

?> 
