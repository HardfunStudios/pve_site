import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'
 
Vue.use(VueResource);
Vue.use(TurbolinksAdapter);
 
document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
 
  var collaboratorType = document.getElementById("home-collaborator-name");
  if (collaboratorType != null) {
    new Vue({
      el: collaboratorType,
      data () {
        return {
          title: 'Famílias',
          timer: '',
          i: 0,
          names: ['Famílias', 'Professores', 'Gestores Educacionais', 'Mobilizadores']
        }
      },
      created () {
        this.timer = setInterval(this.changeTitle, 5000);
      },
      methods: {
        changeTitle() {
          this.i >= 3 ? this.i = 0 : this.i++;
          this.title = this.names[this.i];
          return this.title;
        }
      },
      beforeDestroy () {
        clearInterval(this.timer);
      }
    });
  }
  
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
        activeBtn: (sessionStorage.getItem('pve_button') == null) ? '0' : sessionStorage.getItem('pve_button'),
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
          sessionStorage.setItem('pve_button', btn);
        }
      },
      created () {
        this.toggleSelected(this.activeBtn);
      }
    });
  }

  $('.load-more').click(function (e) {
    e.preventDefault();
    var cat = (sessionStorage.getItem('pve_button') == null) ? '0' : sessionStorage.getItem('pve_button');
    $.ajax({
      type: "GET",
     // url: $(this).attr('href'),
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
