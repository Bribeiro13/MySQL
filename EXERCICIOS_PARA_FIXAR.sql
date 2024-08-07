use bdex1_hospital;

#EXERCÍCIOS PARA FIXAR

#Quais são os nomes e datas de nascimento de todos os pacientes cadastrados?
select nome, data_nasc from pacientes;

#Qual é o número total de médicos cadastrados?
select count(*) Qtd_Medicos from medicos;

#Qual é a idade média dos pacientes cadastrados?
select round(avg(timestampdiff(year,data_nasc,curdate())),0) as media_idade
from pacientes;

#Quais são os pacientes ordenados por idade?
SELECT * FROM PACIENTES
ORDER BY timestampdiff(YEAR,DATA_NASC,CURDATE());
#OU, SE QUISER EXIBIR A IDADE
SELECT *, timestampdiff(YEAR,DATA_NASC,CURDATE()) AS IDADE
FROM PACIENTES
ORDER BY IDADE;

#Quantos pacientes existem em cada departamento?
SELECT D.NOME_ESPECIALIDADE, COUNT(*) AS QUANTIDADE
FROM PACIENTES AS P
JOIN CONSULTAS AS C ON C.CPF_PACIENTE = P.CPF_PACIENTE
JOIN MEDICOS AS M ON M.CRM = C.CRM AND C.UF = M.UF
JOIN DEPARTAMENTOS AS D ON D.COD_ESPECIALIDADE = M.DEPTO_COD_ESPEC
GROUP BY D.NOME_ESPECIALIDADE;
#ORDER BY QUANTIDADE DESC
#LIMIT 1;