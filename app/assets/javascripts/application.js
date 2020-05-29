//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require toastr_rails
//= require_tree .


$(function() {
  toastr.options = {
      "closeButton": true,
      "debug": false,
      "positionClass": "toast-bottom-right",
      "onclick": null,
      "showDuration": "300",
      "hideDuration": "1000",
      "timeOut": "2000",
      "extendedTimeOut": "1000",
      "showEasing": "swing",
      "hideEasing": "linear",
      "showMethod": "fadeIn",
      "hideMethod": "fadeOut",
      "progressBar": true
  }
});