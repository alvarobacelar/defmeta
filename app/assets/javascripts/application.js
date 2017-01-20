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
//= require jquery_nested_form
//x require turbolinks
//= require moment
//= require fullcalendar
//= require fullcalendar/lang/pt
//= require bootstrap
//= require sb-admin-2.js
//= require metisMenu.js
//x require editable/bootstrap-editable
//x require editable/rails
//= require tinymce
//= require_tree .

jQuery(function() {
  $('.chosen').chosen()

  $('.money').maskMoney({prefix: "", allowZero: true, allowNegative: false, thousands: ".", decimal: ",", affixesStay: false});
  $('.nota').maskMoney({prefix: "", allowZero: true, allowNegative: false, thousands: ".", decimal: ",", affixesStay: false, precision: 1});

  $('form.disabled').find('input, select, a, button').attr('disabled', true);

  $('#check-all').click(function() { $('td.check input').prop('checked', $(this).prop('checked')); } )

  $('.select2').select2({language: 'pt-BR'});

  // TODO
  // Fechar menu lateral
  // $('.sidebar').animate({'margin-left': '-100%'}); $('#page-wrapper').animate({'margin-left': '0'})
  // Abrir menu lateral:
  // $('.sidebar').animate({'margin-left': '0'}); $('#page-wrapper').animate({'margin-left': '250px'})
  //
  // $('#recolher-menu').click(function() {
  //   $('.sidebar').animate({'margin-left': '-100%'}); $('#page-wrapper').animate({'margin-left': '0'})
  //   return false;
  // });
  // $('#expandir-menu').click(function() {
  //    $('.sidebar').animate({'margin-left': '0'}); $('#page-wrapper').animate({'margin-left': '250px'})
  //   return false;
  // });
});
