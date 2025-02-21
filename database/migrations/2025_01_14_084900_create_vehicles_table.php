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
        Schema::create('tbl_vehicle', function (Blueprint $table) {
            $table->id(); // Primary key
            $table->text('title');
            $table->text('img');
            $table->integer('status');
            $table->text('description');
            $table->integer('ukms');
            $table->integer('uprice');
            $table->integer('aprice');
            $table->text('capcity');
            $table->text('size');
            $table->integer('ttime');
            $table->timestamps(); // Adds created_at and updated_at
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tbl_vehicle');
    }
};
