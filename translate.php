<?php
header('Content-Type: application/json');

$text = $_GET['text'] ?? '';
$to = $_GET['to'] ?? '';
$from = 'it'; // Lingua sorgente fissa in italiano

if (!$text || !$to) {
    echo json_encode(['error' => 'Parametri mancanti']);
    exit;
}

$encodedText = urlencode($text);
$url = "https://api.mymemory.translated.net/get?q=$encodedText&langpair=$from|$to";

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($ch);
curl_close($ch);

if ($response) {
    echo $response;
} else {
    echo json_encode(['error' => 'Errore nella richiesta alla API MyMemory']);
}