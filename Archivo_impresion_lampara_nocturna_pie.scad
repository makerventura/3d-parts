


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

translate([0,100,0])
rotate([180,0,0]){

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
