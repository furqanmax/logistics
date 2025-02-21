<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('tbl_user', function (Blueprint $table) {
            $table->id(); // Auto-incrementing primary key
            $table->string('name', 255); // Name field
            $table->string('email', 255)->unique(); // Email with unique constraint
            $table->string('mobile', 20); // Mobile number
            $table->string('password'); // Password field
            $table->dateTime('rdate'); // Registration date
            $table->integer('status')->default(1); // Status with default value
            $table->string('ccode', 10); // Country code
            $table->integer('code'); // Code
            $table->integer('refercode')->nullable(); // Referral code (nullable)
            $table->integer('wallet')->default(0); // Wallet balance with default value
            $table->timestamp('email_verified_at')->nullable(); // Email verification timestamp
            $table->string('remember_token', 100)->nullable(); // Remember token
            $table->timestamps(); // Created_at and updated_at timestamps
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tbl_user');
    }
};
