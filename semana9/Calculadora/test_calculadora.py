import pytest
from calculadora import *


def test_soma():
    assert soma(5, 5) == 10
    assert soma(100, 10) == 110
    assert soma(25, 12) != 27

def test_sub():
    assert sub(5, 5) == 0
    assert sub(10, 100) == -90
    assert sub(25, 12) != 12

def test_multi():
    assert multi(5, 3) == 15
    assert multi(11, 3) == 33
    assert multi(12, 0) == 0

def test_div():
    assert div(10, 2) == 5
    assert div(5, 2) == 2.5
    with pytest.raises(ValueError):
        div(10, 0)


def test_power2():
    assert power2(5) == 25
    assert power2(0) == 0
    assert power2(-3) == 9
    assert power2(1.5) == 2.25

def test_sqrt():
    assert sqrt(25) == 5
    assert sqrt(0) == 0
    assert sqrt(2) == pytest.approx(1.41421356)
    with pytest.raises(ValueError):
        sqrt(-4)

