# Automação de Testes com Robot Framework - Restful Booker

Este projeto contém testes de automação para a API [Restful-Booker](https://restful-booker.herokuapp.com/apidoc/index.html), utilizando o **Robot Framework** e a **RequestsLibrary**.

## 🔧 Pré-requisitos

Antes de executar os testes, é necessário ter instalado:

- [Python 3](https://www.python.org/downloads/)
- [pip](https://pip.pypa.io/en/stable/)

Em seguida, instale o Robot Framework e a RequestsLibrary:

```bash
pip install robotframework
pip install robotframework-requests
```
Verifique se a instalação foi concluída com sucesso:
```bash
robot --version
```
## 📂 Estrutura do Projeto

```
.
├── booking.robot   # Arquivo com todos os casos de teste
└── README.md                    # Documentação do projeto
```

## 🚀 Executando os Testes
Na raiz do projeto, execute:

```bash
robot booking.robot
```

## ✅ Casos de Teste Implementados
- Criar Token de Autenticação (POST /auth)
Gera um token válido para ser utilizado nas requisições que exigem autenticação.
- Listar Bookings (GET /booking)
Consulta todas as reservas disponíveis.
- Criar Booking (POST /booking)
Cria uma nova reserva.
- Atualizar Booking (PUT /booking/{id})
Atualiza os dados de uma reserva existente, utilizando o token.
- Deletar Booking (DELETE /booking/{id})
Remove uma reserva existente, utilizando o token.

## 📊 Relatórios de Execução
Após rodar os testes, o Robot Framework gera automaticamente 3 arquivos na pasta do projeto:

- log.html → Detalhes da execução
- report.html → Resumo dos testes
- output.xml → Saída no formato XML

Abra o report.html no navegador para visualizar os resultados.
