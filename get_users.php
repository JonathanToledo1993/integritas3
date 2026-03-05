<?php
require_once 'api/config/db.php';
$stmt = $pdo->query("SELECT email, role, companyId FROM users WHERE role = 'ADMIN' OR role = 'CLIENT' LIMIT 5");
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);
print_r($users);
?>
