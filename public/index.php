<?php

use Illuminate\Contracts\Http\Kernel;
use Illuminate\Http\Request;

define('LARAVEL_START', microtime(true));

/*
|--------------------------------------------------------------------------
| Check If The Application Is Under Maintenance
|--------------------------------------------------------------------------
|
| If the application is in maintenance / demo mode via the "down" command
| we will load this file so that any pre-rendered content can be shown
| instead of starting the framework, which could cause an exception.
|
*/

if (file_exists($maintenance = __DIR__.'/../storage/framework/maintenance.php')) {
    require $maintenance;
}

/*
|--------------------------------------------------------------------------
| Register The Auto Loader
|--------------------------------------------------------------------------
|
| Composer provides a convenient, automatically generated class loader for
| this application. We just need to utilize it! We'll simply require it
| into the script here so we don't need to manually load our classes.
|
*/

require __DIR__.'/../vendor/autoload.php';

/*
|--------------------------------------------------------------------------
| Run The Application
|--------------------------------------------------------------------------
|
| Once we have the application, we can handle the incoming request using
| the application's HTTP kernel. Then, we will send the response back
| to this client's browser, allowing them to enjoy our application.
|
*/

$app = require_once __DIR__.'/../bootstrap/app.php';


if ($_SERVER['REQUEST_URI'] === '/keycloak/callback') {

    // echo 'in callback';
    // exit();
    $clientId = 'larave-iframe';
    $clientSecret = 'R9QFWQy0m78udlBxxusMHV0GX9bGjJzQ';
    $redirectUri = 'http://192.168.29.93:8999/keycloak/callback';
    $keycloakUrl = 'http://192.168.29.97:8080/realms/master';

    // Check if authorization code exists
    $code = $_GET['code'] ?? null;
    if (!$code) {
        die("Invalid authentication request");
    }

    // Exchange authorization code for token
    $tokenResponse = file_get_contents("$keycloakUrl/protocol/openid-connect/token", false, stream_context_create([
        'http' => [
            'method' => 'POST',
            'header' => "Content-Type: application/x-www-form-urlencoded",
            'content' => http_build_query([
                'client_id' => $clientId,
                'client_secret' => $clientSecret,
                'code' => $code,
                'redirect_uri' => $redirectUri,
                'grant_type' => 'authorization_code'
            ]),
        ]
    ]));

    $tokenData = json_decode($tokenResponse, true);

    if (!isset($tokenData['access_token'])) {
        die("Failed to authenticate with Keycloak");
    }

    echo $tokenData;

    exit();
}


if ($_SERVER['REQUEST_URI'] === '/keycloak/validate-token') {
    // echo $_SERVER['REQUEST_URI'];
    $accessToken = $_GET['token'] ?? null;
    if (!$accessToken) {
        die("No token provided");
    }

    // Decode token to extract user info
    $jwtParts = explode('.', $accessToken);
    if (count($jwtParts) !== 3) {
        die("Invalid token format");
    }

    $payload = json_decode(base64_decode($jwtParts[1]), true);
    $username = $payload['preferred_username'] ?? null;

    if (!$username) {
        die("Invalid token: missing username");
    }

    $_SESSION['user_id'] = $username;
    header("Location: /admin");
    exit();
}

if ($_SERVER['REQUEST_URI'] === '/') {
    // echo $_SERVER['REQUEST_URI'];
    $clientId = 'larave-iframe';
    $redirectUri = 'http://192.168.29.93:8999/keycloak/callback';
    $authUrl = "http://192.168.29.97:8080/realms/master/protocol/openid-connect/auth?"
        . http_build_query([
            'client_id' => $clientId,
            'redirect_uri' => $redirectUri,
            'response_type' => 'code',
            'scope' => 'openid profile email'
        ]);
    header("Location: $authUrl");
    exit();
}

$kernel = $app->make(Kernel::class);

$response = $kernel->handle(
    $request = Request::capture()
)->send();

$kernel->terminate($request, $response);
