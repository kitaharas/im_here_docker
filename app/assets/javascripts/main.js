
window.addEventListener('DOMContentLoaded',()=>{
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

const LoginPage = ()=>{
  ModalApp();
  LoginList();
  updateButtons();
}
  
const SignUpPage =()=>{
  const loginli = document.querySelector('.login-li');
  if(modal.classList.contains('hidden')){
    ModalApp();}
    loginli.classList.add('hidden');
    updateButtons();
}


const SignUpGaid =()=>{
  currentIndex = 1;
  updateButtons();
  moveSlides();
}

const eventModal =()=>{
  document.querySelector('.event-modal').classList.remove('hidden');
}

const eventClose = () => {
  document.querySelector('.event-modal').classList.add('hidden');
}




//  モーダルカルーセル


// window.addEventListener('DOMContentLoaded',()=>{
  
  
// });

let currentIndex = 0;
function updateButtons(){
  if(currentIndex === 0){
    next.classList.add('hidden');
    prev.classList.add('hidden');
  } else if(currentIndex === 1){
    next.classList.remove('hidden'); 
    prev.classList.add('hidden');
  } else if(currentIndex === 3){
    next.classList.add('hidden');
  } else {
    prev.classList.remove('hidden');
    next.classList.remove('hidden');
  }
}


document.addEventListener("DOMContentLoaded", function(){
  const next = document.getElementById('next');
  next.addEventListener('click',function(){
    if(!next){
      return false;
    } else {
      currentIndex++;
      updateButtons();
      moveSlides();
    }
  });
  
  
  const prev = document.getElementById('prev');
  prev.addEventListener('click',() => {
    currentIndex--;
    updateButtons();
    moveSlides();
  });
});




function moveSlides(){
  const ul = document.querySelector('.modal-ul');
  const slides = ul.children;
  const slideWidth = slides[1].getBoundingClientRect().width;
  ul.style.transform = `translateX(${-1 * slideWidth * currentIndex}px)`;
}







window.addEventListener('resize',() => {
  moveSlides();
});



// インターセクションオブザーバー

const targets = document.querySelectorAll('div.anime-section li');
const options = {
  root: null,
  threshold:1,
};

const observer = new IntersectionObserver(callback ,options);


function callback(entries, obs){
  console.log("unko");
  entries.forEach(entry => {

    if (!entry.isIntersecting){
      return;
    }

  entry.target.classList.add('appear');
  obs.unobserve(entry.target);
});
}

targets.forEach(target => {
  observer.observe(target);
});



// タブメニュー


const menuItems = document.querySelectorAll('.tab-menu li a');
const contents = document.querySelectorAll('.content');

menuItems.forEach(clickedItem => {
  clickedItem.addEventListener('click', e => {
    e.preventDefault();

    menuItems.forEach(item => {
      item.classList.remove('active');
    });
    clickedItem.classList.add('active');


    contents.forEach(content => {
      content.classList.remove('active');
    });

    document.getElementById(clickedItem.dataset.id).classList.add('active');

  });
});


// ゴーイベント

const conmodal = document.getElementById('confi-modal');
const conmask = document.getElementById('confi-mask');



function goEvent(){
  conmodal.classList.remove('hidden');
  conmask.classList.remove('hidden');
}

const confiClose = () => {
  document.querySelector('#confi-modal').classList.add('hidden');
  document.querySelector('#confi-mask').classList.add('hidden');
}