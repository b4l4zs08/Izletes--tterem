/*
  Warnings:

  - Added the required column `ar` to the `etelek` table without a default value. This is not possible if the table is not empty.
  - Added the required column `kategoria` to the `etelek` table without a default value. This is not possible if the table is not empty.
  - Added the required column `leiras` to the `etelek` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nev` to the `etelek` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ar` to the `rendelesek` table without a default value. This is not possible if the table is not empty.
  - Added the required column `datum` to the `rendelesek` table without a default value. This is not possible if the table is not empty.
  - Added the required column `etelid` to the `rendelesek` table without a default value. This is not possible if the table is not empty.
  - Added the required column `felhasznalo_id` to the `rendelesek` table without a default value. This is not possible if the table is not empty.
  - Added the required column `megjegyzes` to the `rendelesek` table without a default value. This is not possible if the table is not empty.
  - Added the required column `megjegyzes` to the `velemenyek` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rendeles_id` to the `velemenyek` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `etelek` ADD COLUMN `ar` INTEGER NOT NULL,
    ADD COLUMN `kategoria` VARCHAR(191) NOT NULL,
    ADD COLUMN `leiras` VARCHAR(191) NOT NULL,
    ADD COLUMN `nev` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `rendelesek` ADD COLUMN `ar` INTEGER NOT NULL,
    ADD COLUMN `datum` DATETIME(3) NOT NULL,
    ADD COLUMN `etelid` INTEGER NOT NULL,
    ADD COLUMN `felhasznalo_id` INTEGER NOT NULL,
    ADD COLUMN `megjegyzes` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `velemenyek` ADD COLUMN `megjegyzes` VARCHAR(191) NOT NULL,
    ADD COLUMN `rendeles_id` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `rendelesek` ADD CONSTRAINT `rendelesek_felhasznalo_id_fkey` FOREIGN KEY (`felhasznalo_id`) REFERENCES `felhasznalok`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `rendelesek` ADD CONSTRAINT `rendelesek_etelid_fkey` FOREIGN KEY (`etelid`) REFERENCES `etelek`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `velemenyek` ADD CONSTRAINT `velemenyek_rendeles_id_fkey` FOREIGN KEY (`rendeles_id`) REFERENCES `rendelesek`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
