require('@rails/ujs').start()
require('@rails/activestorage').start()
require('channels')

//= require i18n
//= require i18n.js
//= require i18n/translations
//= require jquery3
//= require bootstrap-sprockets
// require('packs/scrip')
import 'bootstrap';

document.addEventListener('turbolinks:load', () => {
  $('[data-toggle="tooltip"]').tooltip()
});
import '../stylesheets/application';
require('admin-lte');
import '@fortawesome/fontawesome-free/js/all';
require('packs/trainer')
//= require turbolinks
require('@nathanvda/cocoon')
