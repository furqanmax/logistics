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
        Schema::create('tbl_payment_list', function (Blueprint $table) {
            $table->id();
            $table->text('title')->charset('utf8mb3')->collation('utf8mb3_general_ci');
            $table->text('img');
            $table->text('attributes');
            $table->integer('status')->default(1);
            $table->text('subtitle')->nullable();
            $table->integer('p_show');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tbl_payment_list');
    }
};
