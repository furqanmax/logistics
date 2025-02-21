<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ParcelData extends Model
{
    use HasFactory;

    protected $fillable = [
        'data',
    ];
}
