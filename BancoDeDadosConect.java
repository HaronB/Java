package instituto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.sql.ResultSet;

public class BancoDeDadosConect {
	// Variavel
	private Connection connection;
	private String mensagem;

	// Constantes
	public static final String FALHA_CONEXAO = "\nFalha na conexão com o banco de dados";
	public static final String FALHA_OPERACAO = "\nFalha na operação do banco de dados";
	public static final String CADASTRO_SUCESSO = "\nCadastro realizado com sucesso";
	public static final String CADASTRO_INSUCESSO = "\nO cadastro não foi realizado";
	public static final String CONSULTA_VAZIA = "\nA consulta não retornou resultados";
	public static final String ATUALIZACAO_SUCESSO = "\nAtualização realizada com sucesso";
	public static final String ATUALIZACAO_INSUCESSO = "\nA atualização não foi realizada";
	public static final String EXCLUSAO_SUCESSO = "\nExclusão realizada com sucesso";
	public static final String EXCLUSAO_INSUCESSO = "\nA exclusão não foi realizada";

	//Construtor
	public String getMensagem() {
		return mensagem;
	}

	public boolean inserir(Aluno aluno) {
		// Variavel
		String query = null, query1 = null;
		PreparedStatement ps = null, ps1 = null;
		int inserted = 0;
		boolean status = true;

		//Verifica a conexão com o banco de dados
		connection = ConnectionFactory.getConnection(); 
		if (connection == null) {
			mensagem = FALHA_CONEXAO;
			return false;
		}

		//Comando que vai ser enviado para o banco de dados
		query = "INSERT INTO Aluno (Id_Aluno, Nome, CPF, Id_Depart, Id_Tutor, DtNasc, Al_Status)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		query1 = "INSERT INTO Turma_Aluno (Id_Aluno, Id_Turma) VALUES (?, ? )";

		// "try" - protege o codigo para eventuais erros do banco de dados
		try {
			
			//Prepara as query
			ps = connection.prepareStatement(query);
			ps1 = connection.prepareStatement(query1);

			//Configura a query 
			ps.setInt(1, aluno.getidAluno());
			ps.setString(2, aluno.getNome());
			ps.setString(3, aluno.getCPF());
			ps.setInt(4, aluno.getidDepart());
			ps.setInt(5, aluno.getidTutor());

			String data = aluno.getdtNasc(2) + "-" + aluno.getdtNasc(1) + "-" + aluno.getdtNasc(0);
			ps.setString(6, data);
			ps.setString(7, "Ativo");

			//Envia a query para o banco de dados
			inserted = ps.executeUpdate();
			
			//Prepara a query1
			List<Integer> list = aluno.getTurma();
			Iterator<Integer> iterator = list.iterator();
			while (iterator.hasNext()) {
				Integer aux = iterator.next();
				ps1.setInt(1, aluno.getidAluno());
				ps1.setInt(2, aux);
				//Envia a query1 para o banco de dados
				inserted *= ps1.executeUpdate();
			}

			if (inserted > 0) {
				mensagem = CADASTRO_SUCESSO;
			} else {
				mensagem = CADASTRO_INSUCESSO;
				status = false;
			}
		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			mensagem = FALHA_OPERACAO;
			status = false;
		} finally {
			try {
				if (ps != null && ps1 != null)
					ps.close();
				ps1.close();
			} catch (Exception ex) {
				System.err.println("SQLException: " + ex.getMessage());
			}
		}

		ConnectionFactory.closeConnection();

		return status;
	}

