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
//= require_tree .

$(document).ready(function(){

    $(".sortable-table th").click(function(){
        sort_table($(this));
    });

});

function sort_table(clicked){
    var current_table = clicked.parents(".sortable-table"),
        sorted_column = clicked.index(),
        column_count = current_table.find("th").length,
        sort_it = [];

    current_table.find("tbody tr").each(function(){
        var new_line = "",
            sort_by = "";
        $(this).find("td").each(function(){
            if($(this).next().length){
                new_line += $(this).html() + "+";
            }else{
                new_line += $(this).html();
            }
            if($(this).index() == sorted_column){
                sort_by = $(this).text();
            }
        });

        new_line = sort_by + "*" + new_line;
        sort_it.push(new_line);
        //console.log(sort_it);

    });

    sort_it.sort();
    $("th span").text("");
    if(!clicked.hasClass("sort-down")){
        clicked.addClass("sort-down");
        clicked.find("span").text("▼");
    }else{
        sort_it.reverse();
        clicked.removeClass("sort-down");
        clicked.find("span").text("▲");
    }

    $("#country-list tr:not('.country-table-head')").each(function(){
        $(this).remove();
    });

    $(sort_it).each(function(index, value) {
        $('<tr class="current-tr"></tr>').appendTo(clicked.parents("table").find("tbody"));
        var split_line = value.split("*"),
            td_line = split_line[1].split("+"),
            td_add = "";

        //console.log(td_line.length);
        for (var i = 0; i < td_line.length; i++){
            td_add += "<td>" + td_line[i] + "</td>";
        }
        $(td_add).appendTo(".current-tr");
        $(".current-tr").removeClass("current-tr");

    });
}