

//Tapa superior de cierre del cabezal de la lampara:

translate([10,25,0]){
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

translate([10,-25,0])
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

translate([0,-10,36-0.1+22])
    rotate([-90,90,0])
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

//Material de soporte para la impresion del brazo porta lamparas:
color([150/255,150/255,0],0.5)
union(){
translate([40,-10,0]){
    difference(){
        cube([10,20,38-0.1]);
    translate([0.9,0.9,-1])
        cube([10-2*0.9,20-2*0.9,40]);
    }
}
translate([50,-0.45,0])
    cube([15,0.9,38+10-7.5-0.1]);
}