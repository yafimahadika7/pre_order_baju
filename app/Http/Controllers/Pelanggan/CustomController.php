<?php

namespace App\Http\Controllers\Pelanggan;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CustomDesign;

class CustomController extends Controller
{
    public function index()
    {
        return view('pelanggan.custom.index'); // Halaman custom jika ada
    }

    public function store(Request $request)
    {
        $request->validate([
            'kategori' => 'required|string',
            'nama' => 'required|string|max:255',
            'email' => 'required|email',
            'wa' => 'required|string|max:30',
            'file_desain' => 'required|file|mimes:jpg,jpeg,png,pdf|max:20480',
            'ukuran' => 'nullable|array'
        ]);

        // Upload file desain
        if ($request->hasFile('file_desain')) {
            $file = $request->file('file_desain');
            $namaFile = time() . '_' . $file->getClientOriginalName();
            $path = $file->storeAs('desain_custom', $namaFile, 'public');
            $filePath = 'storage/' . $path;
        } else {
            $filePath = null; // fallback, meskipun validasi wajib
        }

        // Simpan ke database
        CustomDesign::create([
            'kategori' => $request->kategori,
            'nama' => $request->nama,
            'email' => $request->email,
            'wa' => $request->wa,
            'ukuran' => json_encode($request->ukuran),
            'file_desain' => $filePath,
        ]);

        return back()->with('success', 'Terima kasih! Desain Anda berhasil dikirim. Kami akan segera menghubungi Anda via WhatsApp atau Email.');
    }

    public function adminView()
    {
        $data = CustomDesign::latest()->get();
        return view('admin.custom.custom', compact('data'));
    }
}