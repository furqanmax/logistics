<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cash extends Model
{
    use HasFactory;


    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'tbl_cash';


    protected $fillable = [
        'rid',
        'amt',
        'message',
        'pdate',
    ];

    /**
     * Get the related rider.
     */
    public function rider()
    {
        return $this->belongsTo(Rider::class, 'rid');
    }
}
