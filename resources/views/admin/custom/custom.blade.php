<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        body {
            min-height: 100vh;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        .sidebar {
            height: 100vh;
            width: 220px;
            position: fixed;
            left: 0;
            top: 0;
            background-color: #343a40;
            color: white;
            padding-top: 1rem;
            transition: all 0.3s ease;
            z-index: 1000;
        }

        .sidebar.hide {
            left: -220px;
        }

        .sidebar a,
        .sidebar form button {
            color: white;
            padding: 10px 20px;
            display: block;
            text-decoration: none;
            background: none;
            border: none;
            text-align: left;
            width: 100%;
        }

        .sidebar a:hover,
        .sidebar form button:hover {
            background-color: #495057;
        }

        .topbar {
            height: 60px;
            background-color: #f8f9fa;
            padding: 0 1rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-left: 220px;
            transition: margin-left 0.3s ease;
        }

        .topbar.collapsed {
            margin-left: 0;
        }

        .content {
            margin-left: 220px;
            padding: 2rem;
            transition: margin-left 0.3s ease;
        }

        .content.collapsed {
            margin-left: 0;
        }

        .toggle-btn {
            font-size: 24px;
            background: none;
            border: none;
            cursor: pointer;
        }

        @media (max-width: 768px) {
            .sidebar {
                left: -220px;
            }

            .sidebar.show {
                left: 0;
            }

            .topbar,
            .content {
                margin-left: 0 !important;
            }
        }

        #previewContent img,
        #previewContent embed {
            max-width: 100%;
            max-height: 75vh;
            width: auto;
            height: auto;
        }
    </style>
</head>

