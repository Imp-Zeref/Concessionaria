/*
  Warnings:

  - You are about to drop the `AceVeiculo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Acessorios` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Anuncio` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Cidade` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Estado` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `FotoVeiculo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `InteresseCompra` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Marca` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Modelo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Telefone` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Usuario` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Veiculo` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "combustivel" AS ENUM ('g', 'a', 'd', 'e', 'h', 'f');

-- DropForeignKey
ALTER TABLE "AceVeiculo" DROP CONSTRAINT "AceVeiculo_id_Acessorio_fkey";

-- DropForeignKey
ALTER TABLE "AceVeiculo" DROP CONSTRAINT "AceVeiculo_id_Veiculo_fkey";

-- DropForeignKey
ALTER TABLE "Anuncio" DROP CONSTRAINT "Anuncio_id_cidade_fkey";

-- DropForeignKey
ALTER TABLE "Anuncio" DROP CONSTRAINT "Anuncio_id_usuario_fkey";

-- DropForeignKey
ALTER TABLE "Anuncio" DROP CONSTRAINT "Anuncio_id_veiculo_fkey";

-- DropForeignKey
ALTER TABLE "Anuncio" DROP CONSTRAINT "Anuncio_telefone_ddd_telefone_numero_fkey";

-- DropForeignKey
ALTER TABLE "Cidade" DROP CONSTRAINT "Cidade_id_estado_fkey";

-- DropForeignKey
ALTER TABLE "FotoVeiculo" DROP CONSTRAINT "FotoVeiculo_id_veiculo_fkey";

-- DropForeignKey
ALTER TABLE "InteresseCompra" DROP CONSTRAINT "InteresseCompra_cpf_comprador_fkey";

-- DropForeignKey
ALTER TABLE "InteresseCompra" DROP CONSTRAINT "InteresseCompra_id_veiculo_fkey";

-- DropForeignKey
ALTER TABLE "Modelo" DROP CONSTRAINT "Modelo_id_marca_fkey";

-- DropForeignKey
ALTER TABLE "Veiculo" DROP CONSTRAINT "Veiculo_id_modelo_fkey";

-- DropTable
DROP TABLE "AceVeiculo";

-- DropTable
DROP TABLE "Acessorios";

-- DropTable
DROP TABLE "Anuncio";

-- DropTable
DROP TABLE "Cidade";

-- DropTable
DROP TABLE "Estado";

-- DropTable
DROP TABLE "FotoVeiculo";

-- DropTable
DROP TABLE "InteresseCompra";

-- DropTable
DROP TABLE "Marca";

-- DropTable
DROP TABLE "Modelo";

-- DropTable
DROP TABLE "Telefone";

-- DropTable
DROP TABLE "Usuario";

-- DropTable
DROP TABLE "Veiculo";

-- DropEnum
DROP TYPE "Combustivel";

-- CreateTable
CREATE TABLE "marca" (
    "id" VARCHAR(20) NOT NULL,

    CONSTRAINT "marca_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "modelo" (
    "nome" VARCHAR(20) NOT NULL,
    "ano" INTEGER NOT NULL,
    "versao" VARCHAR(20) NOT NULL,
    "combustivel" "combustivel" NOT NULL,
    "cambio" "Cambio" NOT NULL,
    "qtd_lugares" INTEGER NOT NULL,
    "cv" INTEGER NOT NULL,
    "cc" INTEGER NOT NULL,
    "portas" INTEGER,
    "id_marca" TEXT NOT NULL,

    CONSTRAINT "modelo_pkey" PRIMARY KEY ("nome")
);

-- CreateTable
CREATE TABLE "acessorios" (
    "descricao" VARCHAR(100) NOT NULL,

    CONSTRAINT "acessorios_pkey" PRIMARY KEY ("descricao")
);

-- CreateTable
CREATE TABLE "ace_veiculo" (
    "id_Acessorio" TEXT NOT NULL,
    "id_Veiculo" INTEGER NOT NULL,

    CONSTRAINT "ace_veiculo_pkey" PRIMARY KEY ("id_Acessorio","id_Veiculo")
);

-- CreateTable
CREATE TABLE "veiculo" (
    "id" SERIAL NOT NULL,
    "placa" VARCHAR(7) NOT NULL,
    "km" INTEGER NOT NULL,
    "gnv" BOOLEAN NOT NULL,
    "cor" VARCHAR(20) NOT NULL,
    "novo" BOOLEAN NOT NULL,
    "id_modelo" VARCHAR(20) NOT NULL,

    CONSTRAINT "veiculo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "foto_veiculo" (
    "link" TEXT NOT NULL,
    "id_veiculo" INTEGER NOT NULL,

    CONSTRAINT "foto_veiculo_pkey" PRIMARY KEY ("link")
);

-- CreateTable
CREATE TABLE "estado" (
    "uf" VARCHAR(2) NOT NULL,
    "nome" VARCHAR(30) NOT NULL,

    CONSTRAINT "estado_pkey" PRIMARY KEY ("uf")
);

-- CreateTable
CREATE TABLE "cidade" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "id_estado" VARCHAR(2) NOT NULL,

    CONSTRAINT "cidade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usuario" (
    "cpf" VARCHAR(11) NOT NULL,
    "nome" VARCHAR(50) NOT NULL,
    "tipo" "Tipo" NOT NULL,
    "email" VARCHAR(100) NOT NULL,
    "senha" VARCHAR(100) NOT NULL,

    CONSTRAINT "usuario_pkey" PRIMARY KEY ("cpf")
);

-- CreateTable
CREATE TABLE "anuncio" (
    "id_veiculo" INTEGER NOT NULL,
    "id_usuario" TEXT NOT NULL,
    "id_cidade" INTEGER NOT NULL,
    "descricao" TEXT NOT NULL,
    "preco" DOUBLE PRECISION NOT NULL,
    "dt_criacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aprovado" BOOLEAN NOT NULL DEFAULT false,
    "telefone_ddd" TEXT NOT NULL,
    "telefone_numero" TEXT NOT NULL,

    CONSTRAINT "anuncio_pkey" PRIMARY KEY ("id_veiculo","id_cidade","id_usuario")
);

-- CreateTable
CREATE TABLE "interesse_compra" (
    "cpf_comprador" VARCHAR(11) NOT NULL,
    "id_veiculo" INTEGER NOT NULL,

    CONSTRAINT "interesse_compra_pkey" PRIMARY KEY ("id_veiculo","cpf_comprador")
);

-- CreateTable
CREATE TABLE "telefone" (
    "ddd" VARCHAR(2) NOT NULL,
    "numero" VARCHAR(9) NOT NULL,
    "veiculo_id" INTEGER NOT NULL,

    CONSTRAINT "telefone_pkey" PRIMARY KEY ("ddd","numero")
);

-- CreateIndex
CREATE UNIQUE INDEX "modelo_id_marca_key" ON "modelo"("id_marca");

-- CreateIndex
CREATE UNIQUE INDEX "anuncio_id_veiculo_key" ON "anuncio"("id_veiculo");

-- CreateIndex
CREATE UNIQUE INDEX "anuncio_id_usuario_key" ON "anuncio"("id_usuario");

-- CreateIndex
CREATE UNIQUE INDEX "anuncio_id_cidade_key" ON "anuncio"("id_cidade");

-- CreateIndex
CREATE UNIQUE INDEX "anuncio_telefone_ddd_key" ON "anuncio"("telefone_ddd");

-- CreateIndex
CREATE UNIQUE INDEX "anuncio_telefone_numero_key" ON "anuncio"("telefone_numero");

-- CreateIndex
CREATE UNIQUE INDEX "telefone_veiculo_id_key" ON "telefone"("veiculo_id");

-- AddForeignKey
ALTER TABLE "modelo" ADD CONSTRAINT "modelo_id_marca_fkey" FOREIGN KEY ("id_marca") REFERENCES "marca"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ace_veiculo" ADD CONSTRAINT "ace_veiculo_id_Acessorio_fkey" FOREIGN KEY ("id_Acessorio") REFERENCES "acessorios"("descricao") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ace_veiculo" ADD CONSTRAINT "ace_veiculo_id_Veiculo_fkey" FOREIGN KEY ("id_Veiculo") REFERENCES "veiculo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "veiculo" ADD CONSTRAINT "veiculo_id_modelo_fkey" FOREIGN KEY ("id_modelo") REFERENCES "modelo"("nome") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "foto_veiculo" ADD CONSTRAINT "foto_veiculo_id_veiculo_fkey" FOREIGN KEY ("id_veiculo") REFERENCES "veiculo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cidade" ADD CONSTRAINT "cidade_id_estado_fkey" FOREIGN KEY ("id_estado") REFERENCES "estado"("uf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "anuncio" ADD CONSTRAINT "anuncio_id_veiculo_fkey" FOREIGN KEY ("id_veiculo") REFERENCES "veiculo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "anuncio" ADD CONSTRAINT "anuncio_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "usuario"("cpf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "anuncio" ADD CONSTRAINT "anuncio_id_cidade_fkey" FOREIGN KEY ("id_cidade") REFERENCES "cidade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "anuncio" ADD CONSTRAINT "anuncio_telefone_ddd_telefone_numero_fkey" FOREIGN KEY ("telefone_ddd", "telefone_numero") REFERENCES "telefone"("ddd", "numero") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "interesse_compra" ADD CONSTRAINT "interesse_compra_cpf_comprador_fkey" FOREIGN KEY ("cpf_comprador") REFERENCES "usuario"("cpf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "interesse_compra" ADD CONSTRAINT "interesse_compra_id_veiculo_fkey" FOREIGN KEY ("id_veiculo") REFERENCES "anuncio"("id_veiculo") ON DELETE RESTRICT ON UPDATE CASCADE;
