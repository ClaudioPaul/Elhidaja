/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

//document.addEventListener("DOMContentLoaded", function() {
//  var modal = document.getElementById("myModal");
//  var btnAbrirModal = document.getElementById("AbrirModal");
//  var btnAgregar = document.getElementById("agregarBtn");
//  var btnActualizar = document.getElementById("actualizarBtn");
//  var btnCerrarModal = document.getElementsByClassName("close")[0];
//
//  // Abrir modal al hacer clic en el botón "Nuevo"
//  btnAbrirModal.addEventListener("click", function() {
//    modal.style.display = "block";
//    btnAgregar.style.display = "inline";
//    btnActualizar.style.display = "none";
//  });
//
//  // Cerrar modal al hacer clic en el botón "Cerrar"
//  btnCerrarModal.addEventListener("click", function() {
//    modal.style.display = "none";
//  });
// 
//  
//  // Ejecutar la ventana modal al cargar la página si hay un valor en el campo "txtDireccion"
//  window.onload = function() {
//    const ruckInput = document.querySelector('input[name="txtDireccion"]');
//    const rucValue = ruckInput.value;
//    if (rucValue) {
//      modal.style.display = "block";
//      btnAgregar.style.display = "inline";
//      btnActualizar.style.display = "none";
//    }
//  };
//});

// Obtén elementos del DOM
var modal = document.getElementById("myModal");
var modalBtn = document.getElementById("AbrirModal")
var btnAgregar = document.getElementById("agregarBtn");
var btnActualizar = document.getElementById("actualizarBtn");
var closeModalBtn = document.getElementsByClassName("close")[0];
var body = document.getElementsByTagName("body")[0];
var buscarBtnModal = document.getElementById("buscarBtnModal");
var abrirModalBtns = document.getElementsByClassName("btn-editar");



// Abrir ventana modal al hacer clic en el botón "Nuevo"
modalBtn.onclick = function() {
  modal.style.display = "block";
   btnAgregar.style.display = "inline";
   btnActualizar.style.display = "none";
};

// Cerrar ventana modal al hacer clic en la "X"
closeModalBtn.onclick = function() {
  modal.style.display = "none";
};

// Cerrar ventana modal al hacer clic en cualquier lugar fuera del modal
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
};

// Verificar si el campo de texto txtRuc tiene un valor y abrir la ventana modal automáticamente
window.onload = function() {
  var txtRuc = document.getElementsByName("txtRuc")[0];
  if (txtRuc.value) {
    modal.style.display = "block";  
  }
};

function limitarDigitos(elemento, maxLength) {
  if (elemento.value.length > maxLength) {
    elemento.value = elemento.value.slice(0, maxLength);
  }
}
