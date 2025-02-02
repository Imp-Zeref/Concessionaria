-- CreateEnum
CREATE TYPE "combustivel" AS ENUM ('g', 'a', 'd', 'e', 'h', 'f');

-- CreateEnum
CREATE TYPE "Cambio" AS ENUM ('m', 'a', 'e');

-- CreateEnum
CREATE TYPE "Tipo" AS ENUM ('adm', 'com');

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
    "telefone" VARCHAR(11) NOT NULL,
    "dt_criacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aprovado" BOOLEAN NOT NULL DEFAULT false,
    "foto" TEXT NOT NULL,

    CONSTRAINT "anuncio_pkey" PRIMARY KEY ("id_veiculo","id_cidade","id_usuario")
);

-- CreateTable
CREATE TABLE "interesse_compra" (
    "cpf_comprador" VARCHAR(11) NOT NULL,
    "id_veiculo" INTEGER NOT NULL,

    CONSTRAINT "interesse_compra_pkey" PRIMARY KEY ("id_veiculo","cpf_comprador")
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
CREATE UNIQUE INDEX "anuncio_foto_key" ON "anuncio"("foto");

-- AddForeignKey
ALTER TABLE "modelo" ADD CONSTRAINT "modelo_id_marca_fkey" FOREIGN KEY ("id_marca") REFERENCES "marca"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "veiculo" ADD CONSTRAINT "veiculo_id_modelo_fkey" FOREIGN KEY ("id_modelo") REFERENCES "modelo"("nome") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cidade" ADD CONSTRAINT "cidade_id_estado_fkey" FOREIGN KEY ("id_estado") REFERENCES "estado"("uf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "anuncio" ADD CONSTRAINT "anuncio_id_veiculo_fkey" FOREIGN KEY ("id_veiculo") REFERENCES "veiculo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "anuncio" ADD CONSTRAINT "anuncio_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "usuario"("cpf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "anuncio" ADD CONSTRAINT "anuncio_id_cidade_fkey" FOREIGN KEY ("id_cidade") REFERENCES "cidade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "interesse_compra" ADD CONSTRAINT "interesse_compra_cpf_comprador_fkey" FOREIGN KEY ("cpf_comprador") REFERENCES "usuario"("cpf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "interesse_compra" ADD CONSTRAINT "interesse_compra_id_veiculo_fkey" FOREIGN KEY ("id_veiculo") REFERENCES "anuncio"("id_veiculo") ON DELETE RESTRICT ON UPDATE CASCADE;
