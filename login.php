<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>Login Siswa</title>

    <link rel="stylesheet" href="css/style.css">

<script language="javascript">
function validasi(form){
  if (form.username.value == ""){
    alert("Anda belum mengisikan Username.");
    form.username.focus();
    return (false);
  }

  if (form.password.value == ""){
    alert("Anda belum mengisikan Password.");
    form.password.focus();
    return (false);
  }
  return (true);
}
</script>

</head>

<body>

  <div class="login-wrap">
  <h2>Login Siswa</h2>

<form name="login" action="cek_login.php" method="POST" onSubmit="return validasi(this)">

  <div class="form">
    <input type="text" placeholder="Username" name="username" />
    <input type="password" placeholder="Password" name="password" />
    <button> Sign in </button>
    <a href="registrasi.php"> <p> Don't have an account? Register </p></a>
  </div>
</form>

</div>

  <script src='js/jquery-1.10.0.min.js'></script>

  <script src="js/index.js"></script>

</body>

</html>