<?php
$host = "localhost";
$port = "5432";
$dbname = "concessionaria";
$user = "postgres";
$password = "Shard64377.";

// Conexão com o PostgreSQL
$conn = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");

if ($conn) {
    echo "Conexão bem-sucedida com o PostgreSQL!";
} else {
    echo "Falha na conexão com o PostgreSQL.";
}
?>
