<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rider extends Model
{
    use HasFactory;


    protected $table = 'tbl_rider';

    protected $fillable = [
        'title',
        'rimg',
        'status',
        'rate',
        'lcode',
        'full_address',
        'pincode',
        'landmark',
        'commission',
        'bank_name',
        'ifsc',
        'receipt_name',
        'acc_number',
        'paypal_id',
        'upi_id',
        'email',
        'password',
        'rstatus',
        'mobile',
        'accept',
        'reject',
        'complete',
        'dzone',
        'vehiid',
    ];

    // Relationship with Zone
    public function zone()
    {
        return $this->belongsTo(Zone::class, 'dzone');
    }

    // Relationship with Vehicle
    public function vehicle()
    {
        return $this->belongsTo(Vehicle::class, 'vehiid');
    }
}
