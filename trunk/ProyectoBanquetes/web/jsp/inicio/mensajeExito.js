
function exito(){
    $(document).ready(function(){
        $(".close").click(function(){
            $("#info").animate({
                left:"+=10px"
            }).animate({
                left:"-5000px"
            });
        });
        $("#info").fadeOut(800).fadeIn(800).fadeOut(400).fadeIn(400)
        .fadeOut(400).fadeIn(400);
    });
}

function error(){
    $(document).ready(function(){
        $(".close").click(function(){
            $("#info2").animate({
                left:"+=10px"
            }).animate({
                left:"-5000px"
            });
        });
        $("#info2").fadeOut(800).fadeIn(800).fadeOut(400).fadeIn(400)
        .fadeOut(400).fadeIn(400);
    });

}

function advertencia(){
    $(document).ready(function(){
        $(".close").click(function(){
            $("#info3").animate({
                left:"+=10px"
            }).animate({
                left:"-5000px"
            });
        });
        $("#info3").fadeOut(800).fadeIn(800).fadeOut(400).fadeIn(400)
        .fadeOut(400).fadeIn(400);
    });
}