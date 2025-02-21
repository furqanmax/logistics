<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WalletReport extends Model
{
    use HasFactory;

     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wallet_report';

    protected $fillable = [
        'uid',
        'message',
        'status',
        'amt',
    ];

    /**
     * Get the related user.
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'uid');
    }
}
