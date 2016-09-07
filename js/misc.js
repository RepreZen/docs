$(document).ready(function() {
    var shift = function() {
	console.log("ha");
	window.scrollBy(0,-70);
    };
    window.addEventListener("hashchange", shift);
    window.addEventListener("load", function() {
	if (window.location.hash) {
	    shift();
	}
    });
});
