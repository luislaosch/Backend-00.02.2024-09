//6. Hacer un algoritmo en Pseint para ayudar a un trabajador a saber cu�l ser� su sueldo semanal,
//se sabe que si trabaja 40 horas o menos, se le pagar� $20 por hora, pero si trabaja m�s de 40 horas 
//entonces las horas extras se le pagar�n a $25 por hora.

Proceso Calcular_sueldo
	
	Definir sueldo,horas,hextra,pagototal Como Entero
	Escribir "Cantidad de horas laboradas en la semana: "
	leer horas
	sueldo=horas*20
	hextra=(horas-40)*5
	si horas<=40 Entonces
		pagototal=sueldo
	SiNo
		si horas>40 Entonces
			pagototal=sueldo+hextra
		FinSi
	FinSi
	Escribir "El total a cobras es de: ",pagototal
FinProceso
