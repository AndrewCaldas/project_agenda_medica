// When the user scrolls down 80px from the top of the document, resize the navbar's padding and the logo's font size
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
if (document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
    document.getElementById("navbar").style = 
"padding: 3px 0px; background: rgba(60, 64, 198, 0.8); border:none; box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important;";

} else {
    document.getElementById("navbar").style =
"padding: 15px 0px; background: rgba(60, 64, 198, 1); transition: all 0.8s; border:none; box-shadow: 0 1rem 3rem rgba(0,0,0,.175)!important;";
    // document.getElementById("logo").style.fontSize = "35px";
}
}