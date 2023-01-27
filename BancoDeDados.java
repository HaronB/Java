package instituto;

import java.util.Iterator;
import java.util.Scanner;
import java.util.List;

public class BancoDeDados {
	// Variavel
	private BancoDeDadosConect bancoDeDadosConect;
	private Scanner teclado;

	//Construtor
	public BancoDeDados() {
		bancoDeDadosConect = new BancoDeDadosConect();
		teclado = new Scanner(System.in);
	}

	public void criarConta() {
		// Variavel
		int i;
		String continua;
		boolean flag;
		Integer valid;

		// Cria um objeto aluno
		Aluno aluno = new Aluno();

		//Obtem o id
		while (true) {
			while (true) {
				System.out.println("Digite o seu id de aluno:");
				
				// "try" - protege o codigo para eventuais erros de conversao de tipo (Integer)
				try {
					aluno.setidAluno(Integer.parseInt(teclado.nextLine()));
					break;
				} catch (NumberFormatException e) {
					System.out.println("Digite um número válido\n");
				}
			}

			//Verifica se o Id ja nao existe no banco de dados
			valid = bancoDeDadosConect.procurarid(aluno.getidAluno());
			if (valid == null) {
				System.out.println(bancoDeDadosConect.getMensagem());
				return;
			} else if (valid != 0) {
				System.out.println("Esse Id ja existe!!\n");
			} else {
				break;
			}

		}
		
		// Nome
		System.out.println("Digite o seu nome:");
		aluno.setNome(teclado.nextLine());

		// CPF
		while (true) {
			
			//Verifica se o CPF é valido
			while (true) {
				System.out.println("Digite o seu CPF:");
				if (aluno.setCPF(teclado.nextLine())) {
					break;
				} else {
					System.out.println("Digite um CPF valido!!\n");
				}
			}
			
			//Verifica se o CPF ja nao existe no banco de dados
			valid = bancoDeDadosConect.procurarCPF(aluno.getCPF(), null);
			if (valid == null) {
				System.out.println(bancoDeDadosConect.getMensagem());
				return;
			} else if (valid != 0) {
				System.out.println("Esse CPF ja existe!!\n");
			} else {
				break;
			}
		}

		// Data de nascimento
		String dataS[] = { "dia", "mes", "ano" };
		int data[] = new int[3];
		for (int n = 0; n < 3; n++) {
			do {
				while (true) {
					System.out.println("Digite o " + dataS[n] + " de nascimento:");
					
					// "try" - protege o codigo para eventuais erros de conversao de tipo (Integer)
					try {
						data[n] = Integer.parseInt(teclado.nextLine());
						break;
					} catch (NumberFormatException e) {
						System.out.println("Digite um número válido\n");
					}
				}
				// Verifica se a data inserida é válida
				if (data[n] <= 0 || (n == 0 && data[n] > 31 || n == 1 && data[n] > 12
						|| n == 2 && (data[n] < 1900 || data[n] > 2010))) {
					System.out.println("Numero invalido!!\n");
					data[n] = 0;
				}
			} while (data[n] <= 0);
		}
		//Armazena a data de nascimento
		aluno.setdtNasc(data[0], data[1], data[2], null);
		
		// Tutor
		while (true) {
			System.out.println("Digite o id do Tutor:");
			
			// "try" - protege o codigo para eventuais erros de conversao de tipo (Integer)
			try {
				aluno.setidTutor(Integer.parseInt(teclado.nextLine()));
				break;
			} catch (NumberFormatException e) {
				System.out.println("Numero invalido!!\n");
			}
		}

		// Departamento
		while (true) {
			System.out.println("Digite o id do departamento");
			
			// "try" - protege o codigo para eventuais erros de conversao de tipo (Integer)
			try {
				aluno.setidDepart(Integer.parseInt(teclado.nextLine()));
				break;
			} catch (NumberFormatException e) {
				System.out.println("Numero invalido!!\n");
			}
		}

		// turma
		do {
			while (true) {
				System.out.println("Digite os id das turmas que esta cursando(max 6 turmas):");
				
				// "try" - protege o codigo para eventuais erros de conversao de tipo (Integer)
				try {
					i = aluno.setTurma(Integer.parseInt(teclado.nextLine()));
					break;
				} catch (NumberFormatException e) {
					System.out.println("Numero invalido!!\n");
				}
			}
			
			//Limita a quantidade de turma em 6
			if (i < 6) {
				System.out.println("Voce pode cadastrar +" + (6 - i) + " turmas, deseja continuar registrando?");
				continua = teclado.nextLine();
			} else {
				System.out.println("Limite de turmas alcançado!!\n");
				break;
			}
		} while ((continua.equals("Sim") || continua.equals("sim") || continua.equals("S") || continua.equals("s"))
				&& i < 6);
		
		//Cadastra o Aluno no banco de dados
		while (true) {

			flag = !bancoDeDadosConect.inserir(aluno);
			System.out.println(bancoDeDadosConect.getMensagem());
			
			//Verifica se conseguiu cadastrar
			if (flag) {
				System.out.println("Deseja tentar cadastrar o mesmos dados denovo?");
				continua = teclado.nextLine();
				if (!(continua.equals("Sim") || continua.equals("sim") || continua.equals("S")
						|| continua.equals("s"))) {
					break;
				}
			} else {
				break;
			}
		}
	}

