<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Auth;

use App\Models\User;


class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;


   
    public function callback() {
        $clientId = 'larave-iframe';
        $clientSecret = 'R9QFWQy0m78udlBxxusMHV0GX9bGjJzQ';
        $redirectUri = 'http://192.168.29.93:8999/keycloak/callback';
        $keycloakUrl = 'http://192.168.29.97:8080/realms/master';
    
        // Check if authorization code exists
        $code = request()->query('code');
        if (!$code) {
            abort(400, "Invalid authentication request");
        }
    
        // Exchange authorization code for token
        $response = Http::asForm()->post("$keycloakUrl/protocol/openid-connect/token", [
            'client_id' => $clientId,
            'client_secret' => $clientSecret,
            'code' => $code,
            'redirect_uri' => $redirectUri,
            'grant_type' => 'authorization_code',
        ]);
    
        $tokenResponse = $response->json();
    
        if (!isset($tokenResponse['access_token'])) {
            abort(401, "Failed to authenticate with Keycloak");
        }
    
        // Decode JWT token
        $jwtPayload = json_decode(base64_decode(str_replace('_', '/', str_replace('-', '+', explode('.', $tokenResponse['access_token'])[1]))), true);
    
        if (!isset($jwtPayload['email'])) {
            abort(400, "Failed to retrieve user profile");
        }
    
        $email = $jwtPayload['email'];
    
        // Find or create user with default values
        $user = User::firstOrCreate(
            ['email' => $email],
            [
                'name' => $jwtPayload['name'] ?? 'Unknown User',
                'password' => bcrypt(str()->random(16)), // Generate a random password
                'mobile' => $jwtPayload['mobile'] ?? '888888888',
                'rdate' => now(),
                'status' => 1,
                'ccode' => $jwtPayload['ccode'] ?? '+91',
                'code' => $jwtPayload['code'] ?? '1',
                'wallet' => 0,
                'email_verified_at' => now(),
            ]
        );
    
        // Log in the user
        Auth::login($user);
    
        return redirect('/admin');
    }
    
}
