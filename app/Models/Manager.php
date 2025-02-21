<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Manager extends Model
{
    use HasFactory;

    protected $table = 'tbl_manager';

    protected $fillable = [
        'name',
        'img',
        'status',
        'mobile',
        'email',
        'password',
        'zone_id',
    ];

    /**
     * Get the zone associated with the manager.
     */
    public function zone()
    {
        return $this->belongsTo(Zone::class, 'zone_id');
    }
}
