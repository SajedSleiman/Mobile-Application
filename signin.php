<?php
// Set response headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");

// Enable error reporting for debugging (disable in production)
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

try {
    // Check if the request method is POST
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Get the JSON input
        $input = json_decode(file_get_contents('php://input'), true);
        $email = $input['email'] ?? null;
        $password = $input['password'] ?? null;

        // Validate input
        if (!$email || !$password) {
            echo json_encode(["status" => "error", "message" => "Email and password are required."]);
            exit();
        }

        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            echo json_encode(["status" => "error", "message" => "Invalid email format."]);
            exit();
        }

        // Database connection details
        $servername = "fdb1029.awardspace.net";
        $username = "4567886_project";
        $password_db = "Samirali12";
        $dbname = "4567886_project";

        // Create a new database connection
        $conn = new mysqli($servername, $username, $password_db, $dbname);

        // Check database connection
        if ($conn->connect_error) {
            error_log("Database connection failed: " . $conn->connect_error);
            echo json_encode(["status" => "error", "message" => "Server error. Please try again later."]);
            exit();
        }

        // Query to fetch user details
        $query = "SELECT id, password FROM users WHERE email = ?";
        $stmt = $conn->prepare($query);

        if (!$stmt) {
            error_log("Failed to prepare SQL query: " . $conn->error);
            echo json_encode(["status" => "error", "message" => "Server error. Please try again later."]);
            exit();
        }

        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        // Check if the user exists
        if ($result->num_rows === 1) {
            $user = $result->fetch_assoc();
            
            // Verify the password
            if (password_verify($password, $user['password'])) {
                echo json_encode([
                    "status" => "success",
                    "user_id" => $user['id']
                ]);
            } else {
                echo json_encode(["status" => "error", "message" => "Invalid email or password."]);
            }
        } else {
            echo json_encode(["status" => "error", "message" => "Invalid email or password."]);
        }

        // Close the statement and connection
        $stmt->close();
        $conn->close();
    } else {
        echo json_encode(["status" => "error", "message" => "Invalid request method."]);
    }
} catch (Exception $e) {
    error_log("Server error: " . $e->getMessage());
    echo json_encode(["status" => "error", "message" => "Server error. Please try again later."]);
}
?>
