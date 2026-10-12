<?php
header('Content-Type: application/json');

$config = file_exists(__DIR__ . '/config.php') ? require __DIR__ . '/config.php' : [];
$api_key = $config['serpapi_key'] ?? getenv('SERPAPI_KEY'); // chiave in config.php (vedi config.example.php)

if (empty($api_key)) {
    echo json_encode(['error' => 'Chiave SerpApi non configurata']);
    exit;
}
$query = isset($_GET['q']) ? urlencode($_GET['q']) : '';

if (empty($query)) {
    echo json_encode(['error' => 'Query mancante']);
    exit;
}

$url = 'https://serpapi.com/search?' . http_build_query([
    'engine' => 'google_shopping',
    'q' => $query,
    'gl' => 'it',
    'hl' => 'it',
    'api_key' => $api_key
]);

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

$response = curl_exec($ch);

if (curl_errno($ch)) {
    echo json_encode(['error' => 'Errore nella richiesta: ' . curl_error($ch)]);
    curl_close($ch);
    exit;
}

$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

if ($http_code !== 200) {
    echo json_encode(['error' => 'Errore HTTP: ' . $http_code]);
    exit;
}

echo $response;
?>