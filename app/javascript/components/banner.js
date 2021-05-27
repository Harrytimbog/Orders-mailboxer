import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Free food for wolf cronies", "first come first serve"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
