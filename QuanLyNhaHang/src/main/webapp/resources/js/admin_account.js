function search() {
    window.location.href=`?role=${type}&name=`+document.getElementById("search-box").value;
}
function viewDetail(name, date,mobile,email,image){
    document.getElementById("nameStaff").value=name;
    document.getElementById("birthdayStaff").value=date;
    document.getElementById("mobileStaff").value=mobile;
    document.getElementById("emailStaff").value=email;
    document.getElementById("nameStaff").disabled=true;
    document.getElementById("birthdayStaff").disabled=true;
    document.getElementById("mobileStaff").disabled=true;
    document.getElementById("emailStaff").disabled=true;
    // document.getElementById("img").disabled=true;
}
function addUser(){
    document.getElementById("nameStaff").value=null;
    document.getElementById("birthdayStaff").value=null;
    document.getElementById("mobileStaff").value=null;
    document.getElementById("emailStaff").value=null;
    document.getElementById("img").src=null;
    document.getElementById("nameStaff").disabled=false;
    document.getElementById("birthdayStaff").disabled=false;
    document.getElementById("mobileStaff").disabled=false;
    document.getElementById("emailStaff").disabled=false;
    document.getElementById("img").disabled=false;
}