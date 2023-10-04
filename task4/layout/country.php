<?php include_once 'data.php' ?>
<pre>
this is Country
<a href="?page=home">Home</a>
<br>
<a href="?page=about">about</a>
</pre>


<pre>
<?php
    foreach($countryList as $x => $val) 
    {
        echo "<br>";
        $count=count($stateList[$x]);
        echo "<h3>$x = $val</h3><h4>Total:$count</h4>";
        foreach($stateList[$x] as $z => $val2) 
        {
            echo "$z = $val2<br>";
        }
    }
?> 
</pre>



