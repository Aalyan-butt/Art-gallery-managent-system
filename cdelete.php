<html>
<head>
    <title>Delete from Customer</title>
</head>
<style>
b{
    font-size: 30px;
    font-family: 'Arial';
    padding: 27px 62px;
}
input[type=text] {
    width: 120px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 9px;
    font-size: 16px;
    background-color: white;
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 27px 20px 22px 10px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}
input[type=text]:focus {
    width: 50%;
}
div{
	font-family: 'Verdana';
	font-size: 35px;
	font-weight:bold;
	margin-left:25px;
	margin-top: 35px;
}
.btn{
	background-color: forestgreen;
    color: white;
    padding: 16px 10px;
    margin: 8px 20px 20px 50px;
    border-radius: 24px;
    cursor: pointer;
    width: 10%;
    opacity: 0.7;
    align-content: center;
    font-family: "verdana";
    font-weight: bold;
    -webkit-box-shadow: 0px 6px 0px green;
    -moz-box-shadow: 0px 6px 0px green;
    box-shadow: 0px 6px 0px green;
    -webkit-transition: all .1s ease-in-out;
    -moz-transition: all .2s ease-in-out;
    transition: all .2s ease-in-out;
    -webkit-transform: translate(0, 5px) rotateX(25deg);
    -moz-transform: translate(0, 4px);
    transform: translate(0, 4px)
    }
.btn:hover 
{
    opacity: 1;
    background-color:forestgreen;
}

</style>
<body style="background-color: lavenderblush">
    <h1><center><font style="border:9px solid grey" face="arial">DELETE FROM CUSTOMER TABLE </font></center></h1>
	<form action="cdelete.php" method="POST">
		<div>Enter Customer ID:<input type="text" name="custid" placeholder="CUS_ID 400-406"><br></div>
		<br><br>
		<button type="submit" value ="Delete" class="btn">DELETE</button>
        <button type="reset" value ="Reset" class="btn">RESET</button>
	</form>
 <?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "art_gallery";


$con = new mysqli($servername, $username, $password, $dbname);

if ($_SERVER["REQUEST_METHOD"] == "POST")
{
    $a=$_POST['custid'];

    if($a!="")
        {
            $sql1 = "SELECT * from Customer where custid='$a'";
            $result = mysqli_query($con,$sql1);

            if(mysqli_num_rows($result)>0)
            {
            $sql3="DELETE from Customer where custid='$a'";   // student is the table name
            mysqli_query($con,$sql3);
            echo "<b>Record with Customer ID = $a is deleted successfully.<b>";
            }
           else
        {
            echo "<b>!!!Error in Deleting Record!!!<br> Record '$a' was not found in database.<b>" ;
        }
        }else{
                echo "Customer ID Field is Empty";
            }
$con->close();
}
?>  
</body>
<p style="font-family: arial"><a href="customer.html"><font style="color:black">GO BACK</font></a></p>
</html>