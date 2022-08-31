function edit(){
    // $(document).ready(function(){
    //     $("#myForm :input").prop("disabled", false);
    // });
    // $("#btn-edit").text(`<spring:message key="profile.cancel"/>`)
}

function save(){
    // $(document).ready(function(){
    //     $("#myForm :input").prop("disabled", true);
    // });
    // $("#btn-edit").text(`<spring:message key="profile.edit"/>`)
}

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#newImg').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}