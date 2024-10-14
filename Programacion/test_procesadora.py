import pytest
from ProcesadoraDeAlimentos import ProcesadoraDeAlimentos  

def test_encender_maquina():
    maquina = ProcesadoraDeAlimentos()
    assert maquina.encender() == 'Máquina encendida.'

def test_cortar_carne_apagada():
    maquina = ProcesadoraDeAlimentos()
    assert maquina.cortar_carne() == 'Error: La máquina está apagada. Debes encenderla primero.'

def test_cortar_carne():
    maquina = ProcesadoraDeAlimentos()
    maquina.encender()
    assert maquina.cortar_carne() == 'Cortando carne.'
    assert maquina.cortar_carne() == 'La carne ya está cortada.'

def test_procesar_carne_tipo_no_disponible():
    maquina = ProcesadoraDeAlimentos()
    maquina.encender()
    maquina.cortar_carne()
    assert maquina.procesar_carne('pato', 'cocida', 1) == 'Tipo de carne no disponible.'

def test_procesar_carne_tipo_coccion_no_disponible():
    maquina = ProcesadoraDeAlimentos()
    maquina.encender()
    maquina.cortar_carne()
    assert maquina.procesar_carne('pollo', 'asada', 1) == 'Tipo de cocción no disponible.'

def test_procesar_carne_peso_no_valido():
    maquina = ProcesadoraDeAlimentos()
    maquina.encender()
    maquina.cortar_carne()
    assert maquina.procesar_carne('pollo', 'cocida', 2) == 'Peso no válido. Solo se aceptan 1 kg o 3 kg.'

def test_procesar_carne_exitoso():
    maquina = ProcesadoraDeAlimentos()
    maquina.encender()
    maquina.cortar_carne()
    assert maquina.procesar_carne('pollo', 'cocida', 1) == 'Procesando 1 kg de carne de pollo cocida.'

def test_cocinar_carne_sin_cortar():
    maquina = ProcesadoraDeAlimentos()
    maquina.encender()
    assert maquina.cocinar_carne() == 'Primero necesitas cortar la carne.'

def test_cocinar_carne():
    maquina = ProcesadoraDeAlimentos()
    maquina.encender()
    maquina.cortar_carne()
    maquina.procesar_carne('pollo', 'cocida', 1)
    assert maquina.cocinar_carne() == 'Cocinando el corte de carne.'
    assert maquina.cocinar_carne() == 'La carne ya está cocinada.'

def test_str_proceso_incompleto():
    maquina = ProcesadoraDeAlimentos()
    assert str(maquina) == 'Proceso incompleto.'
    
def test_str_proceso_terminado():
    maquina = ProcesadoraDeAlimentos()
    maquina.encender()
    maquina.cortar_carne()
    maquina.procesar_carne('pollo', 'cocida', 1)
    maquina.cocinar_carne()
    assert str(maquina) == 'Proceso de carne terminado.'


if __name__ == '__main__':
    pytest.main()

    