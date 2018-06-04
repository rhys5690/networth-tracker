/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import { Application } from 'stimulus';
import { definitionsFromContext } from 'stimulus/webpack-helpers';
import moment from 'moment';
import Pikaday from 'pikaday';

const application = Application.start();
const context = require.context('controllers', true, /.js$/);
application.load(definitionsFromContext(context));

document.addEventListener('turbolinks:load', function() {
  var picker = new Pikaday({
    field: document.getElementById('datepicker'),
    reposition: false
  });

  const signOut = document.getElementById('sign-out').addEventListener('click', () => {
    window.location.href = '/'
  });
  console.log(signOut);
});
