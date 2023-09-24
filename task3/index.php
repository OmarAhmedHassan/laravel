<?php

$countryList = [
    'CA'        => 'Canada',
    'US'        => 'United States'];

$stateList['CA'] = [
    'AB'        => 'Alberta',
    'BC'        => 'British Columbia',
    'AB'        => 'Alberta',
    'BC'        => 'British Columbia',
    'MB'        => 'Manitoba',
    'NB'        => 'New Brunswick',
    'NL'        => 'Newfoundland/Labrador',
    'NS'        => 'Nova Scotia',
    'NT'        => 'Northwest Territories',
    'NU'        => 'Nunavut',
    'ON'        => 'Ontario',
    'PE'        => 'Prince Edward Island',
    'QC'        => 'Quebec',
    'SK'        => 'Saskatchewan',
    'YT'        => 'Yukon'];

$stateList['US'] = [
    'AL'        => 'Alabama',
    'AK'        => 'Alaska',
    'AZ'        => 'Arizona',
    'AR'        => 'Arkansas',
    'CA'        => 'California',
    'CO'        => 'Colorado',
    'CT'        => 'Connecticut',
    'DE'        => 'Delaware',
    'DC'        => 'District of Columbia',
    'FL'        => 'Florida',
    'GA'        => 'Georgia',
    'HI'        => 'Hawaii',
    'ID'        => 'Idaho',
    'IL'        => 'Illinois',
    'IN'        => 'Indiana',
    'IA'        => 'Iowa',
    'KS'        => 'Kansas',
    'KY'        => 'Kentucky',
    'LA'        => 'Louisiana',
    'ME'        => 'Maine',
    'MD'        => 'Maryland',
    'MA'        => 'Massachusetts',
    'MI'        => 'Michigan',
    'MN'        => 'Minnesota',
    'MS'        => 'Mississippi',
    'MO'        => 'Missouri',
    'MT'        => 'Montana',
    'NE'        => 'Nebraska',
    'NV'        => 'Nevada',
    'NH'        => 'New Hampshire',
    'NJ'        => 'New Jersey',
    'NM'        => 'New Mexico',
    'NY'        => 'New York',
    'NC'        => 'North Carolina',
    'ND'        => 'North Dakota',
    'OH'        => 'Ohio',
    'OK'        => 'Oklahoma',
    'OR'        => 'Oregon',
    'PA'        => 'Pennsylvania',
    'RI'        => 'Rhode Island',
    'SC'        => 'South Carolina',
    'SD'        => 'South Dakota',
    'TN'        => 'Tennessee',
    'TX'        => 'Texas',
    'UT'        => 'Utah',
    'VT'        => 'Vermont',
    'VA'        => 'Virginia',
    'WA'        => 'Washington',
    'WV'        => 'West Virginia',
    'WI'        => 'Wisconsin',
    'WY'        => 'Wyoming'
    ];


$new=$result = array_merge($countryList, $stateList);
/*
echo "<pre>";
print_r($new); 
echo "</pre>";
*/
echo $new['US']['KS'];
echo "</br>";
echo $new['US']['AL'];
echo "</br>";
echo $new['CA']['ON'];
/*Kansas &  Nova Scotia
echo "<pre>";
var_dump($new);
echo "</pre>";
*/
echo "<pre>";
echo "</pre>";


//--------------------------------------------------------------------------
//- Ex2  try using a builtin function to get max int number system can hold and assign it to $max_int 


//this is The largest integer supported in this build of PHP. Usually int(2147483647) in 32 bit systems and int(9223372036854775807) in 64 bit systems. 
$max_int = PHP_INT_MAX;
var_dump($max_int);


//try to explain what happen in the following array

$arr = []; // Defining array
$arr[1] = 'last name'; // adding value at key 1  


$arr[ $max_int ] = 'this is max of array '; 
// assign the system max int value as a key and this string as value

$arr[0] = 'first name'; // adding this in key 0 

//$arr[]  = 'this may be at the last of array'; 
//Fatal error:because we have reached the system max int number simply there is no more numbers !! :D 
// and i would fix fit with $max_int=$max_int-1; ;D



echo "<pre>";
print_r($arr); 
echo "</pre>";
//Ex3  search and use the following array methods ( count , in_array , array_key_exists , array_keys , array_values , array_sum , end , array_rand , array_merge , array_replace , array_shift , array_unshift , array_push , array_pop , array_slice , array_splice ) make 1 example on each of the following array methods



//count array example 
$cars=array("Volvo","BMW","Toyota");
echo "<pre>";
echo count($cars);
echo "</pre>";
//in_array  example 
$people = array("Peter", "Joe", "Glenn", "Cleveland");

if (in_array("Glenn", $people))
    {
        echo "Match found";
    }
    else
    {
        echo "Match not found";
    }
echo "<pre>";echo "</pre>";

//array_key_exists  example 
$a=array("Volvo"=>"XC90","BMW"=>"X5");
if (array_key_exists("Volvo",$a))
    {
        echo "Key exists!";
    }
    else
    {
        echo "Key does not exist!";
    }
echo "<pre>";echo "</pre>";

//array_keys  example 
$a=array("Volvo"=>"XC90","BMW"=>"X5","Toyota"=>"Highlander");
print_r(array_keys($a,"Highlander"));
echo "<pre>";echo "</pre>";

//array_keys  example Return all the values of an array (not the keys):
$a=array("Name"=>"Peter","Age"=>"41","Country"=>"USA");
print_r(array_values($a));
echo "<pre>";echo "</pre>";


// array_sum : Return the sum of all the values in the array (5+15+25):  example 
$a=array(5,15,25);
echo array_sum($a);
echo "<pre>";echo "</pre>";

//array end and current return the first and last array by key 
$people = array("Peter", "Joe", "Glenn", "Cleveland");
echo current($people) . "<br>";
echo end($people);
echo "<pre>";echo "</pre>";

// array_rand Return an array of random keys array_rand(array, number)  example 
$a=array("a"=>"red","b"=>"green","c"=>"blue","d"=>"yellow");
print_r(array_rand($a,2));
echo "<pre>";echo "</pre>";

//array_merge used it in the countryList :Merge two arrays into one array:

//array_replace  Replace the values of the first array ($a1) with the values from the second array ($a2):
$a1=array("red","green","blue","yellow");
$a2=array(0=>"orange",3=>"burgundy");
$a3=array_replace($a1,$a2);
print_r($a3);
echo "<pre>";echo "</pre>";

//array_shift() Remove the first element (red) from an array, and return the value of the removed element:
$a=array("a"=>"red","b"=>"green","c"=>"blue");
echo array_shift($a)."<br>";
print_r ($a);
echo "<pre>";echo "</pre>";

//

?>