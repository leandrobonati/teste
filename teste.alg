algoritmo "Fila_de_Atendimento_Hospital"
var
    // Estrutura para armazenar os dados dos pacientes
    paciente: registro
        nome: caractere
        idade: inteiro
        queixa: caractere
        prioridade: caractere
    fimregistro
    
    fila: vetor[1..100] de paciente
    totalPacientes: inteiro

// Procedimento para exibir o menu
procedimento exibirMenu()
inicio
    escreval("1 - Inserir Paciente na Fila")
    escreval("2 - Ver Fila de Atendimento")
    escreval("3 - Chamar Próximo Paciente")
    escreval("4 - Sair")
    escreval("Escolha uma opção:")
fimprocedimento

// Procedimento para inserir um paciente na fila
procedimento inserirPaciente()
var
    novoPaciente: paciente
    i, j: inteiro
inicio
    // Leitura dos dados do novo paciente
    escreval("Informe o nome do paciente:")
    leia(novoPaciente.nome)
    escreval("Informe a idade do paciente:")
    leia(novoPaciente.idade)
    escreval("Informe a queixa do paciente:")
    leia(novoPaciente.queixa)
    escreval("Informe a prioridade do paciente (grave, medio, leve):")
    leia(novoPaciente.prioridade)
    
    // Adiciona o paciente no final da fila
    totalPacientes := totalPacientes + 1
    fila[totalPacientes] := novoPaciente
    
    // Reordena a fila com base nos critérios de prioridade e idade
    para i de 1 ate totalPacientes - 1 faca
        para j de i + 1 ate totalPacientes faca
            se (fila[i].prioridade = "grave" e fila[j].prioridade <> "grave") entao
                continue
            senao
                se (fila[i].prioridade <> "grave" e fila[j].prioridade = "grave") ou
                   (fila[i].prioridade = fila[j].prioridade e fila[i].idade < fila[j].idade) entao
                    // Troca os pacientes
                    novoPaciente := fila[i]
                    fila[i] := fila[j]
                    fila[j] := novoPaciente
                fimse
            fimse
        fimpara
    fimpara
fimprocedimento

// Procedimento para exibir a fila de atendimento
procedimento verFila()
var
    i: inteiro
inicio
    se totalPacientes = 0 entao
        escreval("A fila está vazia.")
    senao
        para i de 1 ate totalPacientes faca
            escreval(i, ". Nome: ", fila[i].nome, " Idade: ", fila[i].idade, " Queixa: ", fila[i].queixa, " Prioridade: ", fila[i].prioridade)
        fimpara
    fimse
fimprocedimento

// Procedimento para chamar o próximo paciente
procedimento chamarPaciente()
inicio
    se totalPacientes = 0 entao
        escreval("A fila está vazia.")
    senao
        escreval("Chamando paciente: ", fila[1].nome)
        // Remove o primeiro paciente da fila
        para i de 1 ate totalPacientes - 1 faca
            fila[i] := fila[i + 1]
        fimpara
        totalPacientes := totalPacientes - 1
        verFila()
    fimse
fimprocedimento

// Programa principal
var
    opcao: inteiro
inicio
    totalPacientes := 0
    repita
        exibirMenu()
        leia(opcao)
        
        escolha opcao
            caso 1
                inserirPaciente()
            caso 2
                verFila()
            caso 3
                chamarPaciente()
            caso 4
                escreval("Saindo do sistema...")
            outrocaso
                escreval("Opção inválida. Tente novamente.")
        fimescolha
    ate opcao = 4
fimalgoritmo