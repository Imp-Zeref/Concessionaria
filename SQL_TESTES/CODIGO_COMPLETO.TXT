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
