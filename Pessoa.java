package instituto;

import java.sql.Date;
import java.util.Calendar;

public class Pessoa {
	// Variavel
	private String nome, cpf;
	private Calendar dtNasc;

	//Construtor
	public Pessoa() {
		dtNasc = Calendar.getInstance();
	}

	public void setNome(String nome) {
		// Armazena o nome
		this.nome = nome;
	}

	public String getNome() {
		// Retorna nome
		return this.nome;
	}

	public boolean setCPF(String cpf) {
		// Armazena o CPF
		this.cpf = cpf;
		
		//Retorna se o CPF é valido
		return ValiCPF.isCPF(cpf);
	}

	public String getCPF() {
		//Retorna o cpf
		return cpf;
	}

	public void setdtNasc(int d, int m, int y, Date n) {
		if (n == null) {
			//Armazena a data de nascimento usando int
			dtNasc.set(y, m, d);
		} else {
			//Converte Date para Calendar
			dtNasc.setTime(n);
			dtNasc.set(Calendar.MONTH, dtNasc.get(Calendar.MONTH) + 1);
		}
	}

	public Integer getdtNasc(int n) {
		//Retorna o ano de nascimento
		if (n == 2) {
			//Calendar incrementa 1 ano se o mes for 12, então retorna o decremento do ano se o mes for 12
			if (dtNasc.get(Calendar.MONTH) == 0) {
				return this.dtNasc.get(Calendar.YEAR) - 1;
			}
			return this.dtNasc.get(Calendar.YEAR);
		//Retorna o mes de nascimento	
		} else if (n == 1) {
			//Calendar armazena mes 12 como 0, então se for 0 ele retorna 12
			if (dtNasc.get(Calendar.MONTH) == 0) {
				return 12;
			}
			return this.dtNasc.get(Calendar.MONTH);
		//Retorna o dia
		} else {
			return this.dtNasc.get(Calendar.DAY_OF_MONTH);
		}

	}

}
