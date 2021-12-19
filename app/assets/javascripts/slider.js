

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



document.addEventListener('DOMContentLoaded', function() {
  const hero = new HeroSliders('#swipers');
  const hero2 = new HeroSliders('#swipers2');
  const hero3 = new HeroSliders('#swipers3');
  const hero4 = new HeroSliders('#swipers4');
  const hero5 = new HeroSliders('#swipers5');
  const hero6 = new HeroSliders('#swipers6');
  hero.start();
  hero2.start();
  hero3.start();
  hero4.start();
  hero5.start();
  hero6.start();
});
