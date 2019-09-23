$(function () {
    'use strict'

    $('[data-toggle="offcanvas"]').on('click', function () {
        $('.offcanvas-collapse').toggleClass('open')
    })


    $("#myInput").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $("#myList li").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });

    $("#myInput").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $("#myDIV *").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });

    //var valueOnLoad = "graphic";
    //$(".filter").not('.' + valueOnLoad).hide('3000');
    //$(".filter").not('.' + valueOnLoad).hide('3000');

    //$(".filter-button").click(function () {
    //    var value = $(this).attr('data-filter');
    //    $(".filter").not('.' + value).hide('3000')
    //    $('.filter').filter('.' + value).show('3000')

    //});


})