<body>
    <div class="sidebar" id="sidebar">
        <div class="text-center mb-3">
            <strong>{{ Auth::user()->name }}</strong><br>
            <small class="{{ Auth::user()->role === 'admin' ? 'text-warning' : 'text-white' }}">
                {{ ucfirst(Auth::user()->role) }}
            </small>
        </div>
        @if (in_array(Auth::user()->role, ['admin', 'operation', 'finance', 'produk']))
            <a href="{{ route('admin.dashboard') }}">📊 Dashboard</a>
        @endif

        @if (in_array(Auth::user()->role, ['admin', 'operation']))
            <a href="{{ route('admin.transaksi.index') }}">💳 Transaksi</a>
        @endif

        @if (in_array(Auth::user()->role, ['admin', 'operation']))
            <a href="{{ route('admin.custom.index') }}">🎨 Custom Design</a>
        @endif

        @if (in_array(Auth::user()->role, ['admin', 'produk']))
            <a href="{{ route('admin.produk.index') }}">🛍️ Produk</a>
        @endif

        @if (Auth::user()->role === 'admin')
            <a href="{{ route('admin.users.index') }}">👤 User</a>
        @endif

        @if (Auth::user()->role === 'admin' || Auth::user()->role === 'finance')
            <a href="{{ route('admin.penjualan.index') }}">📈 Penjualan</a>
        @endif

        @if (Auth::user()->role === 'admin' || Auth::user()->role === 'operation')
            <a href="{{ route('admin.tiketing.index') }}">💬 Tiketing</a>
        @endif
        <form method="POST" action="{{ route('logout') }}">
            @csrf
            <button type="submit">🚪 Logout</button>
        </form>
    </div>
    <div class="topbar" id="topbar">
        <button class="toggle-btn" onclick="toggleSidebar()">☰</button>
        <span>Dashboard</span>
    </div>

    <!-- Content -->
    <div class="content" id="main-content">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4 class="mb-0">📋 Daftar Permintaan Custom Design</h4>

            <div class="d-flex gap-2">
                <form method="GET" action="#" class="d-flex align-items-center">
                    <select name="kategori" class="form-select form-select-sm me-2" onchange="this.form.submit()">
                        <option value="">Semua Kategori</option>
                        <option value="dress" {{ request('kategori') == 'dress' ? 'selected' : '' }}>Dress</option>
                        <option value="oneset" {{ request('kategori') == 'oneset' ? 'selected' : '' }}>One Set</option>
                        <option value="shirt" {{ request('kategori') == 'shirt' ? 'selected' : '' }}>Shirt</option>
                        <option value="blouse" {{ request('kategori') == 'blouse' ? 'selected' : '' }}>Blouse</option>
                        <option value="pants" {{ request('kategori') == 'pants' ? 'selected' : '' }}>Pants</option>
                        <option value="skirt" {{ request('kategori') == 'skirt' ? 'selected' : '' }}>Skirt</option>
                        <option value="blazer" {{ request('kategori') == 'blazer' ? 'selected' : '' }}>Blazer</option>
                        <option value="tunic" {{ request('kategori') == 'tunic' ? 'selected' : '' }}>Tunic</option>
                        <option value="kebaya" {{ request('kategori') == 'kebaya' ? 'selected' : '' }}>Kebaya</option>
                    </select>
                </form>

                <form id="pdfForm" method="POST" action="{{ route('admin.custom.download_pdf') }}" target="_blank">
                    @csrf
                    <input type="hidden" name="selected_ids" id="selected_ids">
                    <button type="submit" class="btn btn-danger btn-sm" disabled id="downloadBtn">
                        <i class="bi bi-file-earmark-pdf"></i> Download PDF
                    </button>
                </form>
            </div>
        </div>
        <table class="table table-bordered table-striped">
            <thead class="table-dark text-center">
                <tr>
                    <th><input type="checkbox" id="selectAll"></th>
                    <th>No</th>
                    <th>Nama</th>
                    <th>Email</th>
                    <th>WhatsApp</th>
                    <th>Kategori</th>
                    <th>Ukuran</th>
                    <th>File Desain</th>
                    <th>Status</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($data as $item)
                    <tr>
                        <td class="text-center align-middle">
                            <input type="checkbox" class="row-check" name="selected[]" value="{{ $item->id }}">
                        </td>
                        <td class="text-center align-middle">{{ $loop->iteration }}</td>
                        <td class="text-center align-middle">{{ $item->nama }}</td>
                        <td class="text-center align-middle">{{ $item->email }}</td>
                        <td class="text-center align-middle">{{ $item->wa }}</td>
                        <td class="text-center align-middle">{{ ucfirst($item->kategori) }}</td>
                        <td class="align-middle text-start">
                            @php
                                $ukuran = json_decode($item->ukuran, true);
                            @endphp
                            @if ($ukuran && is_array($ukuran))
                                <ul class="mb-0 ps-3">
                                    @foreach ($ukuran as $label => $value)
                                        <li><strong>{{ ucwords(str_replace('_', ' ', $label)) }}:</strong> {{ $value }}</li>
                                    @endforeach
                                </ul>
                            @else
                                <em class="text-muted">-</em>
                            @endif
                        </td>
                        <td class="text-center align-middle">
                            @if ($item->file_desain)
                                <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal"
                                    data-bs-target="#modalDesain" data-url="{{ asset($item->file_desain) }}">
                                    Lihat
                                </button>
                            @else
                                <em class="text-muted">Tidak ada</em>
                            @endif
                        </td>
                        <td class="text-center align-middle">
                            <select onchange="ubahStatus({{ $item->id }}, this.value)" class="form-select form-select-sm">
                                <option value="pending" {{ $item->status === 'pending' ? 'selected' : '' }}>⏳ Pending</option>
                                <option value="sukses" {{ $item->status === 'sukses' ? 'selected' : '' }}>✅ Sukses</option>
                                <option value="gagal" {{ $item->status === 'gagal' ? 'selected' : '' }}>❌ Gagal</option>
                            </select>
                        </td>
                        <td class="align-middle">
                            <div class="d-flex justify-content-center align-items-center gap-2">
                                @php
                                    $wa = ltrim(preg_replace('/[^0-9]/', '', $item->wa), '0');
                                    $wa = '62' . $wa;
                                @endphp

                                <a href="https://wa.me/{{ $wa }}"
                                    class="btn btn-sm btn-success d-flex align-items-center justify-content-center"
                                    style="width: 32px; height: 32px;" target="_blank" title="Kirim WhatsApp">
                                    <i class="bi bi-whatsapp"></i>
                                </a>

                                <a href="mailto:{{ $item->email }}"
                                    class="btn btn-sm btn-primary d-flex align-items-center justify-content-center"
                                    style="width: 32px; height: 32px;" title="Kirim Email">
                                    <i class="bi bi-envelope-fill"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    <!-- Modal Preview Desain -->
    <div class="modal fade" id="modalDesain" tabindex="-1" aria-labelledby="modalDesainLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" style="max-width: 90vw;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalDesainLabel">Preview Desain</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Tutup"></button>
                </div>
                <div class="modal-body text-center" id="previewContainer">
                    <div id="previewContent" style="display: inline-block; max-width: 100%; max-height: 80vh;">
                        <em>Memuat desain...</em>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        function ubahStatus(id, statusBaru) {
            fetch(`/admin/custom/${id}/ubah-status`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                },
                body: JSON.stringify({ status: statusBaru })
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // Tampilkan notifikasi sukses (opsional pakai toast atau alert)
                        console.log(data.message);
                    } else {
                        alert('Gagal mengubah status.');
                    }
                })
                .catch(() => alert('Terjadi kesalahan pada koneksi.'));
        }
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const modal = document.getElementById('modalDesain');
            modal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget;
                const url = button.getAttribute('data-url');
                const ext = url.split('.').pop().toLowerCase();

                let content = '';
                if (['jpg', 'jpeg', 'png', 'webp'].includes(ext)) {
                    content = `<img src="${url}" class="img-fluid" alt="Desain Pelanggan">`;
                } else if (ext === 'pdf') {
                    content = `<embed src="${url}" type="application/pdf" width="100%" height="600px" />`;
                } else {
                    content = `<p class="text-danger">Format file tidak didukung.</p>`;
                }

                document.getElementById('previewContent').innerHTML = content;
            });
        });
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const checkboxes = document.querySelectorAll('.row-check');
            const downloadBtn = document.getElementById('downloadBtn');
            const selectedIdsInput = document.getElementById('selected_ids');

            function updateDownloadBtnState() {
                const selected = Array.from(checkboxes).filter(cb => cb.checked).map(cb => cb.value);
                downloadBtn.disabled = selected.length === 0;
                selectedIdsInput.value = selected.join(',');
            }

            checkboxes.forEach(cb => {
                cb.addEventListener('change', updateDownloadBtnState);
            });

            document.getElementById('selectAll').addEventListener('change', function () {
                checkboxes.forEach(cb => cb.checked = this.checked);
                updateDownloadBtnState();
            });
        });
    </script>

    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const content = document.getElementById('main-content');
            const topbar = document.getElementById('topbar');
            sidebar.classList.toggle('hide');
            content.classList.toggle('collapsed');
            topbar.classList.toggle('collapsed');
        }
    </script>
</body>

</html>