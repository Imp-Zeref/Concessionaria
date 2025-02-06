-- estado
INSERT INTO estado (uf, nome) VALUES ('RS', 'Rio Grande do Sul'), ('RN', 'Rio Grande do Norte');

-- cidade
INSERT INTO cidade (nome, id_estado) VALUES ('Camaquã', 'RS'), ('Porto Alegre', 'RS'), ('Natal', 'RN');

-- marca
INSERT INTO marca (id) VALUES ('Honda'), ('Ford'), ('Chevrolet'), ('Nissan'), ('Mitsubishi'), ('Toyota');

-- modelo
INSERT INTO modelo (nome, ano, versao, combustivel, cambio, qtd_lugares, cv, cc, portas, id_marca) VALUES
    ('Civic', 1994, 'DX Hatchback', 'g', 'm', 5, 102, 1500, 3, 'Honda'), ('Mustang', 2015, 'GT', 'a', 'm', '5', 450, 3000, 3, 'Ford'),
    ('L200', 2009, 'Triton HPE', 'd', 'a', 5, 160, 3200, 4, 'Mitsubishi'),
    ('Sentra', 2024, 'Advance Xtronic', 'g', 'a', 5, 151, 2000, 5, 'Nissan'), ('Onix', 2019, 'LTZ Hatchback', 'f', 'm', 5, 110, 1400, 5, 'Chevrolet'),
    ('Hillux', 2010, 'STD 4x4 CD', 'd', 'a', 5, 163, 3000, 4, 'Toyota');