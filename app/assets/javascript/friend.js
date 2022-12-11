function show_result(data){
    let result = document.getElementById("result")
    let error = document.getElementById("error")
    result.innerHTML = ""
    error.innerHTML = "";
    if(data.status == "error") {
        error.innerHTML = "<span class='inputerror'>Пожалуйста, введите натуральное число.</span>";
    } else{
        result.innerHTML = "<table id='restable'><tr><th>Число1</th><th>Число2</th></tr>";
        let table = document.querySelector("#restable")
        data.value.forEach(function(item, i, arr) {table.innerHTML += `<tr><td>${item[0]}</td><td>${item[1]}</td></tr>`})
    }
}
$(document).ready(function(){
    $("#friend_form").bind("ajax:success",
    function(xhr, data, status) {
    show_result(data)
    })
}) 