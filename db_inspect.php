<?php
require_once __DIR__ . '/api/config/db.php';
$stmt = $pdo->query("SHOW TABLES");
$tables = $stmt->fetchAll(PDO::FETCH_COLUMN);

echo "TABLES:\n";
foreach ($tables as $t) {
    echo $t . "\n";
    $stmt2 = $pdo->query("DESCRIBE `$t`");
    $cols = $stmt2->fetchAll(PDO::FETCH_ASSOC);
    foreach ($cols as $c) {
        if (strpos($t, 'catalog_') === 0 || strpos($t, 'candidate_') === 0) {
            echo "  - " . $c['Field'] . " (" . $c['Type'] . ")\n";
        }
    }
}
?>
