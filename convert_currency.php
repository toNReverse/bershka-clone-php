<?php
header('Content-Type: application/json');

$fromCurrency = $_GET['from'] ?? null;
$toCurrency = $_GET['to'] ?? null;
$amount = $_GET['amount'] ?? null;

if (!$fromCurrency || !$toCurrency || !$amount) {
    echo json_encode(['error' => 'Dati mancanti']);
    exit;
}

$apiKey = '524b278bae218fb72665a5b7'; // chiave API

$apiUrl = "https://v6.exchangerate-api.com/v6/$apiKey/latest/$fromCurrency";

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $apiUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($ch);
curl_close($ch);

if (!$response) {
    echo json_encode(['error' => 'Errore nella richiesta API']);
    exit;
}

$data = json_decode($response, true);

if (!isset($data['conversion_rates'][$toCurrency])) {
    echo json_encode(['error' => 'Valuta non supportata']);
    exit;
}

$rate = $data['conversion_rates'][$toCurrency];
$convertedAmount = round($amount * $rate, 2);

echo json_encode([
    'converted' => $convertedAmount,
    'rate' => $rate,
    'symbol' => $toCurrency
]);