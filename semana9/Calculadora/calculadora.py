def soma(a, b):
    return a + b

def sub(a, b):
    return a - b

def multi(a, b):
    return a * b

def div(a, b):
    if b == 0:
        raise ValueError("Não é possível dividir por 0")
    return a / b

def power2(a):
    return a * a

def sqrt(a):
    if a < 0:
        raise ValueError("Não é possível calcular a raiz quadrada de um número negativo")
    return a ** 0.5
