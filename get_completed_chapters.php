<?php
header('Content-Type: application/json');

// Database connection details
$servername = "fdb1029.awardspace.net";
$username = "4567886_project";
$password_db = "Samirali12";
$dbname = "4567886_project";

try {
    // Create a PDO instance
    $pdo = new PDO("mysql:host=$servername;dbname=$dbname;charset=utf8mb4", $username, $password_db);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    // Handle database connection errors
    echo json_encode(['status' => 'error', 'message' => 'Database connection failed: ' . $e->getMessage()]);
    exit();
}

// Get user_id from the request
if (!isset($_GET['user_id']) || empty($_GET['user_id'])) {
    echo json_encode(['status' => 'error', 'message' => 'Missing user_id parameter.']);
    exit();
}

$user_id = $_GET['user_id'];

try {
    // Query to fetch completed chapters for the user
    $stmt = $pdo->prepare("SELECT chapter_name, status FROM chapters WHERE user_id = :user_id");
    $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
    $stmt->execute();

    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if ($result) {
        // Send success response with data
        echo json_encode(['status' => 'success', 'data' => $result]);
    } else {
        // Send success response with empty data array if no chapters found
        echo json_encode(['status' => 'success', 'data' => []]);
    }
} catch (PDOException $e) {
    // Handle query execution errors
    echo json_encode(['status' => 'error', 'message' => 'Query failed: ' . $e->getMessage()]);
}
?>
