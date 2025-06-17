<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomDesign extends Model
{
    protected $table = 'custom_designs'; // optional kalau nama model sama dengan tabel

    protected $fillable = ['kategori', 'nama', 'email', 'wa', 'ukuran', 'file_desain'];

    protected $casts = [
        'ukuran' => 'array',
    ];
}