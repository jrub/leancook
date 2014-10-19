// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
    var params = {};
    $("#search_form").on('submit', function(){
        var term = $("#query").val();
        if(term){
            params[term] = term;
            var li = $("#search_terms").append('<li>');
            var anchor = $('<a href="">X</a>').on('click', function(){
                delete params[term];
                li.remove();
                return false;
            });
            console.log($("#search_form").attr('action'))
            li.append(anchor);
            li.append(term);
            $("#query").val("");
        }
        return false;
        
    })

    $("#search_form_home").on('submit', function(){
        var term = $("#query_home").val();
        if(term){
            $("#home_header").hide()
            $("header").removeClass("home-header");
            $("header").addClass("search-header");
            $("#search_header").show();
            var action = $("#search_form_home").attr('action');
            $("#content").html("Loading...")
            $.get(action, {query: term}, function(html) {
                $("#content").html(html)
            });
        }
        return false;
    });
});