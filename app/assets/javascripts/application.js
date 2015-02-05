// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

function remove_fields(link) {
  $(link).parent().remove();
}

function add_fields(link, content) {
  var new_id = new Date().getTime();
  var expression = "[0-9]+";
  var regexp = new RegExp(expression, 'g');

  // content = content.replace(regexp, "_" + new_id + "_");
  // regexp = new RegExp("\[0\]", 'g');
  // $(link).parent().before(content.replace(regexp, "[" + new_id + "]"));
  $(link).parent().before(content.replace(regexp, new_id));

}