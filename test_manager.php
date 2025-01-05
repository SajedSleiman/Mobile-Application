<?php
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
$action = $_GET['action'] ?? '';

if ($action == 'retrieve_test_questions') {
    $user_id = $_GET['user_id'] ?? '';

    // Fetch 5 random questions with their options
    $query = "SELECT id, question, option1, option2, option3, option4 FROM questions ORDER BY RAND() LIMIT 5";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        $questions = [];
        while ($row = $result->fetch_assoc()) {
            $questions[] = $row;
        }
        echo json_encode($questions);
    } else {
        echo json_encode([]);
    }
}

if ($action == 'submit_answers') {
    $user_id = $_POST['user_id'] ?? '';
    $answers = json_decode($_POST['answers'], true) ?? []; // Decode answers from JSON

    $score = 0;
    $total = count($answers);

    foreach ($answers as $question_id => $selected_option) {
        // Check the correct answer for each question
        $query = "SELECT correct_option FROM questions WHERE id = $question_id";
        $result = $conn->query($query);
        if ($result && $row = $result->fetch_assoc()) {
            if ($row['correct_option'] == $selected_option) {
                $score++;
            }
        }
    }

    $percentage = ($total > 0) ? ($score / $total) * 100 : 0;

    // Update test table with the score
    $insert_query = "INSERT INTO test (user_id, score, percentage) VALUES ($user_id, $score, $percentage)";
    $conn->query($insert_query);

    echo json_encode(['score' => $score, 'percentage' => $percentage]);
}

$conn->close();
?>
