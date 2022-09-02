function editHall(name,describe,capacity,price) {
    document.getElementById("nameHall").value=name;
    document.getElementById("describeHall").value=describe;
    document.getElementById("capacityHall").value=parseInt(capacity);
    document.getElementById("priceHall").value=parseInt(price);
    document.getElementById("deleteHall").style.display="block";
    document.getElementById("modal-title").innerHTML="Chỉnh sửa sảnh";
}
function initModalEdit(){
    document.getElementById("nameHall").value=null;
    document.getElementById("describeHall").value=null;
    document.getElementById("capacityHall").value=null;
    document.getElementById("priceHall").value=null;
    document.getElementById("deleteHall").style.display="none";
    document.getElementById("modal-title").innerHTML="Thêm sảnh";
}