	public boolean atualizar(Aluno aluno) {
		// Variavel
		String query = null, query1 = null;
		PreparedStatement ps = null, ps1 = null;
		int inserted = 0;
		boolean status = true;

		//Verifica a conexão com o banco de dados 
		connection = ConnectionFactory.getConnection();
		if (connection == null) {
			mensagem = FALHA_CONEXAO;
			return false;
		}

		//Comando que vai ser enviado para o banco de dados
		query = "UPDATE Aluno SET Nome = ?, CPF = ?, Id_Depart = ?, Id_Tutor = ?, DtNasc = ?, Al_Status = ? WHERE aluno.Id_Aluno = ?";
		query1 = "INSERT INTO Turma_Aluno (Id_Aluno, Id_Turma) VALUES (?, ? )";

		// "try" - protege o codigo para eventuais erros do banco de dados
		try {
			//Prepara as query
			ps = connection.prepareStatement(query);
			ps1 = connection.prepareStatement(query1);

			//Configura a query 
			ps.setString(1, aluno.getNome());
			ps.setString(2, aluno.getCPF());
			ps.setInt(3, aluno.getidDepart());
			ps.setInt(4, aluno.getidTutor());

			String data = aluno.getdtNasc(2) + "-" + aluno.getdtNasc(1) + "-" + aluno.getdtNasc(0);
			ps.setString(5, data);
			ps.setString(6, "Ativo");
			ps.setInt(7, aluno.getidAluno());

			//Envia a query para o banco de dados
			inserted = ps.executeUpdate();
			
			//Prepara a query1
			List<Integer> list = aluno.getTurma();
			Iterator<Integer> iterator = list.iterator();			
			while (iterator.hasNext()) {
				Integer aux = iterator.next();
				ps1.setInt(1, aluno.getidAluno());
				ps1.setInt(2, aux);
				//Envia a query1 para o banco de dados
				inserted *= ps1.executeUpdate();
			}

			if (inserted > 0) {
				mensagem = CADASTRO_SUCESSO;
			} else {
				mensagem = CADASTRO_INSUCESSO;
				status = false;
			}
		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			mensagem = FALHA_OPERACAO;
			status = false;
		} finally {
			try {
				if (ps != null && ps1 != null)
					ps.close();
				ps1.close();
			} catch (Exception ex) {
				System.err.println("SQLException: " + ex.getMessage());
			}
		}

		ConnectionFactory.closeConnection();

		return status;
	}

	public List<Aluno> procurarNome(String nome) {
		// Variavel
		List<Aluno> lista = null;
		String query = null, query1 = null;
		PreparedStatement ps = null, ps1 = null;
		int count = 0;

		//Verifica a conexão com o banco de dados 
		connection = ConnectionFactory.getConnection();
		if (connection == null) {
			mensagem = FALHA_CONEXAO;
			return null;
		}

		//Comando que vai ser enviado para o banco de dados
		query = "SELECT A.*, B.Nome, C.Nome  FROM aluno A, Departamento B, Professor C WHERE A.Id_Depart = B.Id_Depart AND A.Id_Tutor = C.Id_Prof AND A.Nome LIKE ?";
		query1 = "SELECT C.Nome FROM Turma_Aluno A, Turma B, Disciplina C WHERE A.Id_Aluno = ? AND A.Id_Turma = B.Id_Turma AND B.Id_Disciplina = C.Id_Disciplina";
		
		// "try" - protege o codigo para eventuais erros do banco de dados
		try {
			//Prepara a query
			ps = connection.prepareStatement(query);
			ps.setString(1, "%" + nome + "%");

			//Armazena os valores retornados do banco de dados
			ResultSet rs = ps.executeQuery();

			//Armazena no objeto aluno os valores retornados
			lista = new ArrayList<Aluno>();
			while (rs.next()) {
				Aluno aluno = new Aluno();
				aluno.setidAluno(rs.getInt("Id_Aluno"));
				aluno.setNome(rs.getString("Nome"));
				aluno.setCPF(rs.getString("CPF"));
				aluno.setAlStatus(rs.getString("Al_Status"));
				aluno.setidDepart(rs.getInt("Id_Depart"));
				aluno.setidTutor(rs.getInt("Id_Tutor"));
				aluno.setdtNasc(0, 0, 0, rs.getDate("DtNasc"));
				aluno.setNomeDepart(rs.getString(8));
				aluno.setNomeTutor(rs.getString(9));

				//Prepara a query1
				ps1 = connection.prepareStatement(query1);
				
				ps1.setInt(1, rs.getInt("Id_Aluno"));

				//Armazena os valores retornados do banco de dados
				ResultSet rs1 = ps1.executeQuery();

				//Armazena no objeto aluno os valores retornados
				while (rs1.next()) {
					aluno.setDisciplina(rs1.getString("Nome"));
				}

				lista.add(aluno);
				count++;
			}
			if (count == 0) {
				mensagem = CONSULTA_VAZIA;
			}
		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			mensagem = FALHA_OPERACAO;
			lista = null;
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception ex) {
				System.err.println("SQLException: " + ex.getMessage());
			}
		}

