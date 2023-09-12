<?php
/*
echo and print are more or less the same. They are both used to output data to the screen. 
The differences are small: echo has no return value while print has a return value of 1 so it can be used in expressions. echo can take multiple parameters (although such usage is rare) while print can take one argument. echo is marginally faster than print.

The echo statement can be used with or without parentheses: echo or echo().
*/

echo "<h2>PHP is Fun!</h2>";
echo "Hello world!<br>";
echo "I'm about to learn PHP!<br>";
echo "This ", "string ", "was ", "made ", "with multiple parameters.";

//The print statement can be used with or without parentheses: print or print().

$txt1 = "Learn PHP";
$txt2 = "seniorsteps";
$x = 5;
$y = 4;

print "<h2>" . $txt1 . "</h2>";
print "Study PHP at " . $txt2 . "<br>";
print $x + $y;



?>