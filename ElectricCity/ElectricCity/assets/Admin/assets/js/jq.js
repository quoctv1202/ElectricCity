function Check(pattern, src) {
    if (pattern.test(src) == true && src != ' ') {
        return true;
    }
    else
        return false;
}

function name_check1() {
    var pattern = /^[A-z\sÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚÝàáâãèéêìíòóôõùúýĂăĐđĨĩŨũƠơƯưẠ-ỹ]{3,}$/;
    var ele = $("#name");
    if (Check(pattern, ele.val())) {
        ele.css("border-color","#4165DC");
        return true;
    } else {
        ele.css("border-color","#b94a48");
        return false;
    }
    submit_check();
}

function email_check1() {
    var pattern = /^[%+-._0-9A-z]+@[%+-._0-9A-z]+\.[A-z]{2,3}$/;
    var ele = $("#email");
    if (Check(pattern, ele.val())) {
        ele.css("border-color","#4165DC");
        return true;
    } else {
        ele.css("border-color","#b94a48");
        return false;
    }
    submit_check();
}

function pass_check1() {
    //var pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.*[A-z0-9!@#\$%\^&\*]{6,})/;
    var pattern=/^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])[A-z0-9]{6,}$/;
    var ele = $("#pass");
    if (Check(pattern, ele.val())) {
        ele.css("border-color","#4165DC");
        return true;
    } else {
        ele.css("border-color","#b94a48");
        return false;
    }
    submit_check();
}

function pass_confirm1() {
    var pass = $("#pass");
    var pass_confirm = $("#pass_confirm");
    if(pass_confirm.val()==pass.val()&& pass_confirm.val()!=""){
        pass_confirm.css("border-color","#4165DC");
        return true;
    }else{
        pass_confirm.css("border-color","#b94a48");
        return false;
    }
    submit_check();
}

function number_check1(){
    var pattern=/^[0-9]{10,11}$/;
    var ele = $("#phone_number");
    if (Check(pattern, ele.val())) {
        ele.css("border-color","#4165DC");
        return true;
    } else {
        ele.css("border-color","#b94a48");
        return false;
    }
    submit_check();
}

function address_check1(){
    //var pattern=/^[A-z0-9\s]{1,}$/;
    var pattern = /^[A-z\sÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚÝàáâãèéêìíòóôõùúýĂăĐđĨĩŨũƠơƯưẠ-ỹ0-9]{1,}$/;
    var ele = $("#address");
    if (Check(pattern, ele.val())) {
        ele.css("border-color","#4165DC");
        return true;
    } else {
        ele.css("border-color","#b94a48");
        return false;
    }
    submit_check();
}


function submit_check() {
    var submit_btn = $("#submit_btn");
    var check_cbx= $("#check");
    if (name_check1() == true && email_check1() == true && pass_check1() == true && pass_confirm1() == true check_cbx.prop('checked')==true) {
       
        return true;
    }
    else {
        
        return false;
    }
}

function showMess(){
    alert("Dang ky thanh cong");
}