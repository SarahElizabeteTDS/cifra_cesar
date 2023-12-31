programa
{
	inclua biblioteca Tipos --> ti
	inclua biblioteca Texto --> t
	const cadeia alfabeto[26] = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}
	
	funcao inicio()
	{
		inteiro acao
		cadeia fraseAq
		inteiro chaveAq
		escreva("Olá! Você gostaria de criptografar, ou descriptografar uma frase?\nDigite 0 para criptografar\nDigite 1 para descriptografar\n")
		leia(acao)
			enquanto(acao != 0 e acao != 1)
			{
				escreva("Opcao invalida, tente novamente!\n")
				leia(acao)
			}
			se(acao == 0)
			{
				escreva("Você selecionou criptografar!\nDigite a frase (Em letras maiúsculas!):\n")
				leia(fraseAq)
				limpa()
				escreva("Insira a chave:\n")
				leia(chaveAq)
				limpa()
				criptografar(fraseAq,chaveAq)
			}
			senao se(acao == 1)
			{
				escreva("Você selecionou descriptografar!\nDigite a frase (Em letras maiúsculas!):\n")
				leia(fraseAq)
				escreva("Caso você tenha a chave da mensagem, digite-a.\nCaso não tenha, digite 0\n")
				leia(chaveAq)
					se(chaveAq != 0)
					{
						limpa()
						descriptografar(fraseAq,chaveAq)
					}
					senao
					{
						limpa()
						descriptografarSemChave(fraseAq,chaveAq)
					}
			}
		 
	}//fim inicio

	
	funcao criptografar(cadeia frase, inteiro chave)
	{
		cadeia letra = " "
		caracter letraCaracter = ' '
		inteiro posicao
		inteiro numeroLetras 
		logico estaNoAlfabeto

		numeroLetras = t.numero_caracteres(frase)

		//percorrer as letras especificas
		para(inteiro j=0; j < numeroLetras; j++)
		{
			estaNoAlfabeto = falso
			
			letraCaracter = t.obter_caracter(frase, j)
			letra = ti.caracter_para_cadeia(letraCaracter)
			
			//pos letra, percorre tudo
			para(inteiro i=0; i < 26; i++)
			{
				se(letra == alfabeto[i])
				{
					posicao = i + chave
					posicao = posicao % 26
					
					escreva(alfabeto[posicao])

					estaNoAlfabeto = verdadeiro
					pare
				}//fim se
			}//fim para
			se(estaNoAlfabeto == falso)
			{
				escreva(letra)
			}
		}//fim para2
	}//fim funcao cripto



	funcao descriptografar(cadeia frase, inteiro chave)
	{
		cadeia letra = " "
		caracter letraCaracter = ' '
		inteiro posicao
		inteiro numeroLetras 
		logico estaNoAlfabeto

		numeroLetras = t.numero_caracteres(frase)

		//percorrer as letras especificas
		para(inteiro j=0; j < numeroLetras; j++)
		{
			estaNoAlfabeto = falso
			
			letraCaracter = t.obter_caracter(frase, j)
			letra = ti.caracter_para_cadeia(letraCaracter)
			
			//pos letra, percorre tudo
			para(inteiro i=0; i < 26; i++)
			{
				se(letra == alfabeto[i])
				{
					posicao = i - chave
					se(posicao < 0)
					{
						posicao = posicao + 26
					}
					escreva(alfabeto[posicao])

					estaNoAlfabeto = verdadeiro
					pare
				}//fim se
			}//fim para
			se(estaNoAlfabeto == falso)
			{
				escreva(letra)
			}
		}//fim para2
	}//fim funcao descriptografar

	funcao descriptografarSemChave(cadeia frase, inteiro chave)
	{
		cadeia letra = " "
		caracter letraCaracter = ' '
		inteiro posicao
		inteiro numeroLetras 
		logico estaNoAlfabeto = falso

		numeroLetras = t.numero_caracteres(frase)
		
		para(chave = 0; chave < 26; chave++)
		{	
			escreva("Chave:",chave+1,"\n")
			
			para(inteiro j=0; j < numeroLetras; j++)
			{
				estaNoAlfabeto = falso
			
				letraCaracter = t.obter_caracter(frase, j)
				letra = ti.caracter_para_cadeia(letraCaracter)
		
			
				para(inteiro i=0; i < 26; i++)
				{	
					se(letra == alfabeto[i])
					{
						posicao = (i - chave + 26) % 26
						escreva(alfabeto[posicao])
						estaNoAlfabeto = verdadeiro
						
					}//fim se
				}//fim para2
			 }//fim para1
	
		se(estaNoAlfabeto == falso)
		{
			escreva(letra)
		}//fim se

		escreva("\n")
			
		}//fim para chave
	}//fim funcao sem chave
}
