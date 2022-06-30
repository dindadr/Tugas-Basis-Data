<?php include "layout/_header.php"; ?>

<div class="container">
    <h1 class="text-center my-4">Data Obat</h1>

    <table class="table table-bordered table-hover">
        <thead>
            <tr class="text-center">
                <th>No</th>
                <th>Nama Obat</th>
            </tr>
        </thead>

        <tbody>
            <?php
            $no = 1;
            $query = "SELECT * FROM obat";
            $sql = mysqli_query($koneksi, $query);

            while ($obat = mysqli_fetch_array($sql)) {
            ?>
                <tr>
                    <td class="text-center"><?= $no++ ?></td>
                    <td><?= $obat['nama_obat'] ?></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
</div>


<?php include "layout/_footer.php"; ?>