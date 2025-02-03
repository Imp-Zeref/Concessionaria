/*
  Warnings:

  - You are about to drop the `ace_veiculo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `acessorios` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `foto_veiculo` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[foto]` on the table `anuncio` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `foto` to the `anuncio` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "ace_veiculo" DROP CONSTRAINT "ace_veiculo_id_Acessorio_fkey";

-- DropForeignKey
ALTER TABLE "ace_veiculo" DROP CONSTRAINT "ace_veiculo_id_Veiculo_fkey";

-- DropForeignKey
ALTER TABLE "foto_veiculo" DROP CONSTRAINT "foto_veiculo_id_veiculo_fkey";

-- AlterTable
ALTER TABLE "anuncio" ADD COLUMN     "foto" TEXT NOT NULL;

-- DropTable
DROP TABLE "ace_veiculo";

-- DropTable
DROP TABLE "acessorios";

-- DropTable
DROP TABLE "foto_veiculo";

-- CreateIndex
CREATE UNIQUE INDEX "anuncio_foto_key" ON "anuncio"("foto");
