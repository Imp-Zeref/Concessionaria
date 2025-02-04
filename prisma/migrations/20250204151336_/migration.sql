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
    "id" INTEGER NOT NULL,
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

    CONSTRAINT "modelo_pkey" PRIMARY KEY ("id")
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
    "id" SERIAL NOT NULL,
    "id_usuario" TEXT NOT NULL,
    "id_cidade" INTEGER NOT NULL,
    "descricao" TEXT NOT NULL,
    "preco" DOUBLE PRECISION NOT NULL,
    "telefone" VARCHAR(11) NOT NULL,
    "dt_criacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "aprovado" BOOLEAN NOT NULL DEFAULT false,
    "foto" TEXT NOT NULL,
    "placa" VARCHAR(7) NOT NULL,
    "km" INTEGER NOT NULL,
    "gnv" BOOLEAN NOT NULL,
    "cor" VARCHAR(20) NOT NULL,
    "novo" BOOLEAN NOT NULL,
    "id_modelo" INTEGER NOT NULL,

    CONSTRAINT "anuncio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "interesse_compra" (
    "id_anuncio" INTEGER NOT NULL,
    "cpf_interessado" VARCHAR(11) NOT NULL,

    CONSTRAINT "interesse_compra_pkey" PRIMARY KEY ("id_anuncio","cpf_interessado")
);

-- CreateIndex
CREATE UNIQUE INDEX "modelo_id_marca_key" ON "modelo"("id_marca");

-- CreateIndex
CREATE UNIQUE INDEX "anuncio_foto_key" ON "anuncio"("foto");

-- AddForeignKey
ALTER TABLE "modelo" ADD CONSTRAINT "modelo_id_marca_fkey" FOREIGN KEY ("id_marca") REFERENCES "marca"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cidade" ADD CONSTRAINT "cidade_id_estado_fkey" FOREIGN KEY ("id_estado") REFERENCES "estado"("uf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "anuncio" ADD CONSTRAINT "anuncio_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "usuario"("cpf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "anuncio" ADD CONSTRAINT "anuncio_id_cidade_fkey" FOREIGN KEY ("id_cidade") REFERENCES "cidade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "anuncio" ADD CONSTRAINT "anuncio_id_modelo_fkey" FOREIGN KEY ("id_modelo") REFERENCES "modelo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "interesse_compra" ADD CONSTRAINT "interesse_compra_cpf_interessado_fkey" FOREIGN KEY ("cpf_interessado") REFERENCES "usuario"("cpf") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "interesse_compra" ADD CONSTRAINT "interesse_compra_id_anuncio_fkey" FOREIGN KEY ("id_anuncio") REFERENCES "anuncio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
