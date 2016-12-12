//Autor : Santiago Ventura , 2016
//Curso UNIR Experto Universitario en Robotica,Programacion e impresion 3D
//Piezas de la Farola Nocturna
//Actividad 3 de Bitbloq



//Tapa superior de cierre del cabezal de la lampara:
translate([0,36-10,0])
rotate([0,0,90])
translate([0,0,260]){
    rotate([180,0,0])
union(){
    difference(){
        cylinder(d=44,h=1,$fn=100);
     translate([-6.5,0,-1])   
        cylinder(d=10,h=3,$fn=100);
    }
    translate([0,0,1]){
    difference(){    
        cylinder(d=42,h=2,$fn=100);
    translate([0,0,-1])    
        cylinder(d=40.2,h=4,$fn=100);
    }
    }
}    
}




// Soporte porta led + sensor de luz:

translate([0,36-10,0])
rotate([0,0,90])
    translate([0,0,230])
difference(){
//Base del soporte:
cylinder(d=41,h=5,$fn=100);

//Taladros para el paso de los tornillos:

    translate([-6.5,10,-1])
        cylinder(d=3.5,h=7,$fn=50);
mirror([0,-20,0]){
    translate([-6.5,10,-1])
        cylinder(d=3.5,h=7,$fn=50);
}

//Hueco para evitar los puntos de soldadura de las placas:

    translate([-15,-5,-1])
        cube([11,10,7]);
}




// Lampara:
translate([-10,0,160])
rotate([90,0,90])
translate([-10,0,0])
union(){
     
//Brazo semicilindrico + pivote inferior de la lampara:

difference(){
//Union de todo el exterior de la lampara:

union(){
//Medio cilindro exterior de la farola
difference(){
cylinder(d=100,h=20,$fn=100);
translate([0,0,-10])
cylinder(d=80,h=40,$fn=100);
translate([60,0,0])
cube(120,center=true);
}

//Cubo de enlace entre el soporte vertical y el cilindro empotrado
    translate([0,-50,0])
        cube([20,10,20]);
      
//Superficie exterior del cilindro empotrado en la caja

translate([10,-50,10])
    rotate([90,0,0])
        cylinder(d=15,h=15,$fn=100);

}

//Union del vaciado interior de la lampara:

union(){
//Vaciado de la columna de apoyo cilindrica:
difference(){
translate([0,0,0.9])
cylinder(d=98.2,h=18.2,$fn=100);
translate([0,0,-10])
cylinder(d=81.8,h=40,$fn=100);
translate([60,0,0])
cube(120,center=true);
}

//Vaciado del cubo de apoyo inferior:

    translate([-0.1,-50+0.9,0.9])
        cube([19.1,8.2,18.2]);

//Vaciado del cilindro empotrado:

translate([10,-50+2,10])
    rotate([90,0,0])
        cylinder(d=13.2,h=20,$fn=100);

    }
}  


//Diseño del porta-luz + porta-sensor luz , y del cajeado para los conectores de plastico:

translate([36-0.1,50-27,10])
    rotate([-90,0,0])
difference(){
union(){
//Carcasa exterior cilindrica hueca, alojamiento de los blocks del led y el sensor de luz , con paso para el plafon:
    
  difference(){
        cylinder(d=44,h=27,$fn=100);
    translate([0,0,1])
        cylinder(d=44-1.8,h=27,$fn=100);
    translate([0,0,-1])  
        cylinder(d=9.5,h=3,$fn=100);
  }
 
 //Pestaña conica invertida para sujetar el porta sensores por presion:
  
 translate([0,0,10]){
     difference(){
        cylinder(d=42,h=5,$fn=100);
    translate([0,0,-1])
        cylinder(d=40,h=7,$fn=100);
    translate([0,0,-0.1])
        cylinder(d1=40,d2=42,h=6,$fn=100);
     }
 }

//Caja hueca que cubre los conectores de los blocks:

difference(){
    translate([-36,-10,0])
        cube([20,20,27]);
    translate([0,0,-1])
        cylinder(d=43,h=29,$fn=100); 
}
}
    translate([-36+0.9,-10+0.9,0.9])
        cube([30,20-1.8,27-1.8]);
    translate([-37,-10+0.9,17+0.9])
        cube([5,20-1.8,10-1.8]);
}
}


// Simulacion del Plafón de plastico translucido que cubre el led:

translate([0,36-10,160])
color([1,1,1],0.5)
sphere(d=40,$fn=100);

//Pie de la lampara donde se alojan el porta-pilas y la placa controladora:

