<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CustomDesign;
use Barryvdh\DomPDF\Facade\Pdf;

class CustomAdminController extends Controller
{
    /**
     * Menampilkan daftar custom design.
     */
    public function index(Request $request)
    {
        // Filter berdasarkan kategori jika tersedia
        $kategori = $request->input('kategori');
        $query = CustomDesign::query();

        if ($kategori) {
            $query->where('kategori', $kategori);
        }

        $data = $query->orderBy('created_at', 'desc')->get();

        return view('admin.custom.custom', compact('data', 'kategori'));
    }

    /**
     * Update status custom design (sukses/gagal).
     */
    public function updateStatus(Request $request, $id)
    {
        $request->validate([
            'status' => 'required|in:pending,sukses,gagal',
        ]);

        $custom = CustomDesign::findOrFail($id);
        $custom->status = $request->status;
        $custom->save();

        return response()->json([
            'success' => true,
            'message' => 'Status berhasil diperbarui.',
            'status' => $custom->status
        ]);
    }

    public function ubahStatus($id, Request $request)
    {
        $status = $request->status;

        // Jika Anda pakai DB query langsung
        \DB::update("UPDATE custom_designs SET status = ? WHERE id = ?", [$status, $id]);

        return response()->json([
            'success' => true,
            'message' => 'Status berhasil diperbarui.',
            'status' => $status
        ]);
    }
    public function downloadPdf(Request $request)
    {
        $ids = explode(',', $request->selected_ids);
        $data = CustomDesign::whereIn('id', $ids)->get();

        $pdf = Pdf::loadView('admin.custom.pdf', compact('data'))->setPaper('a4');
        return $pdf->download('permintaan_custom_design.pdf');
    }
}