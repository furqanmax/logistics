<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    use HasFactory;

    protected $table = 'tbl_setting';

    protected $fillable = [
        'webname',
        'weblogo',
        'timezone',
        'currency',
        'pdboy',
        'one_key',
        'one_hash',
        'd_key',
        'd_hash',
        'scredit',
        'rcredit',
        'gkey',
        'vehiid',
        'couvid',
        'kglimit',
        'kgprice',
        'semail',
        'smobile',
    ];
}
