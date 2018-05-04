//...
//= require jquery
//= require bootstrap-sprockets
//= require jquery
//= require jquery_ujs
//= require turbolinks
//$(document).ready(function() {
$(document).on('turbolinks:load', function() {

    var docHeight = $(window).height();
    var footerHeight = $('.footer1').height();
    let copyrightHeight = $('.copyright-row').height();
    var footerTop = $('.footer1').position().top + footerHeight + copyrightHeight;

    if (footerTop < docHeight) {
        $('.footer1').css('margin-top', 10 + (docHeight - footerTop) + 'px');
    }
});
