package instituto;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		// Variavel
		int id;
		Integer menu;
		String nome;
		BancoDeDados Banco = new BancoDeDados();
		Scanner teclado;

		// Menu
		do {
			teclado = new Scanner(System.in);

			// Menu de escolha
			while (true) {
				System.out.println("Cadastro de Estudantes:\n1 - Cadastrar\n2 - Listar\n3 - Pesquisar\n4 - Atualizar\n"
						+ "5 - Remover\n6 - Sair");
				
				// "try" - protege o codigo para eventuais erros de conversao de tipo (Integer)
				try {
					menu = Integer.parseInt(teclado.nextLine());
					break;
				} catch (NumberFormatException e) {
					System.out.println("Opção invalida!!\n");
				}
			}

			switch (menu) {
			// Criação de conta
			case 1:
				Banco.criarConta();
				break;
			// Lista as contas guardadas no sistema
			case 2:
				Banco.listar();
				break;
			// Pesquisa um Aluno
			case 3:
				System.out.println("Digite o nome do aluno:");
				nome = teclado.nextLine();
				Banco.getAluno(nome);
				break;
			// Atualiza uma conta existente
			case 4:
				while (true) {
					System.out.println("Digite o id do aluno:");

					// "try" - protege o codigo para eventuais erros de conversao de tipo (Integer)
					try {
						id = Integer.parseInt(teclado.next());
						break;
					} catch (NumberFormatException e) {
						System.out.println("Numero invalido!!\n");
					}
				}
				Banco.atualizarAluno(id);
				break;
			// Remove uma conta
			case 5:
				while (true) {
					System.out.println("Digite o id do aluno:");

					// "try" - protege o codigo para eventuais erros de conversao de tipo (Integer)
					try {
						id = Integer.parseInt(teclado.next());
						break;
					} catch (NumberFormatException e) {
						System.out.println("Numero invalido!!\n");
					}
				}
				Banco.removerConta(id);
				break;
			// Finaliza o programa
			case 6:
				System.out.println("Programa Finalizado ");
				teclado.close();
				break;
			// Informa opção invalida
			default:
				System.out.println("Opção invalida");
				break;
			}
			System.out.println("");
		} while (menu != 6);
	}

}
