<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Database connection parameters
$host = "fdb1029.awardspace.net"; // Database host
$username = "4567886_project";    // Database username
$password = "Samirali12";         // Database password
$dbname = "4567886_project";      // Database name

// Create connection
$conn = new mysqli($host, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(["status" => "error", "message" => "Database connection failed: " . $conn->connect_error]));
}

// Check if the request is POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get the input data
    $input = json_decode(file_get_contents("php://input"), true);

    $name = $input['name'] ?? '';
    $email = $input['email'] ?? '';
    $password = $input['password'] ?? '';
    $age = $input['age'] ?? '';
    $grade = $input['grade'] ?? '';
    $gender = $input['gender'] ?? '';

    // Validate input
    if (empty($name) || empty($email) || empty($password) || empty($age) || empty($grade) || empty($gender)) {
        echo json_encode(["status" => "error", "message" => "All fields are required"]);
        exit;
    }

    // Hash the password
    $hashed_password = password_hash($password, PASSWORD_BCRYPT);

    // Prepare the SQL query to insert user data
    $sql = "INSERT INTO users (name, email, password, age, grade, gender) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);

    if ($stmt === false) {
        echo json_encode(["status" => "error", "message" => "Error preparing query: " . $conn->error]);
        exit;
    }

    $stmt->bind_param("ssssss", $name, $email, $hashed_password, $age, $grade, $gender);

    // Execute the statement
    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "User registered successfully"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Error inserting data: " . $stmt->error]);
    }

    // Close statement and connection
    $stmt->close();
    $conn->close();
} else {
    echo json_encode(["status" => "error", "message" => "Invalid request method"]);
}
?>
