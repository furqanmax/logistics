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
        Schema::create('tbl_subcat', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cat_id')->constrained('tbl_pcat')->onDelete('cascade'); // Foreign key to tbl_category
            $table->text('title');
            $table->integer('status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tbl_subcat');
    }
};
