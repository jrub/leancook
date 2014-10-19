// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
    $("#search_form").on('submit', function(){
        var term = $("#query").val();
        if(term){
            /*var li = $("#search_terms").append('<li>');
            var anchor = $('<a href="">X</a>').on('click', function(){
                delete params[term];
                li.remove();
                return false;
            });
            console.log($("#search_form").attr('action'))
            li.append(anchor);
            li.append(term);*/
            load_data(term);
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
            $("#query").val(term);
            load_data(term);
        }
        return false;
    });

    var load_data = function(term){
        var action = $("#search_form").attr('action');
        $("#content").html('<div class="pure-g"><div class="loading"><span class="spinner"></span><br />Loading...</div></div>');
        $.get(action, {query: term}, function(html) {
            if(supports_history_api()) {
                var query = term.split(" ").join("+")
                history.pushState(null, null, action+"?query="+query);
            }
            $("#content").html(html);
            $("img").error(function () {
                console.log("Imagen por defecto hostias, que esta peta")
                $(this).css("display", "none");
            });
        });
    }


    var supports_history_api = function() {
        return !!(window.history && history.pushState);
    }
});