//Geometria de una caja parametrizada
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
    //Medida diametro de taladros:
        m=1.25;


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
        cylinder(r=m,h=15,$fn=20);
//Sup-Iz
translate([0,a-2*e-c,0])    
    translate([-l/2+e+c/2,-a/2+e+c/2,h-10])
        cylinder(r=m,h=15,$fn=20);
//Inf-Dcha
translate([l-2*e-c,0,0])
    translate([-l/2+e+c/2,-a/2+e+c/2,h-10])
        cylinder(r=m,h=15,$fn=20);
//Sup-Dcha
translate([l-2*e-c,a-2*e-c,0])
    translate([-l/2+e+c/2,-a/2+e+c/2,h-10])
        cylinder(r=m,h=15,$fn=20);
}
}
