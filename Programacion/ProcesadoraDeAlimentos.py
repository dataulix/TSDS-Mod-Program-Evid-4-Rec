class ProcesadoraDeAlimentos:
    def __init__(self):
        self.carne_disponible = ['vaca', 'cerdo', 'pollo']
        self.tipologia = ['cruda', 'cocida']
        self.pesos = [1, 3]  
        self.__estado = False
        self.__piezas_cortadas = False
        self.__carne_cocinada = False  

    def procesar_carne(self, tipo_carne, tipo_coccion, peso):
        if tipo_carne not in self.carne_disponible:
            return "Tipo de carne no disponible."
        if tipo_coccion not in self.tipologia:
            return "Tipo de cocción no disponible."
        if peso not in self.pesos:
            return "Peso no válido. Solo se aceptan 1 kg o 3 kg."

        return f"Procesando {peso} kg de carne de {tipo_carne} {tipo_coccion}."

    def encender(self):
        self.__estado = True
        return 'Máquina encendida.'

    def cortar_carne(self):
        if not self.__estado:
            return 'Error: La máquina está apagada. Debes encenderla primero.'
        if not self.__piezas_cortadas:
            self.__piezas_cortadas = True
            return 'Cortando carne.'
        else:
            return 'La carne ya está cortada.'

    def cocinar_carne(self):
        if self.__piezas_cortadas and not self.__carne_cocinada:
            self.__carne_cocinada = True
            return 'Cocinando el corte de carne.'
        elif not self.__piezas_cortadas:
            return 'Primero necesitas cortar la carne.'
        else:
            return 'La carne ya está cocinada.'

    def __str__(self):
        if self.__estado and self.__carne_cocinada:
            return 'Proceso de carne terminado.'
        return 'Proceso incompleto.'    

if __name__ == '__main__':
    maquina = ProcesadoraDeAlimentos()
    print(maquina.encender())
    print(maquina.cortar_carne())
    print(maquina.procesar_carne('pollo', 'cocida', 1))
    print(maquina.cocinar_carne())
    print(maquina)
