<!DOCTYPE html> 
<html lang="en"> 
    <head> 
        <meta charset="UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Personal Details</title> 
        <style> 
        body { font-family: Arial, sans-serif; }
        h2 {
        text-align: center;
        margin-top: 20px;
    }

    label {
        display: block;
        margin-top: 10px;
    }

    input[type="text"],
    input[type="email"],
    input[type="date"] {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        margin-top: 20px;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>

</head> 
<body> 
    <h2>Personal Details</h2> 
    <form action="#"> 
        <label for="salutation">Salutation</label> 
        <select id="salutation" name="salutation"> 
            <option value="none">--None--</option> 
            <option value="mr">Mr</option> 
            <option value="mrs">Mrs</option> 
            <option value="ms">Ms</option> 
        </select>


<label for="first-name">First name</label>
    <input type="text" id="first-name" name="first-name">

    <label for="last-name">Last name</label>
    <input type="text" id="last-name" name="last-name">

    <label for="