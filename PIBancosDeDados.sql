DROP DATABASE if exists Instituto;
CREATE DATABASE Instituto;

USE Instituto;

-- ===========================	INICIO DA CRIAÇÃO DE TABELA	=========================
CREATE TABLE Diretor
			(Id_Diretor INTEGER AUTO_INCREMENT,
            Nome VARCHAR(50) NOT NULL,
            CPF VARCHAR(11) UNIQUE NOT NULL,
            DtNasc DATE,
            PRIMARY KEY (Id_Diretor));

CREATE TABLE Escola 
			(Id_Escola INTEGER AUTO_INCREMENT,
            Nome VARCHAR(50) NOT NULL,
            Id_Diretor INTEGER,
            PRIMARY KEY (Id_Escola),
            FOREIGN KEY (Id_Diretor) REFERENCES Diretor(Id_Diretor));
            
CREATE TABLE Professor 
			(Id_Prof INTEGER AUTO_INCREMENT,
            Nome VARCHAR(40) NOT NULL,
			DtNasc DATE,
            CPF VARCHAR(11) UNIQUE NOT NULL,
            Tutor VARCHAR(3),
            PRIMARY KEY (Id_Prof));
            
CREATE TABLE Departamento 
			(Id_Depart INTEGER AUTO_INCREMENT,
            Nome VARCHAR(40) NOT NULL,
            Id_Escola INTEGER,
            Id_ChefDepart INTEGER,
            PRIMARY KEY (Id_Depart),
            FOREIGN KEY (Id_Escola) REFERENCES Escola(Id_Escola),
            FOREIGN KEY (Id_ChefDepart) REFERENCES Professor(Id_Prof));


            
CREATE TABLE Disciplina 
			(Id_Disciplina INTEGER AUTO_INCREMENT,
            Nome VARCHAR(40) NOT NULL,
            Id_Depart INTEGER,
            PRIMARY KEY (Id_Disciplina),
            FOREIGN KEY (Id_Depart) REFERENCES Departamento(Id_Depart));

            
CREATE TABLE Disciplina_Prof
			(Id_Prof INTEGER,
            Id_Disciplina INTEGER,
            FOREIGN KEY (Id_Prof) REFERENCES Professor(Id_Prof),
            FOREIGN KEY (Id_Disciplina) REFERENCES Disciplina(Id_Disciplina));
            

CREATE TABLE Turma 
			(Id_Turma INTEGER AUTO_INCREMENT,
            Id_Disciplina INTEGER,
            Sala INTEGER(3),
            Hora_Inicio TIME,
            Hora_Fim TIME,
            PRIMARY KEY (Id_Turma),
            FOREIGN KEY (Id_Disciplina) REFERENCES Disciplina(Id_Disciplina));
            
CREATE TABLE Aluno 
			(Id_Aluno INTEGER,
            Nome VARCHAR(40) NOT NULL,
            CPF VARCHAR(11) UNIQUE NOT NULL,
            DtNasc DATE,
            Al_Status VARCHAR(10),
            Id_Depart INTEGER,
            Id_Tutor INTEGER,
            PRIMARY KEY (Id_Aluno),
            FOREIGN KEY (Id_depart) REFERENCES Departamento (Id_Depart),
            FOREIGN KEY (Id_Tutor) REFERENCES Professor(Id_prof));
            
CREATE TABLE Turma_Aluno
			(Id_Turma INTEGER,
            Id_Aluno INTEGER,
            FOREIGN KEY (Id_Turma) REFERENCES Turma(Id_Turma),
            FOREIGN KEY (Id_Aluno) REFERENCES Aluno(Id_Aluno));

-- ===========================	FIM DA CRIAÇÃO DE TABELAS	=========================

