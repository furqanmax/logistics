<?php

use Illuminate\Support\Facades\Route;
// use App\Filament\Pages\Settings;
use App\Http\Controllers\Controller;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


// Route::get('/keycloak/callback', function () {
//     return view('welcome');
// });

Route::get('/keycloak/callback', [Controller::class, 'callback']);


// Settings::route('/settings', 'settings');