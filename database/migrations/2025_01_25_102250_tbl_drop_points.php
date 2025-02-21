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
        Schema::create('tbl_drop_points', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->constrained('tbl_order')->onDelete('cascade'); // Related to orders table
            $table->foreignId('uid')->constrained('tbl_user')->onDelete('cascade'); // Related to users table
            $table->text('drop_address');
            $table->text('drop_lat');
            $table->text('drop_lng');
            $table->text('drop_name');
            $table->text('drop_mobile');
            $table->text('status');
            $table->text('photos')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tbl_drop_points');
    }
};
