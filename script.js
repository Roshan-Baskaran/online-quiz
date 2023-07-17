$('.floating-btn').on('click', function() {
    $('.social-panel-container').toggleClass('visible');
});

$('.close-btn').on('click', function() {
    $('.social-panel-container').removeClass('visible');
});

document.getElementById("login-button").addEventListener("click", login);
  function login() {
    window.location.href = "Login/log.html";
  }

  function redirectToLoginPage() {
  window.location = "file:///D:/online%20quiz/Register/login.html";
}
function startQuiz() {
  window.location.href = "Questions/questions.html";
}
function home(){
  window.location.href="Home/home.html";
}
