<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vehicle extends Model
{
    use HasFactory;

     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'tbl_vehicle';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'title',
        'img',
        'status',
        'description',
        'ukms',
        'uprice',
        'aprice',
        'capcity',
        'size',
        'ttime',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'status' => 'integer',
        'ukms' => 'integer',
        'uprice' => 'integer',
        'aprice' => 'integer',
        'ttime' => 'integer',
    ];
}
