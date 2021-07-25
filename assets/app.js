
index=0;

var imagenes=["./assets/img/fondo1.jpg","./assets/img/fondo2.jpg","./assets/img/fondo3.png","./assets/img/fondo4.jpg","./assets/img/fondo5.jpg"];
let cuerpo=document.getElementById('cuerpo');

setInterval(changeBack,10000);



function changeBack(){

    // cuerpo.style.backgroundImage = "url('')";
    cuerpo.style.backgroundImage = `url(${imagenes[index]})`;
    index++;

    if(index == imagenes.length)
    index = 0;
}

