function edit() {
    // $(document).ready(function(){
    //     $("#myForm :input").prop("disabled", false);
    // });
    // $("#btn-edit").text(`<spring:message key="profile.cancel"/>`)
}

function save() {
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

function addComment(endpoint) {
    fetch(endpoint, {
        method: "post",
        body: JSON.stringify({
            "content": document.getElementById("feedback").value,
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        return res.json();
    }).then(function (data) {
        console.log(data)
        $('#alert-feedback').removeClass('d-none');
        document.getElementById("feedback").value = ""
        setTimeout(function () {
            // Closing the alert
            $('#alert-feedback').alert('close');
        }, 3000);
    });
}
function updatePass(endpoint) {
    $("#change-pass [id*='error']").prop('hidden', true);
    let pass = document.getElementById("newPassword").value
    let rePass = document.getElementById("reNewPassword").value
    const re=new RegExp(/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$!~?,<>%^&+=])(?=\S+$).{8,}$/g)
    if(!re.test(pass)){
        $("#error-pass").prop("hidden",false)
        return;
    }
    if(pass!==rePass){
        $("#error-re-pass").prop("hidden",false)
        return;
    }
    fetch(endpoint, {
        method: "post",
        body: JSON.stringify({
            "pass": document.getElementById("newPassword").value,
            "userId": document.getElementById("userId").value
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(res => res.json()).then(date => {
        console.log(date)
    })
}