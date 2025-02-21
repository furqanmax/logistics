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
        Schema::create('tbl_rider', function (Blueprint $table) {
            $table->id();
            $table->text('title');
            $table->text('rimg');
            $table->integer('status');
            $table->float('rate');
            $table->string('lcode')->nullable();
            $table->text('full_address');
            $table->string('pincode');
            $table->text('landmark');
            $table->float('commission');
            $table->text('bank_name');
            $table->text('ifsc');
            $table->text('receipt_name');
            $table->text('acc_number');
            $table->text('paypal_id');
            $table->text('upi_id');
            $table->text('email');
            $table->text('password');
            $table->integer('rstatus')->default(1);
            $table->string('mobile');
            $table->integer('accept')->default(0);
            $table->integer('reject')->default(0);
            $table->integer('complete')->default(0);
            $table->foreignId('dzone')->constrained('zones')->onDelete('cascade');
            $table->foreignId('vehiid')->constrained('tbl_vehicle')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tbl_rider');
    }
};