	public void removerConta(int idAluno) {
		
		//Remove a conta do Aluno do banco de dados
		if (bancoDeDadosConect.removerTurma(idAluno)) {
			bancoDeDadosConect.removerAluno(idAluno);
		}
		System.out.println(bancoDeDadosConect.getMensagem());
	}

	public void atualizarAluno(int idAluno) {
		// Variavel
		int i;
		String continua;
		Integer valid;
		
		// Cria um objeto aluno
		Aluno aluno = new Aluno();

		// Inicio do preenchimento do objeto
		
		//Verifica se o aluno existe no banco de dados
		valid = bancoDeDadosConect.procurarid(idAluno);
		if (valid == null) {
			System.out.println(bancoDeDadosConect.getMensagem());
		} else if (valid != 0) {
			
			// Alunoid
			aluno.setidAluno(idAluno);
			
			// Nome
			System.out.println("Digite o seu nome:");
			aluno.setNome(teclado.nextLine());

			// CPF
			while (true) {
				
				//Verifica se o CPF é valido
				while (true) {
					System.out.println("Digite o seu CPF:");
					if (aluno.setCPF(teclado.nextLine())) {
						break;
					} else {
						System.out.println("Digite um CPF valido!!\n");
					}
				}
				
				//Verifica se o CPF ja nao existe no banco de dados
				valid = bancoDeDadosConect.procurarCPF(aluno.getCPF(), idAluno);
				if (valid == null) {
					System.out.println(bancoDeDadosConect.getMensagem());
					return;
				} else if (valid != 0) {
					System.out.println("Esse CPF ja existe!!\n");
				} else {
					break;
				}
			}

			// Data de nascimento
			String dataS[] = { "dia", "mes", "ano" };
			int data[] = new int[3];
			for (int n = 0; n < 3; n++) {
				do {

					while (true) {
						System.out.println("Digite o " + dataS[n] + " de nascimento:");
						
						// "try" - protege o codigo para eventuais erros de conversao de tipo (Integer)
						try {
							data[n] = Integer.parseInt(teclado.nextLine());
							break;
						} catch (NumberFormatException e) {
							System.out.println("Numero invalido!!\n");
						}
					}

					// Verifica se a data inserida é válida
					if (data[n] <= 0 || (n == 0 && data[n] > 31 || n == 1 && data[n] > 12
							|| n == 2 && (data[n] < 1900 || data[n] > 2010))) {
						System.out.println("Numero invalido!!\n");
						data[n] = 0;
					}
				} while (data[n] <= 0);
			}
			//Armazena a data de nascimento
			aluno.setdtNasc(data[0], data[1], data[2], null);
			
			// Tutor
			while (true) {
				System.out.println("Digite o id do Tutor:");
				
				// "try" - protege o codigo para eventuais erros de conversao de tipo (Integer)
				try {
					aluno.setidTutor(Integer.parseInt(teclado.nextLine()));
					break;
				} catch (NumberFormatException e) {
					System.out.println("Numero invalido!!\n");
				}
			}

			// Departamento

			while (true) {
				System.out.println("Digite o id do departamento");
				
				// "try" - protege o codigo para eventuais erros de conversao de tipo (Integer)
				try {
					aluno.setidDepart(Integer.parseInt(teclado.nextLine()));
					break;
				} catch (NumberFormatException e) {
					System.out.println("Numero invalido!!\n");
				}
			}

			// turma
			do {

				while (true) {
					System.out.println("Digite os id das turmas que esta cursando(max 6 turmas):");
					
					// "try" - protege o codigo para eventuais erros de conversao de tipo (Integer)
					try {
						i = aluno.setTurma(Integer.parseInt(teclado.nextLine()));
						break;
					} catch (NumberFormatException e) {
						System.out.println("Numero invalido!!\n");
					}
				}
				
				//Limita a quantidade de turma em 6
				if (i < 6) {
					System.out.println("Voce pode cadastrar +" + (6 - i) + " turmas, deseja continuar registrando?");
					continua = teclado.nextLine();

				} else {
					System.out.println("Limite de turmas alcançado!!\n");
					continua = "";
				}
				
			} while ((continua.equals("Sim") || continua.equals("sim") || continua.equals("S") || continua.equals("s"))
					&& i < 6);

			//Remove as turmas antigas e depois atualiza a conta do aluno
			if (bancoDeDadosConect.removerTurma(aluno.getidAluno())) {
				bancoDeDadosConect.atualizar(aluno);
			}
			System.out.println(bancoDeDadosConect.getMensagem());
		} else {
			System.out.println("A consulta não retornou resultados");
		}
	}

