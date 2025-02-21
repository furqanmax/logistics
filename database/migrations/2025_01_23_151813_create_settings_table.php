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
        Schema::create('tbl_setting', function (Blueprint $table) {
            $table->id();
            $table->text('webname')->charset('utf8mb3')->collation('utf8mb3_general_ci');
            $table->text('weblogo');
            $table->text('timezone');
            $table->text('currency')->charset('utf8mb3')->collation('utf8mb3_general_ci');
            $table->integer('pdboy');
            $table->text('one_key');
            $table->text('one_hash');
            $table->text('d_key');
            $table->text('d_hash');
            $table->integer('scredit');
            $table->integer('rcredit');
            $table->text('gkey');
            $table->integer('vehiid');
            $table->integer('couvid');
            $table->integer('kglimit');
            $table->float('kgprice');
            $table->text('semail');
            $table->text('smobile');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tbl_setting');
    }
};
