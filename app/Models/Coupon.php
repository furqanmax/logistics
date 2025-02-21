<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    use HasFactory;

    protected $table = 'tbl_scoupon';

    protected $fillable = [
        'c_img',
        'cdate',
        'c_desc',
        'c_value',
        'c_title',
        'status',
        'ctitle',
        'min_amt',
        'subtitle',
    ];
}
