<?php
header("Content-Type: text/plain");
require_once 'api/config/db.php';

try {
    echo "Checking tables...\n";
    $stmt = $pdo->query("SHOW TABLES");
    $tables = $stmt->fetchAll(PDO::FETCH_COLUMN);
    print_r($tables);

    if (in_array('candidate_answers', $tables)) {
        echo "\nDescribing candidate_answers:\n";
        $stmt2 = $pdo->query("DESCRIBE candidate_answers");
        print_r($stmt2->fetchAll(PDO::FETCH_ASSOC));
    }
    else {
        echo "\nERROR: candidate_answers table MISSING!\n";
    }

}
catch (Exception $e) {
    echo "ERROR: " . $e->getMessage();
}
?>