-- ===========================	iNICIO DA CRAIÇÃO DE TUPLAS	=======================
INSERT INTO Diretor (Nome, CPF, Dtnasc) VALUES ("Antonio", "42835685030", "1987-02-01");
INSERT INTO Diretor (Nome, CPF, Dtnasc) VALUES ("Josias", "82557697060", "1981-04-11");
INSERT INTO Diretor (Nome, CPF, Dtnasc) VALUES ("Magali", "85606730081", "1987-06-21");
INSERT INTO Diretor (Nome, CPF, Dtnasc) VALUES ("Pedro", "34188850043", "1987-08-12");

INSERT INTO Escola (Nome, Id_Diretor) VALUES ("Escola Superior de Contablidade", "1");
INSERT INTO Escola (Nome, Id_Diretor) VALUES ("Escola Superior de Letras", "2");
INSERT INTO Escola (Nome, Id_Diretor) VALUES ("Escola Superior de Ciencias", "3");
INSERT INTO Escola (Nome, Id_Diretor) VALUES ("Escola Superior de Engenharia", "4");


INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Claudio", "1997-09-01", "91835516033", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Ricardo", "1986-12-05", "95422556089","Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Vitor", "1964-02-06", "15314343045", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Roger", "1968-02-21", "06083189063", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Roberto", "1983-05-25", "45882242045", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Guilherme", "1992-06-26", "98592134021", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Matheus", "1991-08-29", "67073406038", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Pablo", "1981-08-15", "37132613006", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Denis", "1978-07-25", "45031535016", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Cesar", "1962-12-23", "25590652073", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Everton", "1989-07-24", "41788298071", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Luiz", "1945-12-26", "89524005000", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Gabriel", "1976-04-22", "69448117078", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Miguel", "1945-08-21", "45800872082", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Davi", "1961-12-17", "50758132085", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Nicolas", "1961-12-08", "40173203094", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Fernando", "1971-12-14", "21361095024", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Rogerio", "1961-04-06", "84818043044", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Augusto", "1986-06-11", "76803676048", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Andrey", "1978-05-22", "42835685030", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Tiago", "1961-04-05", "82557697060", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Claudia", "1984-12-16", "85606730081", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Cristina", "1981-04-06", "34188850043", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Laura", "1971-04-16", "00000000009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Clarice", "1989-06-01", "00001900009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Amanda", "1983-01-08", "00001000009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Maria", "1984-07-11", "00002000009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Paula", "1974-06-12", "00000000409", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Ana", "1976-02-16", "00000007009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Alice", "1970-08-16", "00000000089", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Melissa", "1984-12-22", "0000004009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Natalia", "1970-04-21", "00010000009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Mariana", "1961-08-04", "00020000009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Luana", "1949-07-12", "00004000009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Leticia", "1981-02-24", "00000000509", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Luara", "1987-12-18", "00000007001", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Andreia", "1985-01-05", "00000200001", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Lorena", "1981-05-10", "00000050009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Gabriela", "1961-07-06", "00006000009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Julia", "1981-10-04", "00040000009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Giovana", "1982-07-26", "10000050009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Isabela", "1981-10-14", "00001400009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Valentina", "1986-08-24", "00002500009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Ana Julia ", "1982-06-14", "00000450009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Thais", "1980-07-20", "00000070009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Roberta", "1961-08-21", "00000789009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Carlos", "1975-05-21", "00012000009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Matheus", "1941-01-09", "00000047009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Bianca", "1961-10-14", "01000000009", "Sim");
INSERT INTO Professor (Nome, DtNasc, CPF, Tutor) VALUES ("Enzo", "1971-12-05", "00000002209", "Não");

