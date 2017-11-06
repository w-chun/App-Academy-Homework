document.addEventListener("DOMContentLoaded", function(){

var canvas = document.getElementById('mycanvas');
canvas.height = 500;
canvas.weight = 500;

var ctx = canvas.getContext('2d');
ctx.fillStyle = "blue";
ctx.fillRect(0, 0, 500, 500);

ctx.beginPath();
ctx.arc(150, 150, 75, 0, 2 * Math.PI);
ctx.strokeStyle = "white";
ctx.lineWidth = 10;
ctx.stroke();

ctx.fillStyle = "yellow";
ctx.fill();

ctx.beginPath();
ctx.moveTo(150,50);
ctx.lineTo(100,75);
ctx.lineTo(100,25);
ctx.fillStyle = "green";
ctx.fill();


});
