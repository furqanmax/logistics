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
        Schema::create('tbl_manager', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('img');
            $table->boolean('status');
            $table->string('mobile');
            $table->string('email')->unique();
            $table->string('password');
            $table->foreignId('zone_id')->constrained('zones')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tbl_manager');
    }
};