		return lista;
	}

	public Integer procurarid(Integer id) {
		// Variavel
		String query = null;
		PreparedStatement ps = null;
		Integer count = 0;

		//Verifica a conexão com o banco de dados 
		connection = ConnectionFactory.getConnection();
		if (connection == null) {
			mensagem = FALHA_CONEXAO;
			return null;
		}
		
		//Comando que vai ser enviado para o banco de dados
		query = "SELECT COUNT(*) FROM Aluno WHERE Id_Aluno = ?";

		// "try" - protege o codigo para eventuais erros do banco de dados
		try {
			//Prepara a query
			ps = connection.prepareStatement(query);
			ps.setInt(1, id);


			//Armazena os valores retornados do banco de dados
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt("COUNT(*)");
		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			mensagem = FALHA_OPERACAO;
			count = null;
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception ex) {
				System.err.println("SQLException: " + ex.getMessage());
			}
		}

		ConnectionFactory.closeConnection();

		return count;
	}

	public Integer procurarCPF(String CPF, Integer idAluno) {
		// Variavel
		String query = null;
		PreparedStatement ps = null;
		Integer count = 0;

		//Verifica a conexão com o banco de dados 
		connection = ConnectionFactory.getConnection();
		if (connection == null) {
			mensagem = FALHA_CONEXAO;
			return null;
		}

		//Comando que vai ser enviado para o banco de dados
		if (idAluno == null) {
			//Cadastro verifica se ja existe o cpf no banco de dados
			query = "SELECT COUNT(*) FROM Aluno WHERE CPF = ?";
		} else {
			//Atualiza verifica se ja existe o cpf no banco de dados exceto o da conta sendo atualizada
			query = "SELECT COUNT(*) FROM Aluno WHERE CPF = ? AND Id_Aluno  != ?";
		}

		// "try" - protege o codigo para eventuais erros do banco de dados
		try {
			//Prepara a query
			ps = connection.prepareStatement(query);
			ps.setString(1, CPF);
			if (idAluno != null) {
				ps.setInt(2, idAluno);
			}

			//Armazena os valores retornados do banco de dados
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt("COUNT(*)");
		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			mensagem = FALHA_OPERACAO;
			count = null;
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception ex) {
				System.err.println("SQLException: " + ex.getMessage());
			}
		}

		ConnectionFactory.closeConnection();

		return count;
	}

	public List<Aluno> listar() {
		// Variavel
		List<Aluno> lista = null;
		String query = null, query1 = null;
		PreparedStatement ps = null;
		Statement s = null;
		int count = 0;

		//Verifica a conexão com o banco de dados 
		connection = ConnectionFactory.getConnection();
		if (connection == null) {
			mensagem = FALHA_CONEXAO;
			return null;
		}

		//Comando que vai ser enviado para o banco de dados
		query = "SELECT A.*, B.Nome, C.Nome  FROM aluno A, Departamento B, Professor C WHERE A.Id_Depart = B.Id_Depart AND A.Id_Tutor = C.Id_Prof";
		query1 = "SELECT C.Nome FROM Turma_Aluno A, Turma B, Disciplina C WHERE A.Id_Aluno = ? AND A.Id_Turma = B.Id_Turma AND B.Id_Disciplina = C.Id_Disciplina";
		
		// "try" - protege o codigo para eventuais erros do banco de dados
		try {
			
			s = connection.createStatement();
			
			//Armazena os valores retornados do banco de dados
			ResultSet rs = s.executeQuery(query);

			//Armazena no objeto aluno os valores retornados
			lista = new ArrayList<Aluno>();
			while (rs.next()) {
				Aluno aluno = new Aluno();
				aluno.setidAluno(rs.getInt("Id_Aluno"));
				aluno.setNome(rs.getString("Nome"));
				aluno.setCPF(rs.getString("CPF"));
				aluno.setAlStatus(rs.getString("Al_Status"));
				aluno.setidDepart(rs.getInt("Id_Depart"));
				aluno.setidTutor(rs.getInt("Id_Tutor"));
				aluno.setdtNasc(0, 0, 0, rs.getDate("DtNasc"));
				aluno.setNomeDepart(rs.getString(8));
				aluno.setNomeTutor(rs.getString(9));

				//Prepara a query1
				ps = connection.prepareStatement(query1);
				ps.setInt(1, rs.getInt("Id_Aluno"));

				//Armazena os valores retornados do banco de dados
				ResultSet rs1 = ps.executeQuery();

				//Armazena no objeto aluno os valores retornados
				while (rs1.next()) {
					aluno.setDisciplina(rs1.getString("Nome"));
				}

				lista.add(aluno);
				count++;
			}
			if (count == 0) {
				mensagem = CONSULTA_VAZIA;
			}
		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			mensagem = FALHA_OPERACAO;
			lista = null;
		} finally {
			try {
				if (s != null)
					s.close();
			} catch (Exception ex) {
				System.err.println("SQLException: " + ex.getMessage());
			}
		}

		return lista;
	}

	public boolean removerTurma(Integer idAluno) {
		// Variavel
		String query = null;
		PreparedStatement ps = null;
		int deleted = 0;
		boolean status = true;

		//Verifica a conexão com o banco de dados 
		connection = ConnectionFactory.getConnection();
		if (connection == null) {
			mensagem = FALHA_CONEXAO;
			return false;
		}

		//Comando que vai ser enviado para o banco de dados
		query = "DELETE FROM Turma_Aluno WHERE Id_Aluno = ?";

		
		// "try" - protege o codigo para eventuais erros do banco de dados
		try {
			
			//Prepara a query
			ps = connection.prepareStatement(query);
			ps.setInt(1, idAluno);

			deleted = ps.executeUpdate();

			if (deleted > 0) {
				mensagem = EXCLUSAO_SUCESSO;
			} else {
				mensagem = EXCLUSAO_INSUCESSO;
				status = false;
			}
		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			mensagem = FALHA_OPERACAO;
			status = false;
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception ex) {
				System.err.println("SQLException: " + ex.getMessage());
			}
		}

		ConnectionFactory.closeConnection();

		return status;
	}

	public void removerAluno(Integer idAluno) {
		// Variavel
		String query = null;
		PreparedStatement ps = null;
		int deleted = 0;

		//Verifica a conexão com o banco de dados 
		connection = ConnectionFactory.getConnection();
		if (connection == null) {
			mensagem = FALHA_CONEXAO;
			return;
		}

		//Comando que vai ser enviado para o banco de dados
		query = "DELETE FROM Aluno WHERE Id_Aluno = ?";

		// "try" - protege o codigo para eventuais erros do banco de dados
		try {
			//Prepara a query
			ps = connection.prepareStatement(query);
			ps.setInt(1, idAluno);

			deleted = ps.executeUpdate();

			if (deleted > 0) {
				mensagem = EXCLUSAO_SUCESSO;
			} else {
				mensagem = EXCLUSAO_INSUCESSO;
			}
		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			mensagem = FALHA_OPERACAO;
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception ex) {
				System.err.println("SQLException: " + ex.getMessage());
			}
		}

		ConnectionFactory.closeConnection();
	}
}
