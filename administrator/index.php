<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>Login Admin</title>

    <link rel="stylesheet" href="../css/style.css">

<script language="javascript">
function validasi(form){
  if (form.username.value == ""){
      document.getElementById('eroruser').innerHTML = "<div class='error msg'>Username is empty, click to close</div>";
      form.username.focus();
      $(function() {
	Cufon.replace('#site-title');
	$('.msg').click(function() {
		$(this).fadeTo('slow', 0);
		$(this).slideUp(341);
	});
      });
    return (false);
  }

  if (form.password.value == ""){
    document.getElementById('erorpass').innerHTML = "<div class='error msg'>Password is empty, click to close</div>";
    form.password.focus();
    $(function() {
	Cufon.replace('#site-title');
	$('.msg').click(function() {
		$(this).fadeTo('slow', 0);
		$(this).slideUp(341);
	});
    });
    return (false);
  }
  return (true);
}
</script>

</head>

<body>

  <div class="login-wrap">
  <h2>Login Admin</h2>

<form name="login" action="cek_login.php" method="POST" onSubmit="return validasi(this)">

  <div class="form">
    <input type="text" placeholder="Username" name="username" />
    <input type="password" placeholder="Password" name="password" />
    <button> Sign in </button>
    <a href="#"> <p> Don't have an account? Register </p></a>
  </div>
</form>

</div>

  <script src='../js/jquery-1.10.0.min.js'></script>

  <script src="../js/index.js"></script>

</body>

</html>