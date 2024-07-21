<?= $this->extend('layout') ?>
<?= $this->section('content') ?>
Transaksi <strong><?= $username ?></strong>
<hr>
<div class="table-responsive">
    <!-- Table with stripped rows -->
    <table class="table datatable">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Username</th>
                <th scope="col">Total Harga</th>
                <th scope="col">Alamat</th>
                <th scope="col">Ongkir</th>
                <th scope="col">Status</th>
                <th scope="col"></th>
            </tr>
        </thead>
        <tbody>
            <?php if (!empty($buy)) : ?>
                <?php foreach ($buy as $index => $item) : ?>
                    <tr>
                        <th scope="row"><?= $index + 1 ?></th>
                        <td><?= $item['username'] ?></td>
                        <td><?= number_to_currency($item['total_harga'], 'IDR') ?></td>
                        <td><?= $item['alamat'] ?></td>
                        <td><?= number_to_currency($item['ongkir'], 'IDR') ?></td>
                        <td><?= $item['status'] == 1 ? 'Sudah Selesai' : 'Belum Selesai' ?></td>
                        <td>
                            <!-- Edit Status Button -->
                            <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#ubahStatusModal-<?= $item['id'] ?>">
                                Edit Status
                            </button>
                            <!-- Ubah Status Modal Begin -->
                            <div class="modal fade" id="ubahStatusModal-<?= $item['id'] ?>" tabindex="-1">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Ubah Status</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form action="<?= base_url('transaksi/transaksiedit/' . $item['id']) ?>" method="post">
                                            <?= csrf_field(); ?>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="status">Status</label>
                                                    <select name="status" id="status" class="form-control" required>
                                                        <option value="0" <?= $item['status'] == 0 ? 'selected' : '' ?>>Belum Selesai</option>
                                                        <option value="1" <?= $item['status'] == 1 ? 'selected' : '' ?>>Sudah Selesai</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                                <button type="submit" class="btn btn-primary">Simpan</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- Ubah Status Modal End -->
                        </td>
                    </tr>
                <?php endforeach; ?>
            <?php endif; ?>
        </tbody>
    </table>
    <!-- End Table with stripped rows -->
    <?php if (session()->get('role') == 'admin') : ?>
        <a href="<?= base_url('transaksi/downloadTransactions') ?>" class="btn btn-primary">
            Download Semua Transaksi
        </a>
    <?php endif; ?>
</div>
<?= $this->endSection() ?>
