//...
//= require jquery
//= require bootstrap-sprockets
//= require jquery
//= require jquery_ujs
//= require turbolinks
//$(document).ready(function() {
function moveFooter() {

    var docHeight = $(window).height();
    var footerHeight = $('.footer1').height();
    let copyrightHeight = $('.copyright-row').height();
    var footerTop = $('.footer1').position().top + footerHeight + copyrightHeight;

    if (footerTop < docHeight) {
        $('.footer1').css('margin-top', 10 + (docHeight - footerTop) + 'px');
    }
}

$(document).on('turbolinks:load', moveFooter);

let resizeListener;
let pause = 100;

$(window).resize(function() {
    clearTimeout(resizeListener);
    resizeListener = setTimeout(moveFooter, pause);
});

