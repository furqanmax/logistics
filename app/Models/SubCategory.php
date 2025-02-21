<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    use HasFactory;

    protected $table = 'tbl_subcat';

    protected $fillable = [
        'cat_id',
        'title',
        'status',
    ];

    // Define the relationship with the Category model
    public function productCategory()
    {
        return $this->belongsTo(ProductCategory::class, 'cat_id');
    }
}
