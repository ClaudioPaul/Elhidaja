/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// Obtener el botón "Nuevo"
const nuevoBtn = document.getElementById('AbrirModal');

// Agregar un evento de escucha al botón "Nuevo"
nuevoBtn.addEventListener('click', () => {
  const modal = document.getElementById('myModal');
  const agregarBtn = document.getElementById('agregarBtn');
  const actualizarBtn = document.getElementById('actualizarBtn');

  // Mostrar el botón "Agregar" y ocultar el botón "Actualizar"
  agregarBtn.style.display = 'inline-block';
  actualizarBtn.style.display = 'none';

  // Mostrar la ventana modal
  modal.style.display = 'block';
});


// Obtener el elemento de cierre de la ventana modal
const closeBtn = document.querySelector('.close');

// Agregar un evento de escucha al elemento de cierre de la ventana modal
closeBtn.addEventListener('click', () => {
  const modal = document.getElementById('myModal');
  modal.style.display = 'none';
});

// Cerrar la ventana modal al hacer clic fuera de ella
window.addEventListener('click', (event) => {
  const modal = document.getElementById('myModal');
  if (event.target === modal) {
    modal.style.display = 'none';
  }
});