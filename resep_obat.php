<?php include "layout/_header.php"; ?>

<div class="container">
    <h1 class="text-center my-4">Data Resep Obat</h1>

    <table class="table table-bordered table-hover">
        <thead>
            <tr class="text-center">
                <th>No</th>
                <th>ID Resep</th>
                <th>ID Berobat</th>
                <th>Nama Obat</th>
            </tr>
        </thead>

        <tbody>
            <?php
            $no = 1;
            $query = "SELECT * FROM resep_obat ";
            $query .= "INNER JOIN berobat ON resep_obat.id_berobat = berobat.id_berobat ";
            $query .= "INNER JOIN obat ON resep_obat.id_obat = obat.id_obat ";

            $sql = mysqli_query($koneksi, $query);

            while ($resep_obat = mysqli_fetch_array($sql)) {
            ?>
                <tr>
                    <td class="text-center"><?= $no++ ?></td>
                    <td class="text-center"><?= $resep_obat['id_resep'] ?></td>
                    <td class="text-center"><?= $resep_obat['id_berobat'] ?></td>
                    <td><?= $resep_obat['nama_obat'] ?></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
</div>


<?php include "layout/_footer.php"; ?>