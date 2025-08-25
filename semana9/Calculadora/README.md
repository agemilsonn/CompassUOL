# 🧮 Calculadora Simples em Python

Este é um projeto simples de uma calculadora desenvolvida em Python. Ele contém funções para as quatro operações matemáticas básicas, além de cálculo de quadrado e raiz quadrada.
O projeto também inclui uma suíte de testes completa utilizando a biblioteca `pytest` para garantir o correto funcionamento e a robustez de todas as funções, incluindo o tratamento de testes de exceções.

## ✅ Funcionalidades

A calculadora oferece as seguintes operações:

- **Soma**: Adiciona dois números.

- **Subtração**: Subtrai um número do outro.

- **Multiplicação**: Multiplica dois números.

- **Divisão**: Divide um número pelo outro, com tratamento para o erro de divisão por zero.

- **Quadrado**: Eleva um número ao quadrado.

- **Raiz Quadrada**: Calcula a raiz quadrada de um número, com tratamento para entradas de números negativos.

## 📂 Estrutura de Arquivos

O projeto está organizado da seguinte forma:

calculadora-python/
├── calculadora.py # Contém as funções lógicas da calculadora
├── test_calculadora.py # Contém os testes unitários com pytest
└── README.md # Este arquivo

## 🚀 Começando

Siga as instruções abaixo para executar o projeto e seus testes em sua máquina local:

1. Você precisa ter o Python 3 instalado. Além disso, a única dependência externa é o `pytest`.

2. **Instale o `pytest`** usando o pip (gerenciador de pacotes do Python):

```sh

pip install pytest

```

3. **Execute os testes** com o seguinte comando:

```sh

python -m pytest

```

Com isso, você verá os resultados dos testes diretamente no seu terminal.
