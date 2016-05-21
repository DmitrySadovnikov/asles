// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets

var t = -1;

function sortTable(a) {
    var b = parseInt(a,10),
        d = document.getElementById("offer-table"),
        e = d.getElementsByTagName("tbody")[0],
        f = e.getElementsByTagName("tr"),
        c = [];
    a = 0;
    for (var g = f.length; a < g; a++) {
        c[a] = {};
        c[a].z = a;
        var h = f[a].getElementsByTagName("td")[b].innerHTML.replace(/<[^>]*>/g, "");
        c[a].value = h.replace(/[^a-zA-Z0-9]/g, "").substr(0, 25);
    }
    b == t ? c.reverse() : (t = b, c.sort(sortLogic));
    b = document.createElement("tbody");
    a = 0;
    for (g = c.length; a < g; a++) {
        b.appendChild(f[c[a].z].cloneNode(!0));
    }
    d.replaceChild(b, e);
}

function sortLogic(a, b) {
    var d = a.value,
        e = b.value;
    return d === e ? 0 : d > e ? 1 : -1;
}