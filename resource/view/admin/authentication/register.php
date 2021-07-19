<?php
include '../../../../database/database.php';
include '../../../../function/function.php';
//  https://github.com/PHPMailer/PHPMailer

//  Gọi các thư viện để gửi email
// Import PHPMailer classes into the global namespace
// These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

//  Gọi file gửi email
// Load Composer's autoloader
require '../../../../vendor/PHPMailer-master/src/Exception.php';
require '../../../../vendor/PHPMailer-master/src/PHPMailer.php';
require '../../../../vendor/PHPMailer-master/src/SMTP.php';



$firstnameErr = $lastnameErr = $emailErr = $passwordErr = $confirmErr = "";
$firstname = $lastname = $email = $password = $confirm = "";
if (isset($_POST["register"])) {
    if (empty($_POST["firstname"])) {
        $firstnameErr = "First name is required";
    } else {
        $firstname = test_input($_POST["firstname"]);
    }
    if (empty($_POST["lastname"])) {
        $lastnameErr = "Last name is required";
    } else {
        $lastname = test_input($_POST["lastname"]);
    }
    if (empty($_POST["email"])) {
        $emailErr = "Email is required";
    } else {
        $email = test_input($_POST["email"]);
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $emailErr = "Invalid Email format";
            $email = "";
        }
        $sql = mysqli_query($conn, "SELECT * FROM users where email='$email'");
        if (mysqli_num_rows($sql) > 0) {
            $emailErr = "Email already exists";
            $email = "";
        }
    }
    if (empty($_POST["password"])) {
        $passwordErr = "Password is required";
    } else {
        $password = test_input($_POST["password"]);
        if (!preg_match("/^\S*(?=\S{8,})(?=\S*[a-z])(?=\S*[A-Z])(?=\S*[\d])\S*$/", $password)) {
            $passwordErr = "Must be a minimum of 8 characters,
                        Must contain at least 1 number,
                        Must contain at least one uppercase character,
                        Must contain at least one lowercase character";
            $password = "";
        }
    }
    if (empty($_POST["confirm"])) {
        $confirmErr = "Confirm Password is required";
    } else {
        $confirm = test_input($_POST["confirm"]);
    }
    if ($password !== $confirm) {
        $confirmErr = "Password not match";
        $confirm = "";
    }
    if ($firstname != "" && $lastname != "" && $password != "" && $email != "" && $confirm != "") {
        $md5Password = md5($password);
        $status = 1;
        $is_active= 1;
        $role_id = 2;
        date_default_timezone_set("Asia/Ho_Chi_Minh");
        $time = date('Y-m-d H:i:s');
        $sql = "INSERT INTO users (firstname, lastname, email, password, created_at, is_active, status, role_id) VALUES ('$firstname', '$lastname', '$email', '$md5Password', '$time', $is_active, $status, $role_id)";

        if ($conn->query($sql) === true) {
            echo "<script>alert('Đăng ký thành công'); window.location = 'login.php';</script>";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Đăng Ký - SuperFood Admin</title>
    <link href="../../../../public/core/assets/css/core.css" rel="stylesheet"/>
    <link href="../../../../public/admin/assets/css/styles.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
            crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">Tạo tài khoản</h3>
                            </div>
                            <div class="card-body">
                                <form action="" method="POST">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputFirstName">Tên</label>
                                                <input value="<?php echo $firstname ?>" name="firstname" class="form-control py-4" id="inputFirstName"
                                                       type="text" placeholder="Nhập tên"/>
                                                <span class="error"><?php echo $firstnameErr; ?></span>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputLastName">Họ</label>
                                                <input value="<?php echo $lastname ?>" name="lastname" class="form-control py-4" id="inputLastName"
                                                       type="text" placeholder="Nhập họ"/>
                                                <span class="error"><?php echo $lastnameErr; ?></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="small mb-1" for="inputEmailAddress">Email</label>
                                        <input value="<?php echo $email ?>" name="email" class="form-control py-4" id="inputEmailAddress"
                                               type="email" aria-describedby="emailHelp"
                                               placeholder="Nhập Email"/>
                                        <span class="error"><?php echo $emailErr; ?></span>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputPassword">Mật khẩu</label>
                                                <input value="<?php echo $password ?>" name="password" class="form-control py-4" id="inputPassword"
                                                       type="password" placeholder="Nhập mật khẩu"/>
                                                <span class="error"><?php echo $passwordErr; ?></span>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputConfirmPassword">Xác nhận
                                                    mật khẩu</label>
                                                <input name="confirm" class="form-control py-4"
                                                       id="inputConfirmPassword" type="password"
                                                       placeholder="Xác nhận mật khẩu"/>
                                                <span class="error"><?php echo $confirmErr; ?></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mt-4 mb-0">
                                        <button name="register" class="btn btn-primary btn-block">Tạo tài khoản
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer text-center">
                                <div class="small"><a href="login.php">Đã có tài khoản? Đăng nhập ngay!</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    <div id="layoutAuthentication_footer">
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Bản quyền &copy; Website của bạn 2020</div>
                    <div>
                        <a href="#">Chính sách Bảo mật</a>
                        &middot;
                        <a href="#">Điều khoản & Điều kiện</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="../../../../public/admin/assets/js/scripts.js"></script>
</body>
</html>
