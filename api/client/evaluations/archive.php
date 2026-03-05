<?php
// api/client/evaluations/archive.php
require_once '../../config/db.php';
require_once '../../utils/auth_middleware.php';

Responder::setupCORS();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    Responder::error("Método no permitido.", 405);
}

$clientData = AuthMiddleware::requireClient();
$companyId = $clientData['companyId'];

$json = file_get_contents('php://input');
$data = json_decode($json, true);

$evalId = trim($data['evaluationId'] ?? '');

if (empty($evalId)) {
    Responder::error("ID de evaluación requerido.");
}

try {
    // Solo archivar si pertenece a esta empresa
    $stmt = $pdo->prepare("UPDATE evaluations SET archived = 1, updatedAt = NOW() WHERE id = ? AND companyId = ?");
    $stmt->execute([$evalId, $companyId]);

    if ($stmt->rowCount() === 0) {
        Responder::error("Evaluación no encontrada o sin permisos.", 404);
    }

    Responder::success([], "Evaluación archivada correctamente.");
}
catch (Exception $e) {
    Responder::error("Error al archivar: " . $e->getMessage(), 500);
}
?>
