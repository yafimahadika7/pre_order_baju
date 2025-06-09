    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Manajemen Tiketing</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
            .sidebar a, .sidebar form button {
                color: white;
                padding: 10px 20px;
                display: block;
                text-decoration: none;
                background: none;
                border: none;
                text-align: left;
                width: 100%;
            }
            .sidebar a:hover, .sidebar form button:hover {
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
            chat-container {
                padding: 1rem;
                background: #f8f9fa;
                min-height: 300px;
                max-height: 500px;
                overflow-y: auto;
                border-radius: 12px;
            }
            .bubble {
                max-width: 65%;
                padding: 10px 16px;
                margin: 8px 0;
                border-radius: 18px;
                font-size: 15px;
                line-height: 1.4;
                display: inline-block;
                position: relative;
                word-break: break-word;
            }
            .bubble-admin {
                background: #007bff;
                color: #fff;
                margin-left: auto;
                text-align: right;
                border-bottom-right-radius: 4px;
                margin-right: 10px;
            }
            .bubble-user {
                background: #e4e6eb;
                color: #222;
                margin-right: auto;
                text-align: left;
                border-bottom-left-radius: 4px;
                margin-left: 10px;
            }
            .chat-meta {
                font-size: 11px;
                color: #888;
                margin: 2px 12px 0 12px;
            }
            @media (max-width: 768px) {
                .sidebar {
                    left: -220px;
                }
                .sidebar.show {
                    left: 0;
                }
                .topbar, .content {
                    margin-left: 0 !important;
                }
            }
        </style>
    </head>
    <body>

        <!-- Sidebar -->
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

        <!-- Topbar -->
        <div class="topbar" id="topbar">
            <button class="toggle-btn" onclick="toggleSidebar()">☰</button>
            <span>Manajemen Tiketing</span>
        </div>
        
        <!-- Main Content -->
        <div class="content" id="main-content">
            <div class="container">
                <h3 class="mb-4">Daftar Tiket Komplain</h3>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nama</th>
                            <th>Kontak</th>
                            <th>Topik</th>
                            <th>Status</th>
                            <th>Tanggal</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($komplains as $komplain)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $komplain->nama }}</td>
                            <td>{{ $komplain->kontak }}</td>
                            <td>{{ $komplain->topik }}</td>
                            <td>
                                <span class="badge bg-{{ $komplain->status == 'closed' ? 'secondary' : 'success' }}">
                                    {{ ucfirst($komplain->status) }}
                                </span>
                            </td>
                            <td>{{ $komplain->created_at->format('d/m/Y H:i') }}</td>
                            <td>
                                <a href="{{ route('admin.tiketing.show', $komplain->id) }}" class="btn btn-sm btn-primary">
                                    Lihat Chat
                                </a>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="7" class="text-center">Belum ada tiket komplain.</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>

        <!-- JavaScript -->
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