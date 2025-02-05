let conta=0;
let arrNroSuma=[];
function Ejercicio1() {
   /* 1. **Crear un contador simple:**  
   Crea una función que incremente un contador cada vez que se haga clic en un botón. Usa closures para evitar variables globales.*/
    conta ++;
    document.getElementById("LblEjercicio1").innerText=conta;
}
//test
function Ejercicio2(){
    /*2. **Convertir grados Celsius a Fahrenheit:**  
   Escribe una función que convierta grados Celsius a Fahrenheit y viceversa.*/

    GrCels= document.getElementById("TxtCelsius").value;
    Grfare=(GrCels* 9/5)+32
    document.getElementById("LblEjercicio2").innerText=Grfare;
}


function Ejercicio3(){
    /*3. **Sumar elementos de un array:**  
   Crea una función que reciba un array de números y devuelva la suma de todos sus elementos.*/
   NroIngr= document.getElementById("TxtNro").value;
   arrNroSuma.push(parseFloat(NroIngr));
    document.getElementById("TxtNro").value='';
}
function Ejercicio3_1(){
    let suma=0
    arrNroSuma.forEach(numReco => {
    suma+=numReco;
   });
    document.getElementById("LblEjercicio3").innerText=suma;
    arrNroSuma=[];
}


function Ejercicio4(){
    /*4. **Contar las vocales en una cadena:**  
   Escribe una función que cuente cuántas vocales hay en una cadena de texto.*/
   let vocal='aeiouAEIOU'; 
   let cadena= document.getElementById("TxtCadena").value;

   let canti=0;

   for (let m = 0; m < cadena.length; m++) {
        if (vocal.includes(cadena[m])) {
            canti++;
        }
   }
   document.getElementById("LblEjercicio4").innerText=canti +" vocales";
}


function Ejercicio5(){
    /*5.**Invertir una cadena:**  
   Crea una función que reciba una cadena y devuelva la misma cadena invertida.*/
   let cadena= document.getElementById("TxtCadena02").value;
   let cadeInver='';
   let TotCade=cadena.length-1; 

   while (TotCade>=0) {
        cadeInver += cadena[TotCade];
        TotCade--; 
   }
   document.getElementById("LblEjercicio5").innerText=cadeInver;

}

let arraNroIngre=[];
function Ejercicio6(){
    /*6. **Filtrar números pares de un array:**  
   Escribe una función que reciba un array de números y devuelva un nuevo array con solo los números pares.*/

   NroIngr02= document.getElementById("TxtNro02").value;
   arraNroIngre.push(parseFloat(NroIngr02));
   document.getElementById("TxtNro02").value='';
   
}
function Ejercicio61(){
    let arraNroPAres=[];
    arraNroIngre.forEach(Elemen01 => {
        if (Elemen01 % 2 ==0) {
            arraNroPAres.push(parseFloat(Elemen01))
        }
       });
       document.getElementById("LblEjercicio6").innerText=arraNroPAres
       arraNroIngre=[];
}
