<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CountryCode extends Model
{
    use HasFactory;

    protected $table = 'tbl_code';

    protected $fillable = [
        'ccode',
        'status',
    ];
}
