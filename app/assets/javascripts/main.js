$(document).on('turbolinks:load', function() { 
  const close = document.getElementById('close');
  const mask = document.getElementById('mask');
  const modal = document.getElementById('modal');
  
  close.addEventListener('click', ()=>{
    modal.classList.add('hidden');
    mask.classList.add('hidden');
    currentIndex = 0;
    moveSlides();
  });



});



function Next(){
  const next = document.getElementById('next');
  if(!next){
    return false;
  } else {
    currentIndex++;
    updateButtons();
    moveSlides();
  }
}

function Prev(){
  currentIndex--;
  updateButtons();
  moveSlides();
}

function LoginList(){
  const loginli = document.querySelector('.login-li');
  if(loginli.classList.contains('hidden')){
    loginli.classList.remove('hidden');
  }
}

function ModalApp(){
  modal.classList.remove('hidden');
  mask.classList.remove('hidden');
}

function LoginPage(){
  ModalApp();
  LoginList();
}

function SignUpPage(){
  const loginli = document.querySelector('.login-li');
  if(modal.classList.contains('hidden')){
    ModalApp();
  }
  loginli.classList.add('hidden');
}

function SignUpGaid(){
  document.querySelector('.login-li').classList.add('hidden');
  currentIndex = 1;
  updateButtons();
  moveSlides();
}

function eventModal(){
  document.querySelector('.event-modal').classList.remove('hidden');
}

function eventClose(){
  document.querySelector('.event-modal').classList.add('hidden');
}

//  モーダルカルーセル

function updateButtons(){
  const close = document.getElementById('close');
  if(currentIndex === 0){
    next.classList.add('hidden');
    prev.classList.add('hidden');
  } else if(currentIndex === 1){
    close.classList.add('hidden');
    next.classList.remove('hidden'); 
    prev.classList.add('hidden');
  } else if(currentIndex === 3){
    // close.classList.remove('hidden');
    next.classList.add('hidden');
  } else {
    prev.classList.remove('hidden');
    next.classList.remove('hidden');
  }
}

function moveSlides(){
  const ul = document.querySelector('.modal-ul');
  const slides = ul.children;
  const slideWidth = slides[1].getBoundingClientRect().width;
  ul.style.transform = `translateX(${-1 * slideWidth * currentIndex}px)`;
}

// window.addEventListener('resize',() => {
//   moveSlides();
// });

// ゴーイベント

function goEvent(){
  document.querySelector('#confi-modal').classList.remove('hidden');
  document.querySelector('#confi-mask').classList.remove('hidden');
}

function confiClose(){
  document.querySelector('#confi-modal').classList.add('hidden');
  document.querySelector('#confi-mask').classList.add('hidden');
}
