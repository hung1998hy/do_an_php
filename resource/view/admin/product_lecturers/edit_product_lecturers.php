<?php
include '../../../../database/database.php';
include '../../../../function/function.php';

$id = $_POST["productCategoryIdUpdate"];
$name = test_input($_POST["productCategoryNameUpdate"]);
$ok = 1;

if ($name === "") {
    echo "<script>alert('Không được để rỗng!'); window.location = '../main-view/manage-product_lecturers.php';</script>";
    $ok = 0;
} else{
    $sql = mysqli_query($conn, "SELECT * FROM product_categories where name='$name'");
    if ($sql->num_rows > 0) {
        echo "<script>alert('Danh mục đã tồn tại!'); window.location = '../main-view/manage-product_lecturers.php';</script>";
        $ok = 0;
    }
}
if($ok === 1){
    $update = "UPDATE product_categories SET name='$name' WHERE id='$id'";
    if ($conn->query($update) === true) {
        echo "<script>window.location = '../main-view/manage-product_lecturers.php';</script>";
    } else {
        echo "Lỗi";
    }
}