translate([0,0,0]) {
//Caja parametrizada:

//Parametros :
    //Largo de la caja :
        l=120;
    //Ancho de la caja :
        a=70;
    //Alto de la caja :( minimo = 10+e )
        h=60;
    //Espesor de la caja :
        e=4;
    //Medida columna atornillado :
        c=6;


//Caja + columnas con agujeros tornillos
difference(){
// Caja hueca + 4 columnas macizas       
union(){
    translate([-l/2,-a/2,0])
difference(){
//Superficie exterior
    cube([l,a,h]);
//Hueco interior
translate([e,e,e/2])
    cube([l-2*e,a-2*e,h]);
}

//Columnas para atornillar la tapa

//Col inf izq
    translate([-l/2+e,-a/2+e,e/2])
        cube([c,c,h-e/2]);
//Col sup izq
    translate([-l/2+e,a/2-e-c,e/2])
        cube([c,c,h-e/2]);
//Col inf drcha
    translate([l/2-e-c,-a/2+e,e/2])
        cube([c,c,h-e/2]);
//Col sup drcha
    translate([l/2-e-c,a/2-e-c,e/2])
        cube([c,c,h-e/2]);
}

//Matriz de Agujeros para atornillar la tapa superior
union(){
//Inf-Iz
    translate([-l/2+e+c/2,-a/2+e+c/2,h-10])
        cylinder(r=1.25,h=15,$fn=20);
//Sup-Iz
translate([0,a-2*e-c,0])    
    translate([-l/2+e+c/2,-a/2+e+c/2,h-10])
        cylinder(r=1.25,h=15,$fn=20);
//Inf-Dcha
translate([l-2*e-c,0,0])
    translate([-l/2+e+c/2,-a/2+e+c/2,h-10])
        cylinder(r=1.25,h=15,$fn=20);
//Sup-Dcha
translate([l-2*e-c,a-2*e-c,0])
    translate([-l/2+e+c/2,-a/2+e+c/2,h-10])
        cylinder(r=1.25,h=15,$fn=20);
}
}
}





//Tapa que cubre el pie de la lampara y da soporte al boton pulsador y al led ON/OFF:

//Tapa parametrizada

//Parametros :
    //Largo de la tapa :
        l=120;
    //Ancho de la tapa :
        a=70;
    //Alto de la caja :
        h=0;
    //Espesor de la caja :
        e=4;
    //Medida columna atornillado :
        c=6;
    //Diametro del tubo encastrado :
        tubo=15.25;


translate([0,0,90]){

//Tapa final :

//Vaciamos el paso del tapón de plastico del pulsador:

difference(){

//Tapa menos el vaciado central para acoplamiento de tubo Diametro=tubo:

difference(){
//Union de la tapa y la columna central maciza:

union(){
//Tapa con los pasos de los tornillos de union a la caja:

difference(){
    
//Tapa unida a los topes de colocacion del boton:

union(){
    
//Tapa de la caja en bruto
    translate([0,0,h])
        cube([l,a,e/2],center=true);

//Columnas de atornillado y tope del actuador boton con el vaciado de los taladros de los tornillos:
    
translate([l/2-20,-(a/2-12),h-(7/2+e/4)]){
difference(){
//Columnas macizas para hacer de tope y atornillar el pulsador a la tapa
union(){
        cube([6,6,7],center=true);
    translate([0,20,0])
        cube([6,6,7],center=true);
}

//Vaciado de los taladros de M3 de los topes
union(){
    translate([0,0,-5]){
        cylinder(r=1.5,h=10,$fn=20);
    translate([0,20,0])
        cylinder(r=1.5,h=10,$fn=20);
    }
}
}
}


//Columnas de atornillado y tope del block LED ON/OFF, con el vaciado de los taladros de los tornillos

translate([-10,0,0]){
mirror([0,1,0]){
translate([l/2-20,-(a/2-12),h-(7/2+e/4)]){
difference(){
//Columnas macizas para hacer de tope y atornillar el pulsador a la tapa
union(){
        cube([6,6,7],center=true);
    translate([0,20,0])
        cube([6,6,7],center=true);
}

//Vaciado de los taladros de M3 de los topes
union(){
    translate([0,0,-5]){
        cylinder(r=1.5,h=10,$fn=20);
    translate([0,20,0])
        cylinder(r=1.5,h=10,$fn=20);
    }
}
}
}
}
}
}
//Matriz de taladros pasantes de la tapa superior

union(){
//Inf-Iz
    translate([-l/2+e+c/2,-a/2+e+c/2,h-10])
        cylinder(r=1.7,h=15,$fn=20);
//Sup-Iz
translate([0,a-2*e-c,0])    
    translate([-l/2+e+c/2,-a/2+e+c/2,h-10])
        cylinder(r=1.7,h=15,$fn=20);
//Inf-Dcha
translate([l-2*e-c,0,0])
    translate([-l/2+e+c/2,-a/2+e+c/2,h-10])
        cylinder(r=1.7,h=15,$fn=20);
//Sup-Dcha
translate([l-2*e-c,a-2*e-c,0])
    translate([-l/2+e+c/2,-a/2+e+c/2,h-10])
        cylinder(r=1.7,h=15,$fn=20);
}
}

//Columna central de anclaje para un tubo de Dn=tubo :
    translate([0,0,-15-e/4])
        cylinder(d=tubo+4,h=15,$fn=100);
}

//Union de los dos vaciados de la columna central:

union(){

//vaciado para hacer la pestaña inferior de apoyo:
    translate([0,0,-2-14.9-e/4])
        cylinder(d=tubo-2,h=4,$fn=100);
//Vaciado interior de Dn=tubo :
    translate([0,0,2-15-e/4])
        cylinder(d=tubo+0.2,h=15+e/2,$fn=100);

}
}
//Cilindro para hacer el vaciado en la tapa para el paso del pulsador:

    translate([l/2-17,-a/2+12+10,-5]) 
        cylinder(d=13.5,h=e/2+10,$fn=100);

//Cilindro para hacer el vaciado en la tapa para el paso del led ON/OFF:

translate([-10,0,0]){
mirror([0,1,0]){
    translate([l/2-17+3.5,-a/2+12+10,-5]) 
        cylinder(d=6,h=e/2+10,$fn=100);
}
}
}




}






//Fin del programa