	public void getAluno(String nomeAluno) {
		
		//Retorna os alunos com o mesmo nome registrado no banco de dados
		List<Aluno> list = bancoDeDadosConect.procurarNome(nomeAluno);
		
		//Imprime os alunos retornados
		if (list != null) {
			Iterator<Aluno> iterator = list.iterator();
			if (iterator.hasNext()) {
				System.out.println("\nAlunos cadastrados:");
				while (iterator.hasNext()) {
					Aluno aluno = iterator.next();
					System.out.print("Id:" + aluno.getidAluno() + "\nNome: " + aluno.getNome() + "\nCPF: "
							+ ValiCPF.formatCPF(aluno.getCPF()) + "\nStatus: " + aluno.getAlStatus()
							+ "\nDepartamento: " + aluno.getNomeDepart() + "\nTutor: " + aluno.getNomeTutor()
							+ "\nData de nascimento: " + aluno.getdtNasc(0) + "-" + aluno.getdtNasc(1) + "-"
							+ aluno.getdtNasc(2));

					//Verifica se o aluno ta em alguma turma
					List<String> list1 = aluno.getDisciplina();
					Iterator<String> iterator1 = list1.iterator();
					if (list1.size() > 0) {
						System.out.print("\nEstuda as Disciplinas: ");
						while (iterator1.hasNext()) {
							String turma = iterator1.next();
							if (iterator1.hasNext()) {
								System.out.print(turma + ", ");
							} else {
								System.out.println(turma + "\n");
							}
						}
					} else {
						System.out.println("\nNão esta em nenhuma disciplina\n");
					}
				}

			} else {
				System.out.println(bancoDeDadosConect.getMensagem());
			}
		} else {
			System.out.println(bancoDeDadosConect.getMensagem());
		}

	}

	public void listar() {

		//Retorna os alunos com o mesmo nome registrado no banco de dados
		List<Aluno> list = bancoDeDadosConect.listar();
		
		//Imprime os alunos retornados
		if (list != null) {
			Iterator<Aluno> iterator = list.iterator();
			if (iterator.hasNext()) {
				System.out.println("\nAlunos cadastrados:");
				while (iterator.hasNext()) {
					Aluno aluno = iterator.next();
					System.out.print("Id:" + aluno.getidAluno() + "\nNome: " + aluno.getNome() + "\nCPF: "
							+ ValiCPF.formatCPF(aluno.getCPF()) + "\nStatus: " + aluno.getAlStatus()
							+ "\nDepartamento: " + aluno.getNomeDepart() + "\nTutor: " + aluno.getNomeTutor()
							+ "\nData de nascimento: " + aluno.getdtNasc(0) + "-" + aluno.getdtNasc(1) + "-"
							+ aluno.getdtNasc(2));

					List<String> list1 = aluno.getDisciplina();
					Iterator<String> iterator1 = list1.iterator();

					//Verifica se o aluno ta em alguma turma
					if (list1.size() > 0) {
						System.out.print("\nEstuda as Disciplinas: ");
						while (iterator1.hasNext()) {
							String turma = iterator1.next();
							if (iterator1.hasNext()) {
								System.out.print(turma + ", ");
							} else {
								System.out.println(turma + "\n");
							}
						}
					} else {
						System.out.println("\nNão esta em nenhuma disciplina\n");
					}
				}

			} else {
				System.out.println(bancoDeDadosConect.getMensagem());
			}
		} else {
			System.out.println(bancoDeDadosConect.getMensagem());
		}
	}
}
