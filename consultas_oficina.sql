-- 1. Recuperação simples: Listar todos os clientes
SELECT * FROM Clientes;

-- 2. Filtro com WHERE: Ver ordens de serviço em aberto
SELECT * FROM Ordens_Servico WHERE Status = 'Aberto';

-- 3. Atributo Derivado: Valor da OS com 10% de taxa de urgência
SELECT idOS, Valor_Total, (Valor_Total * 1.10) AS Valor_Com_Taxa FROM Ordens_Servico;

-- 4. Ordenação: Clientes por ordem alfabética
SELECT * FROM Clientes ORDER BY Nome ASC;

-- 5. Junção (JOIN): Relacionar Dono, Veículo e status da OS
SELECT c.Nome AS Cliente, v.Modelo, os.Status
FROM Clientes c
INNER JOIN Veiculos v ON c.idCliente = v.idCliente
INNER JOIN Ordens_Servico os ON v.idVeiculo = os.idVeiculo;

-- 6. Filtro de Grupo (HAVING): Veículos com mais de 2 ordens de serviço
SELECT idVeiculo, COUNT(*) AS Total_OS
FROM Ordens_Servico
GROUP BY idVeiculo
HAVING Total_OS > 2;
