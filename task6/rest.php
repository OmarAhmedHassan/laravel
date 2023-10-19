<!DOCTYPE html>
<html>
<head>
<title>Single Sign-on</title>
<style>
 /* Add your own CSS styling here */
</style>
</head>
<body>
 <form>
    <h2>Login Reset</h2>
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required>
    <br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    <br>
    <label for="city">City of Employment:</label>
    <input type="text" id="city" name="city" required>
    <br>
    <label for="webserver">Web server:</label>
    <input type="text" id="webserver" name="webserver" required>
    <br>
    <label for="role">Choose a server:</label>
    <select id="role" name="role">
      <option value="admin">Admin</option>
      <option value="engineer">Engineer</option>
      <option value="manager">Manager</option>
      <option value="guest">Guest</option>
    </select>
    <br>
    <input type="submit" value="Submit">
 </form>
</body>
</html>