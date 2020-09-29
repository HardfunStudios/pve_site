import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'
 
Vue.use(VueResource);
Vue.use(TurbolinksAdapter);
 
document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  
  var matrices = document.getElementById('animated-matrix');
  if (matrices != null) {
    new Vue({
      el: matrices,
      data: {
        activeBtn: ''
      },
      methods: {
        toggleSelected: function(btn) {
          this.activeBtn = btn;

        }
      }
    });
  }
  
  var gestores = document.getElementById('top-buttons-gestores');
  if (gestores != null) {
    new Vue({
      el: gestores,
      data: {
        activeBtn: (sessionStorage.getItem('pve_button_1') == null) ? '0' : sessionStorage.getItem('pve_button_1'),
        categories: ['gestor-category-0', 'gestor-category-1', 'gestor-category-2']
      },
      methods: {
        toggleSelected: function(btn) {
          this.activeBtn = btn;
          this.categories.forEach(function(category) {
            document.getElementById(category).classList.add('hidden');
          });
          document.getElementById(this.categories[parseInt(btn)]).classList.remove('hidden');

          Array.prototype.forEach.call(document.getElementsByClassName("post-card-preview"), function(el) {
            if (el.classList.contains('post-cat-' + btn)) {
              el.classList.remove('hidden');
            } else {
              el.classList.add('hidden');
            }
          });
          sessionStorage.setItem('pve_button_1', btn);
        }
      },
      created () {
        this.toggleSelected(this.activeBtn);
      }
    });
  }
  
  var familias = document.getElementById('top-buttons-familias');
  if (familias != null) {
    new Vue({
      el: familias,
      data: {
        activeBtn: (sessionStorage.getItem('pve_button_2') == null) ? '5' : sessionStorage.getItem('pve_button_2'),
        categories: ['familia-category-5', 'familia-category-6', 'familia-category-7']
      },
      methods: {
        toggleSelected: function(btn) {
          this.activeBtn = btn;
          this.categories.forEach(function(category) {
            document.getElementById(category).classList.add('hidden');
          });
          document.getElementById('familia-category-' + btn).classList.remove('hidden');

          Array.prototype.forEach.call(document.getElementsByClassName("post-card-preview"), function(el) {
            if (el.classList.contains('post-cat-' + btn)) {
              el.classList.remove('hidden');
            } else {
              el.classList.add('hidden');
            }
          });
          sessionStorage.setItem('pve_button_2', btn);
        }
      },
      created () {
        this.toggleSelected(this.activeBtn);
      }
    });
  }
  
  var professores = document.getElementById('top-buttons-professores');
  if (professores != null) {
    new Vue({
      el: professores,
      data: {
        activeBtn: (sessionStorage.getItem('pve_button_3') == null) ? '1' : sessionStorage.getItem('pve_button_3'),
        categories: ['professor-category-1', 'professor-category-5']
      },
      methods: {
        toggleSelected: function(btn) {
          this.activeBtn = btn;
          this.categories.forEach(function(category) {
            document.getElementById(category).classList.add('hidden');
          });
          document.getElementById('professor-category-' + btn).classList.remove('hidden');

          Array.prototype.forEach.call(document.getElementsByClassName("post-card-preview"), function(el) {
            if (el.classList.contains('post-cat-' + btn)) {
              el.classList.remove('hidden');
            } else {
              el.classList.add('hidden');
            }
          });
          sessionStorage.setItem('pve_button_3', btn);
        }
      },
      created () {
        this.toggleSelected(this.activeBtn);
      }
    });
  }
  
  var mobilizadores = document.getElementById('top-buttons-mobilizadores');
  if (mobilizadores != null) {
    new Vue({
      el: mobilizadores,
      data: {
        activeBtn: (sessionStorage.getItem('pve_button_4') == null) ? '3' : sessionStorage.getItem('pve_button_4'),
        categories: ['mobilizador-category-3', 'mobilizador-category-4']
      },
      methods: {
        toggleSelected: function(btn) {
          this.activeBtn = btn;
          this.categories.forEach(function(category) {
            document.getElementById(category).classList.add('hidden');
          });
          document.getElementById('mobilizador-category-' + btn).classList.remove('hidden');

          Array.prototype.forEach.call(document.getElementsByClassName("post-card-preview"), function(el) {
            if (el.classList.contains('post-cat-' + btn)) {
              el.classList.remove('hidden');
            } else {
              el.classList.add('hidden');
            }
          });
          sessionStorage.setItem('pve_button_4', btn);
        }
      },
      created () {
        this.toggleSelected(this.activeBtn);
      }
    });
  }

  $('.load-more').click(function (e) {
    e.preventDefault();
    var cat = (sessionStorage.getItem('pve_button_1') == null) ? '0' : sessionStorage.getItem('pve_button_1');
    switch ($(this).attr('id')) {
      case 'familias-ver-mais':
        cat = (sessionStorage.getItem('pve_button_2') == null) ? '5' : sessionStorage.getItem('pve_button_2');
        break;
      case 'professores-ver-mais':
        cat = (sessionStorage.getItem('pve_button_3') == null) ? '1' : sessionStorage.getItem('pve_button_3');
        break;
      case 'mobilizadores-ver-mais':
        cat = (sessionStorage.getItem('pve_button_4') == null) ? '3' : sessionStorage.getItem('pve_button_4');
        break;
    }
    $.ajax({
      type: "GET",
      url: window.location.href,
      dataType: "script",
      success: function () {
        $('.load-more').show();
        Array.prototype.forEach.call(document.getElementsByClassName('post-cat-' + cat), function(el) {
          el.classList.remove('hidden');
        }); 
      }
    });
  });
  
  $('#enter-gestores').click(function() {
    ga('send', 'event', "home", "clicou gestores");
  });
  
  $('#enter-familia').click(function() {
    ga('send', 'event', "home", "clicou familia"); 
  });
  
  $('#enter-professores').click(function() {
    ga('send', 'event', "home", "clicou professores");
  });
  
  $('#enter-mobilizadores').click(function() {
    ga('send', 'event', "home", "clicou mobilizadores");
  });

  (function ($) {
    function typeString($target, str, cursor, delay, cb) {
      $target.html(function (_, html) {
        return html + str[cursor];
      });
      
      if (cursor < str.length - 1) {
        setTimeout(function () {
          typeString($target, str, cursor + 1, delay, cb);
        }, delay);
      }
      else {
        cb();
      }
    }

    function deleteString($target, delay, cb) {
      var length;
      
      $target.html(function (_, html) {
        length = html.length;
        return html.substr(0, length - 1);
      });
      
      if (length > 1) {
        setTimeout(function () {
          deleteString($target, delay, cb);
        }, delay);
      }
      else {
        cb();
      }
    }
  
    // jQuery hook
    $.fn.extend({
      teletype: function (opts) {
        var settings = $.extend({}, $.teletype.defaults, opts);
        
        return $(this).each(function () {
          (function loop($tar, idx) {
            // type
            typeString($tar, settings.text[idx], 0, settings.delay, function () {
              // delete
              setTimeout(function () {
                deleteString($tar, settings.delay, function () {
                  loop($tar, (idx + 1) % settings.text.length);
                });
              }, settings.pause);
            });
          
          }($(this), 0));
        });
      }
    });
  
    // plugin defaults  
    $.extend({
      teletype: {
        defaults: {
          delay: 50,
          pause: 4000,
          text: []
        }
      }
    });
  }(jQuery));
  
  $('#target').teletype({
    text: [
      'Famílias', 'Professores', 'Gestores Educacionais', 'Mobilizadores',  'Gestores Escolares'
    ]
  });
  
  $('#cursor').teletype({
    text: ['|', ' '],
    delay: 0,
    pause: 500
  });
});


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })
