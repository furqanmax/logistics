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
        Schema::create('tbl_cash', function (Blueprint $table) {
            $table->id();
            $table->foreignId('rid')->constrained('tbl_rider')->onDelete('cascade'); // Related to riders table
            $table->integer('amt');
            $table->text('message');
            $table->dateTime('pdate');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tbl_cash');
    }
};
