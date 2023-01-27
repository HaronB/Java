package instituto;

import java.util.ArrayList;

public class Aluno extends Pessoa {
	// Variavel
	private Integer idAluno, idDepart, idTutor;
	private ArrayList<Integer> turma;
	private ArrayList<String> disciplina;
	private String alStatus, nomeDepart, nomeTutor;

	//Construtor
	public Aluno() {
		super();
		turma = new ArrayList<Integer>();
		disciplina = new ArrayList<String>();
	}

	public Integer getidAluno() {
		//Retorna o id do aluno
		return idAluno;
	}

	public void setidAluno(Integer idAluno) {
		//Armazena o id do aluno
		this.idAluno = idAluno;
	}

	public Integer getidTutor() {
		//Retorna o id do Tutor
		return idTutor;
	}

	public void setidTutor(Integer idTutor) {
		//Armazena o id do Tutor
		this.idTutor = idTutor;
	}

	public ArrayList<Integer> getTurma() {
		//Retorna a lista Turma
		return turma;
	}

	public int setTurma(Integer turma) {
		//Armazena a lista turma
		this.turma.add(turma);

		//Retorna o tamanho da lista
		return this.turma.size();
	}

	public Integer getidDepart() {
		//Retorna o Id do Departamento
		return idDepart;
	}

	public void setidDepart(Integer idDepart) {
		//Armazena o Id do Departamento
		this.idDepart = idDepart;
	}

	public String getAlStatus() {
		//Retorna o status do aluno
		return alStatus;
	}

	public void setAlStatus(String alStatus) {
		//Armazena o status do aluno
		this.alStatus = alStatus;
	}

	public void setNomeDepart(String nomeDepart) {
		//Armazena o nome do departamento
		this.nomeDepart = nomeDepart;
	}

	public String getNomeDepart() {
		//Retorna o nome do deprtamento
		return nomeDepart;
	}

	public void setNomeTutor(String nomeTutor) {
		//Armazena o nome do Tutor
		this.nomeTutor = nomeTutor;
	}

	public String getNomeTutor() {
		//Retorna o nome do Tutor
		return nomeTutor;
	}

	public ArrayList<String> getDisciplina() {
		//Retorna a disciplina
		return disciplina;
	}

	public void setDisciplina(String disciplina) {
		//Armazena a disciplina
		this.disciplina.add(disciplina);
	}

}
