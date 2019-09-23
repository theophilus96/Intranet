

$(document).ready(function(){

    $(".filter-button").click(function(){
        var value = $(this).attr('data-filter');
        
        if(value == "all")
        {
//            /***/ $('.filter').removeClass('hidden');
            $('.filter').show('1000');
        }
        else
        {
//    /***/        $('.filter[filter-item="'+value+'"]').removeClass('hidden');
//    /***/        $(".filter").not('.filter[filter-item="'+value+'"]').addClass('hidden');
            $(".filter").not('.'+value).hide('3000');
            $('.filter').filter('.'+value).show('3000');
            
        }
    });

});


/* set other tab by default instead of "all"*/
/*
$(document).ready(function(){
    var valueOnLoad = "graphic";
    $(".filter").not('.'+valueOnLoad).hide('3000');
    $(".filter").not('.'+valueOnLoad).hide('3000');
    
    $(".filter-button").click(function(){
    var value = $(this).attr('data-filter');
    $(".filter").not('.'+value).hide('3000')
    $('.filter').filter('.'+value).show('3000')
    
    });
    
    });
*/