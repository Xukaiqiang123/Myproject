function check_input(form) {//表单项不能为空
    for (var i=0;i<form.elements.length-1;i++){
        if (form.elements[i].value==""){
            alert("有内容未填写");
            form.elements[i].focus();
            return false;
        }
    }
    return true;
}