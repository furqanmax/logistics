<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $table = 'tbl_product';

    protected $fillable = [
        'cat_id',
        'subcat_id',
        'title',
        'price',
        'status',
    ];

    // Relationship with Pcat (tbl_pcat)
    public function productcategory()
    {
        return $this->belongsTo(ProductCategory::class, 'cat_id');
    }

    // Relationship with Subcat (tbl_subcat)
    public function subcategory()
    {
        return $this->belongsTo(SubCategory::class, 'subcat_id');
    }
}
