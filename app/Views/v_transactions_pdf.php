<!DOCTYPE html>
<html>
<head>
    <title>Transactions Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
            text-align: left;
        }
        .header {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Data Transaksi</h1>
        <p>Date Generated: <?= date('d F Y, H:i:s') ?></p>
    </div>
    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Username</th>
                <th>Total Harga</th>
                <th>Alamat</th>
                <th>Ongkir</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($transactions as $index => $transaction) : ?>
                <tr>
                    <td><?= $index + 1 ?></td>
                    <td><?= $transaction['username'] ?></td>
                    <td><?= number_to_currency($transaction['total_harga'], 'IDR') ?></td>
                    <td><?= $transaction['alamat'] ?></td>
                    <td><?= number_to_currency($transaction['ongkir'], 'IDR') ?></td>
                    <td><?= $transaction['status'] == 1 ? 'Sudah Selesai' : 'Belum Selesai' ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>
