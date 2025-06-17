<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Permintaan Custom Design</title>
    <style>
        body {
            font-family: DejaVu Sans, sans-serif;
            font-size: 12px;
            margin: 0;
            padding: 0 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            margin-bottom: 10px;
            border-collapse: collapse;
        }

        td {
            padding: 4px 6px;
            vertical-align: top;
        }

        .ukuran-list {
            padding-left: 16px;
            margin: 0;
        }

        img {
            margin-top: 10px;
            max-width: 300px;
            height: auto;
        }

        .not-found {
            font-style: italic;
            color: #888;
        }
    </style>
</head>
<body>

    <h2>Permintaan Custom Design</h2>

    @foreach ($data as $index => $item)
        <div class="section" style="{{ $loop->last ? '' : 'page-break-after: always;' }}">
            <table>
                <tr>
                    <td><strong>No</strong></td>
                    <td>{{ $index + 1 }}</td>
                </tr>
                <tr>
                    <td><strong>Nama</strong></td>
                    <td>{{ $item->nama }}</td>
                </tr>
                <tr>
                    <td><strong>Email</strong></td>
                    <td>{{ $item->email }}</td>
                </tr>
                <tr>
                    <td><strong>WhatsApp</strong></td>
                    <td>{{ $item->wa }}</td>
                </tr>
                <tr>
                    <td><strong>Kategori</strong></td>
                    <td>{{ ucfirst($item->kategori) }}</td>
                </tr>
                <tr>
                    <td><strong>Ukuran</strong></td>
                    <td>
                        @php $ukuran = json_decode($item->ukuran, true); @endphp
                        @if ($ukuran && is_array($ukuran))
                            <ul class="ukuran-list">
                                @foreach ($ukuran as $label => $value)
                                    <li><strong>{{ ucwords(str_replace('_', ' ', $label)) }}:</strong> {{ $value }}</li>
                                @endforeach
                            </ul>
                        @else
                            <span class="not-found">Tidak tersedia</span>
                        @endif
                    </td>
                </tr>
                <tr>
                    <td><strong>Desain</strong></td>
                    <td>
                        @if ($item->file_desain && file_exists(public_path($item->file_desain)))
                            <img src="{{ public_path($item->file_desain) }}" alt="Desain">
                        @else
                            <span class="not-found">Tidak tersedia</span>
                        @endif
                    </td>
                </tr>
            </table>
        </div>
    @endforeach

</body>
</html>
