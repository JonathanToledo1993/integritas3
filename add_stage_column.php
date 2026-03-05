<?php
require_once 'api/config/db.php';

try {
    $sql = "ALTER TABLE evaluation_candidates ADD COLUMN internalStage VARCHAR(50) DEFAULT 'Aún sin evaluar';";
    $pdo->exec($sql);
    echo "Column 'internalStage' added successfully to 'evaluation_candidates'.\n";
}
catch (PDOException $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
?>
