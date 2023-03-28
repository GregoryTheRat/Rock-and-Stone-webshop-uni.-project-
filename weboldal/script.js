function activateNavItem(element) {
  const activeNavItem = document.querySelector(".navbar a.active");
  if (activeNavItem !== null) {
    activeNavItem.classList.remove("active");
  }
  element.classList.add("active");
  if (element.id === "index-link") {
    document.getElementById("login-link").classList.remove("active");
    document.getElementById("register-link").classList.remove("active");
  }
}
