/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const sidebar = document.querySelector(".sidebar");
const sidebarClose = document.querySelector("#sidebar-close");
const menu = document.querySelector(".menu-content");
const menuItems = document.querySelectorAll(".submenu-item");
const subMenuTitles = document.querySelectorAll(".submenu .menu-title");
const dropdownButton = document.querySelector("#dropdownMenuButton");

sidebarClose.addEventListener("click", () => {
  sidebar.classList.toggle("close");
  updateDropdownButtonVisibility();
});

menuItems.forEach((item, index) => {
  item.addEventListener("click", () => {
    menu.classList.add("submenu-active");
    item.classList.add("show-submenu");
    menuItems.forEach((item2, index2) => {
      if (index !== index2) {
        item2.classList.remove("show-submenu");
      }
    });
    updateDropdownButtonVisibility();
  });
});

subMenuTitles.forEach((title) => {
  title.addEventListener("click", () => {
    menu.classList.remove("submenu-active");
    updateDropdownButtonVisibility();
  });
});

function updateDropdownButtonVisibility() {
  const isMobile = window.matchMedia("(max-width: 400px)").matches;
  const isSidebarClosed = sidebar.classList.contains("close");
  dropdownButton.style.display = isMobile && isSidebarClosed ? "block" : "none";

  if (!isMobile) {
    dropdownButton.style.display = "block";
  }
}

// Llamamos a la función inicialmente para establecer la visibilidad correcta
updateDropdownButtonVisibility();

// Agregamos un evento de redimensionamiento de ventana para actualizar la visibilidad del dropdownButton si el ancho de la ventana cambia
window.addEventListener("resize", updateDropdownButtonVisibility);