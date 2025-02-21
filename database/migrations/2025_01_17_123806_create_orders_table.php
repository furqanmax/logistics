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
        Schema::create('tbl_order', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('uid');
            $table->unsignedBigInteger('rid')->default(0);
            $table->unsignedBigInteger('cat_id');
            $table->unsignedBigInteger('dzone');
            $table->unsignedBigInteger('vehicleid');
            $table->text('pick_address');
            $table->text('pick_lat');
            $table->text('pick_lng');
            $table->float('subtotal');
            $table->float('o_total');
            $table->unsignedBigInteger('cou_id');
            $table->float('cou_amt');
            $table->text('trans_id');
            $table->enum('o_status', ['Pending', 'Processing', 'On Route', 'Completed', 'Cancelled'])->default('Pending');
            $table->float('dcommission')->default(0);
            $table->float('wall_amt')->nullable();
            $table->unsignedBigInteger('p_method_id');
            $table->dateTime('odate');
            $table->text('rlats')->nullable();
            $table->text('rlongs')->nullable();
            $table->dateTime('delivertime')->nullable();

            $table->timestamps();

            // Foreign key constraints (add as needed)
            // $table->foreign('uid')->references('id')->on('users')->onDelete('cascade');
            // $table->foreign('rid')->references('id')->on('riders')->onDelete('cascade');
            // Add others as required
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tbl_order');
    }
};
