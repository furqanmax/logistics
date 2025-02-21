<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DropPoint extends Model
{
    use HasFactory;


     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'tbl_drop_points';

    protected $fillable = [
        'order_id',
        'uid',
        'drop_address',
        'drop_lat',
        'drop_lng',
        'drop_name',
        'drop_mobile',
        'status',
        'photos',
    ];

    /**
     * Get the related order.
     */
    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }

    /**
     * Get the related user.
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'uid');
    }
}