INSERT INTO Departamento (Nome, Id_Escola, Id_ChefDepart) VALUES ("Contabilidade", "1", "1");
INSERT INTO Departamento (Nome, Id_Escola, Id_ChefDepart) VALUES ("Economia e Finanças ", "1", "2");
INSERT INTO Departamento (Nome, Id_Escola, Id_ChefDepart) VALUES ("Linguas Estrangeiras", "2", "3");
INSERT INTO Departamento (Nome, Id_Escola, Id_ChefDepart) VALUES ("Educação", "2", "4");
INSERT INTO Departamento (Nome, Id_Escola, Id_ChefDepart) VALUES ("Comunicação e Design", "3", "5");
INSERT INTO Departamento (Nome, Id_Escola, Id_ChefDepart) VALUES ("Ciências Biológicas", "3", "6");
INSERT INTO Departamento (Nome, Id_Escola, Id_ChefDepart) VALUES ("Ciências Sociais Aplicadas", "3", "7");
INSERT INTO Departamento (Nome, Id_Escola, Id_ChefDepart) VALUES ("Ciências Exatas", "3", "8");
INSERT INTO Departamento (Nome, Id_Escola, Id_ChefDepart) VALUES ("Ciências Jurídicas", "3", "9");
INSERT INTO Departamento (Nome, Id_Escola, Id_ChefDepart) VALUES ("Ciências da Saúde", "3", "10");
INSERT INTO Departamento (Nome, Id_Escola, Id_ChefDepart) VALUES ("Ciências Humanas", "3", "11");
INSERT INTO Departamento (Nome, Id_Escola, Id_ChefDepart) VALUES ("Ciências da Terra", "4", "12");
INSERT INTO Departamento (Nome, Id_Escola, Id_ChefDepart) VALUES ("Tecnologia", "4", "13");
INSERT INTO Departamento (Nome, Id_Escola, Id_ChefDepart) VALUES ("Engenharia Agricultura", "4", "14");

INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Sociologia", "1");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Administração", "1");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Direito", "1");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Economia", "1");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Língua Portuguesa", "1");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Teoria da Contabilidade", "1");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Análise e Elaboração de Projetos", "2");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Clássicos do Pensamento Econômico;", "2");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Comunicação Empresarial", "2");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Contabilidade Social", "2");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Cálculo Diferencial", "2");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Econometria", "2");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Economia Brasileira", "2");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Economia Internacional", "2");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Economia Monetária", "2");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Economia do Setor Público", "2");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Alemão", "3");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Espanhol", "3");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Francês", "3");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Inglês", "3");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Italiano", "3");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Pensamento e Educação Brasileira", "4");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Docência e processos culturais", "4");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Orientação à Elaboração de Tese", "4");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Educação e Linguagens", "4");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Exame de Qualificação I", "4");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Exame de Qualificação II", "4");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Educação e desigualdades sociais", "4");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Educação Especial e Processos Inclusivos", "4");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Orientação de Tese", "4");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Estudos Avançados: Educação e Linguagens", "4");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Desenho de Observação", "5");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("A Imagem Fotográfica", "5");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Optativas de Questões em Design", "5");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Projeto Básico - Contexto e Conceito", "5");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("História do Design I", "5");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Fundamentos da Mídia Digital", "5");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Optativas de Letras para CDI", "5");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Psicologia e Percepção", "5");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Optativas de Desenho", "5");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Semiologia e Comunicação", "5");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Zoologia de Vertebrados e Invertebradosd", "6");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Química.", "6");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Citologia.", "6");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Histologia.", "6");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Embriologia.", "6");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Botânica", "6");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Botânica Econômica.", "6");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Morfologia e Fisiologia Vegetal", "6");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Administração de Empresas e Pública", "7");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Biblioteconomia", "7");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Ciências Contábeis", "7");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Comércio Exterior", "7");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Comunicação Assistiva", "7");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Comunicação Institucionalr", "7");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Design", "7");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Física", "8");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("química", "8");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Cálculo I", "8");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Cálculo II", "8");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Cálculo III", "8");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Português Jurídico", "9");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Direito Romano", "9");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Direito Civil", "9");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Português Jurídico", "9");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Direito Constitucional", "9");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Direito Internacional Público", "9");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Ética do Profissional Jurídico", "9");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Prática Jurídica Trabalhista", "9");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Psicologia Jurídica", "9");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Metodologia da Pesquisa", "10");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Qualificação", "10");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Seminários", "10");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Estágio Docência", "10");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Estágio Docência II", "10");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Imunologia Avançada ", "10");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Epidemiologia e Bioestatística", "10");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("História", "11");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Filosofia", "11");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Brasil Colônia", "11");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Sociologia", "11");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Guerras Mundiais", "11");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Geologia", "12");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Vulcanologia e Sismologia", "12");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Habitat Humano", "12");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Ciências Atmosféricas", "12");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Climatologia", "12");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Hidrologia", "12");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("stratigrafia e História da Terra", "12");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Administração de Banco de Dados", "13");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Comércio Eletrônico", "13");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Contabilidade", "13");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Fundamentos de Redes de Computadores", "13");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Fundamentos de Sistemas de Informação", "13");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Gerenciamento de Infraestrutura", "13");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Gestão Estratégica", "13");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Introdução à Engenharia Agronômica", "14");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Vida Universitária e Cidadani", "14");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Morfologia Vegetal", "14");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Cálculo I", "14");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Cálculo II", "14");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Produção Animal I", "14");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Produção Animal II", "14");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Química e Fertilidade do Solo", "14");
INSERT INTO Disciplina (Nome, Id_Depart) VALUES ("Microbiologia", "14");

INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("1", "1");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("2", "15");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("3", "16");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("4", "17");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("5", "18");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("6", "19");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("7", "2");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("8", "20");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("9", "21");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("10", "22");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("11", "23");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("12", "24");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("13", "25");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("14", "26");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("15", "27");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("16", "28");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("17", "3");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("18", "29");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("19", "30");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("20", "31");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("21", "32");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("22", "4");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("23", "33");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("24", "34");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("25", "35");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("26", "36");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("27", "37");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("28", "38");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("29", "39");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("30", "40");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("31", "41");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("32", "5");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("33", "42");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("34", "43");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("35", "44");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("36", "45");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("37", "46");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("38", "47");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("39", "48");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("40", "49");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("41", "50");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("42", "6");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("50", "7");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("57", "8");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("62", "9");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("71", "10");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("78", "11");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("83", "12");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("90", "13");
INSERT INTO Disciplina_Prof (Id_Disciplina, Id_prof) VALUES ("97", "14");

INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("1", "00", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("1", "00", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("2", "01", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("2", "01", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("3", "02", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("3", "02", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("4", "03", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("4", "03", "12:00:00", "17:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("5", "04", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("5", "04", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("6", "05", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("6", "05", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("7", "06", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("7", "06", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("8", "07", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("8", "07", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("9", "08", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("9", "08", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("10", "09", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("10", "09", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("11", "10", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("11", "10", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("12", "11", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("12", "11", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("13", "12", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("13", "12", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("14", "13", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim) VALUES ("14", "13", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("15", "14", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("15", "14", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("16", "15", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("16", "15", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("17", "16", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("17", "16", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("18", "17", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("18", "17", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("19", "18", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("19", "18", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("20", "19", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("20", "19", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("21", "20", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("21", "20", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("22", "21", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("22", "21", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("23", "22", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("23", "22", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("24", "23", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("24", "23", "12:00:00", "16:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("25", "24", "17:00:00", "20:00:00");
INSERT INTO Turma (Id_Disciplina, Sala, Hora_Inicio, Hora_Fim)  VALUES ("25", "24", "12:00:00", "16:00:00");

-- ===========================	FIM DA CRIAÇÃO DE TUPLAS	=====================

-- ===========================	iNICIO DO SELECT DE TABELAS	=======================
SELECT * FROM Diretor;
SELECT * FROM Escola;
SELECT * FROM Departamento;
SELECT * FROM Disciplina;
SELECT * FROM Professor;
SELECT A.Id_Disciplina, B.Nome, A.Id_Prof, C.Nome FROM Disciplina_Prof A, Disciplina B, Professor C WHERE A.Id_Disciplina = B.Id_Disciplina  AND A.Id_Prof = C.Id_Prof;
SELECT * FROM Turma;


-- ===========================	FIM DO SELECT DE TABELAS	=====================