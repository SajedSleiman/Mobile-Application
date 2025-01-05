<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");

try {
    $servername = "fdb1029.awardspace.net";
    $username = "4567886_project";
    $password = "Samirali12";
    $dbname = "4567886_project";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        echo json_encode(["status" => "error", "message" => "Database connection failed: " . $conn->connect_error]);
        exit();
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $input = json_decode(file_get_contents('php://input'), true);

        $user_id = $input['user_id'] ?? null;
        $chapter_name = $input['chapter_name'] ?? null;

        if (!$user_id || !$chapter_name) {
            echo json_encode(["status" => "error", "message" => "Missing user_id or chapter_name"]);
            exit();
        }

        // Mark the chapter as completed
        $query = "INSERT INTO chapters (user_id, chapter_name, status) 
                  VALUES (?, ?, 'completed') 
                  ON DUPLICATE KEY UPDATE status = 'completed'";
        $stmt = $conn->prepare($query);

        if (!$stmt) {
            echo json_encode(["status" => "error", "message" => "Failed to prepare SQL query"]);
            exit();
        }

        $stmt->bind_param("ss", $user_id, $chapter_name);
        $stmt->execute();

        if ($stmt->affected_rows > 0) {
            echo json_encode(["status" => "success", "message" => "Progress updated"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Failed to update progress"]);
        }

        $stmt->close();
    } elseif ($_SERVER['REQUEST_METHOD'] === 'GET') {
        $user_id = $_GET['user_id'] ?? null;

        if (!$user_id) {
            echo json_encode(["status" => "error", "message" => "Missing user_id"]);
            exit();
        }

        // Fetch progress for the user
        $query = "SELECT chapter_name, status FROM student_progress WHERE user_id = ?";
        $stmt = $conn->prepare($query);

        if (!$stmt) {
            echo json_encode(["status" => "error", "message" => "Failed to prepare SQL query"]);
            exit();
        }

        $stmt->bind_param("s", $user_id);
        $stmt->execute();
        $result = $stmt->get_result();

        $progress = [];
        while ($row = $result->fetch_assoc()) {
            $progress[] = $row;
        }

        echo json_encode(["status" => "success", "data" => $progress]);
        $stmt->close();
    } else {
        echo json_encode(["status" => "error", "message" => "Invalid request method"]);
    }

    $conn->close();
} catch (Exception $e) {
    echo json_encode(["status" => "error", "message" => "Server error: " . $e->getMessage()]);
}
?>
