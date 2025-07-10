<?php
session_start();

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$conn = new mysqli("localhost", "root", "", "hw1"); // cambia se necessario

if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(['error' => 'Errore connessione DB']);
    exit;
}


require_once __DIR__ . '/libs/stripe-php/init.php';
\Stripe\Stripe::setApiKey(''); // CHIAVE SEGRETA

$user_id = $_SESSION['_agora_user_id'] ?? null;
if (!$user_id) {
    http_response_code(403);
    echo json_encode(['error' => 'Utente non autenticato']);
    exit;
}

$sql = "SELECT title, price FROM cart WHERE user_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$line_items = [];
while ($row = $result->fetch_assoc()) {
    $line_items[] = [
        'price_data' => [
            'currency' => 'eur',
            'product_data' => ['name' => $row['title']],
            'unit_amount' => intval($row['price'] * 100), 
        ],
        'quantity' => 1
    ];
}

if (empty($line_items)) {
    http_response_code(400);
    echo json_encode(['error' => 'Il carrello è vuoto']);
    exit;
}

$YOUR_DOMAIN = 'http://localhost/hw1';

try {
    $checkout_session = \Stripe\Checkout\Session::create([
        'payment_method_types' => ['card'],
        'line_items' => $line_items,
        'mode' => 'payment',
        'success_url' => $YOUR_DOMAIN . '/index.php',
        'cancel_url' => $YOUR_DOMAIN . '/index.php',
    ]);

    echo json_encode(['id' => $checkout_session->id]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
}