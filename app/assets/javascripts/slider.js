$(document).on('turbolinks:load', function() { 
class HeroSliders {
  constructor(el) {
    this.el = el;
    this.swiper = this.__initSwiper();
  }

  __initSwiper() {
    return new Swiper(this.el, {
      loop: true,
      grabCursor: true,
      effect: 'slide',
      slidesPerView: 3.5,
      spaceBetween: 10,
      speed: 1000,
    });
  }

  start(options = {}) {
    options = Object.assign({
      delay: 5000,
      disableOnInteraction: false
    }, options);
    this.swiper.params.autoplay =
      options;
    this.swiper.autoplay.start();
  }
}




  const hero0 = new HeroSliders('#swiper0');
  const hero1 = new HeroSliders('#swiper1');
  const hero2 = new HeroSliders('#swiper2');
  const hero3 = new HeroSliders('#swiper3');
  const hero4 = new HeroSliders('#swiper4');
  const hero5 = new HeroSliders('#swiper5');
  hero0.start();
  hero1.start();
  hero2.start();
  hero3.start();
  hero4.start();
  hero5.start();


});
