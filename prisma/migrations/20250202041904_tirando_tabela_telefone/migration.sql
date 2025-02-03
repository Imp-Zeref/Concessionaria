/*
  Warnings:

  - You are about to drop the `telefone` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "anuncio" DROP CONSTRAINT "anuncio_telefone_ddd_telefone_numero_fkey";

-- DropIndex
DROP INDEX "anuncio_telefone_ddd_key";

-- DropIndex
DROP INDEX "anuncio_telefone_numero_key";

-- DropTable
DROP TABLE "telefone";
