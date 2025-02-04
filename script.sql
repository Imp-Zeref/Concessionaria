-- estado
INSERT INTO estado (uf, nome) VALUES ('RS', 'Rio Grande do Sul'), ('RN', 'Rio Grande do Norte');

-- cidade
INSERT INTO cidade (nome, id_estado) VALUES ('Camaquã', 'RS'), ('Porto Alegre', 'RS'), ('Natal', 'RN');

-- usuario
INSERT INTO usuario (cpf, nome, tipo, email, senha) VALUES ('321', 'Gustavo', 'adm', 'gustavo@gmail.com', '123'), ('123123', 'Gabriel', 'adm', 'gabriel@outlook.com', '123'), ('12', 'Jeziel', 'com', 'jeziel@email.com', '123');

-- marca
INSERT INTO marca (id) VALUES ('Honda'), ('Ford'), ('Chevrolet'), ('Nissan'), ('Mitsubishi'), ('Toyota');

-- modelo
INSERT INTO modelo (nome, ano, versao, combustivel, cambio, qtd_lugares, cv, cc, portas, id_marca) VALUES (
    "Civic", 1994, 'DX Hatchback', 'g', 'm', 5, 102, 1500, 3, 'Honda'), ("Mustang", 2015, 'GT', 'a', 'm', '5', 450, 3000, 3, 'Ford'),
    ('L200', 2009, 'Triton HPE', 'd', 'a', 5, 160, 3200, 4, 'Mitsubishi'),
    ('Sentra', 2024, 'Advance Xtronic', 'g', 'a', 5, 151, 2000, 5, 'Nissan'), ('Onix', 2019, 'LTZ Hatchback', 'f', 'm', 5, 110, 1400, 5, 'Chevrolet'),
    ('Hillux', 2010, 'STD 4x4 CD', 'd', 'a', 5, 163, 3000, 4, 'Toyota');

-- anuncio
INSERT INTO anuncio (id_usuario, id_cidade, descricao, preco, telefone, aprovado, foto, placa, km, gnv, cor, novo, id_modelo) VALUES 
('123123', 1, 'Vendo este lindo civic', 35000, '84321', '1', 'https://preview.redd.it/z4ftxe5s5l941.jpg?auto=webp&s=bb2920b4f3750590b45d842cd9553254d3a1e950',
'GQN3F07', 385000, '0', 'Azul', '0', 1), 
('321', 1, 'Vendo este mustang aqui acabado horrível', 50000, '4321321', '1', 
'https://hips.hearstapps.com/hmg-prod/amv-prod-cad-assets/images/14q4/638369/2015-ford-mustang-gt-automatic-test-review-car-and-driver-photo-644182-s-original.jpg',
'EBA2F43', 50000, '1', 'Preto', '0', 2),
('12', 1, 'VEndo esta L200 de trilha legal massa demais compra ai', 90000, '3214231', '0', 'https://www.tabelafipeconsulta.com.br/wp-content/uploads/2023/03/L200-Triton-2009-Tabela-FIPE.jpg'
, 'ALGUM4', 400000, '0', 'Vermelha', '0', 3),
('123123', 1, 'Vendo este Sentra aqui massa demais e bonitão', 150000, '4324123', '1', 'https://cdn.motor1.com/images/mgl/g4Eo9P/s3/nissan-sentra.jpg', '321fDSA', 
0, '0', 'Branco', '1', 4),
('321', 1, 'Vendo este Onix', 6500, '3213214', '1', 'https://cdn.autopapo.com.br/box/uploads/2018/05/23174419/onix2019-732x488.jpg', 'CH3VR0', 20000, '1', 'Azul escuro',
'0', 5),
('12', 1, 'Vendo CapotaLux', 70000, '453241', '1', 'https://cdn.autopapo.com.br/box/uploads/2021/06/30222558/toyota_hilux_1990-e-2010-frente-deserto-.jpeg', 'HILUX', 
230000, '1', 'Preta', '0', 6);