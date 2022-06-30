<?php include "layout/_header.php"; ?>

<div class="container">
    <h1 class="text-center my-4">Data Pasien</h1>

    <table class="table table-bordered table-hover">
        <thead>
            <tr class="text-center">
                <th>No</th>
                <th>Nama Pasien</th>
                <th>Jenis Kelamin</th>
                <th>Umur</th>
            </tr>
        </thead>

        <tbody>
            <?php
            $no = 1;
            $query = "SELECT * FROM pasien";
            $sql = mysqli_query($koneksi, $query);

            while ($pasien = mysqli_fetch_array($sql)) {
            ?>
                <tr>
                    <td class="text-center"><?= $no++ ?></td>
                    <td><?= $pasien['nama_pasien'] ?></td>
                    <td class="text-center"><?= $pasien['jenis_kelamin'] ?></td>
                    <td class="text-center"><?= $pasien['umur'] ?></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
</div>


<?php include "layout/_footer.php"; ?>