let listDish = [];
let price_tol = 0;
let price_service=0;
let dish_tol = 0;
let listService=[];
let Hall;

var options;
function init(initOptions) {
    options = initOptions;
    console.log(options)
}

function loadPage(endpoint, categoryId, page, pagesize, count) {
    fetch(endpoint + `?categoryId=${categoryId}&page=${page}`).then(function (response) {
        return response.json();
    }).then(function (data) {
        let d = document.getElementById("dish-total");
        d.innerHTML = ``;
        data.forEach(dish => {
            let id = dish.id.toString();
            let t = listDish.indexOf(id);
            d.innerHTML += `
                    <div class="col-md-3 col-xs-12 d-flex" style="padding: 10px;">
                                <div class="card">
                                    <img class="card-img-top" class="img-fluid" src="${dish.imgae}" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title">${dish.name}</h4>
                                        <p class="card-text">
                                                ${dish.price},000 [VND]
                                        </p>
                                    </div>
                                    <div class="card-footer d-flex justify-content-center align-items-center" id="btn${dish.id}"></div>                                        

                                </div>
                            </div>`
            let btn = document.getElementById(`btn${dish.id}`);
            if (t !== -1) {
                btn.innerHTML = `<button type="button" class="btn btn-secondary"  onclick="removeDish(\`${dish.id}\`,\`${dish.name}\`,\`${dish.price}\`,${categoryId})">Xóa</button>`
            } else {
                btn.innerHTML = `<button type="button" class="btn btn-secondary" onClick="addDish(${dish.id},\`${dish.name}\`,\`${dish.price}\`,${categoryId})">Thêm</button>`
            }
        })
    })
    let p = document.getElementById("pagination");
    p.innerHTML = ``;
    for (let i = 1; i <= Math.ceil(count / pagesize); i++) {
        let newEnpoint = `${endpoint}`
        p.innerHTML += `<li class="page-item"><a type="button" class="page-link" href="#Main-menu" onclick="loadPage(\`${newEnpoint}\`,${categoryId},${i},${pagesize},${count})">${i}</a></li>`
    }
}

function weddingHall(id,name, describe, capacity,price,image){
    Hall={
        id,
        capacity,
        price,
        name
    }
    let w=document.getElementById("wedding-hall");
    w.innerHTML=`<h3 id="hall-name">${name}</h3>
                 <p class="hall-describe">${describe}</p>
                 <p>Sức chứa:${capacity} - Giá: ${price} ,000 [VNĐ] </p>
                 <button type=button class="btn btn-primary" data-bs-toggle="modal"
                       data-bs-target="#exampleModal">Chọn sảnh khác
                 </button>`
    let img=document.getElementById("image-wd");
    img.src=image;
    checkStatusHall()
    $("#exampleModal").modal("hide");
}

function addDish(id, name, price,cateId) {
    let l = document.getElementById(`listDish-${cateId}`);
    let btn = document.getElementById(`btn${id}`);
    let total_price = document.getElementById("total_price");
    let total_dish = document.getElementById("total_dish");
    dish_tol++;
    price_tol += parseInt(price);
    total_price.innerHTML = price_tol.toString() + ',000';
    total_dish.innerHTML = dish_tol.toString();
    if (btn !== null) {
        btn.innerHTML = `<button type="button" class="btn btn-secondary"  onclick="removeDish(\`${id}\`,\`${name}\`,\`${price}\`,${cateId})">Xóa</button>`
    }
    let dish = {id, name, price};
    listDish.push(id);
    l.innerHTML += `
        <li class="list-group-item d-flex justify-content-between" id="dish_${id}">
            <div>
                <h6 class="my-0"><b>${name}</b></h6>
                <small class="text-muted">${id}</small>
            </div>                
            <span class="text-muted">${price},000</span>
        </li>`
}


function removeDish(index, name, price,categoryId) {
    let total_price = document.getElementById("total_price");
    let total_dish = document.getElementById("total_dish");
    dish_tol--;
    price_tol -= parseInt(price);
    total_price.innerHTML = price_tol.toString() + ',000';
    total_dish.innerHTML = dish_tol.toString();
    listDish.splice(listDish.indexOf(index), 1);
    let child = document.getElementById(`dish_${index}`);
    let btn = document.getElementById(`btn${index}`);
    child.parentNode.removeChild(child);
    btn.innerHTML = `<button type="button" class="btn btn-secondary" onClick="addDish(\`${index}\`,\`${name}\`,\`${price}\`,${categoryId})">Thêm</button>`
}
function loadService(endpoint){
    console.log(endpoint);
    fetch(endpoint+`?page=1`).then(function (response){
        return response.json();
    }).then(function (data){
        let msg=document.getElementById("order-services");
        data.forEach(item=>{
            msg.innerHTML+=`
            <div class="col-md-3 col-xs-12 d-flex" style="padding: 10px;">
                                <div class="card" id="div-${item.id}">
                                    <img class="card-img-top" class="img-fluid" src="${item.image}" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title">${item.name}</h4>
                                        <p class="card-textd-">${item.describe}</p>
                                        <p class="card-text">
                                                ${item.price},000 [VND]
                                        </p>
                                    </div>
                                    <div class="card-footer d-flex justify-content-center align-items-center" ">
                                        <button type="button" class="btn btn-secondary" id="btn-${item.id}" onclick="addService(${item.id},${item.price})">Chọn</button>
                                    </div>                                        
                                </div>
                            </div>
        `
        })
    })
}
function removeService(id,price) {
    price_service-=price
    listService.splice(listService.indexOf(id),1);
    let d=document.getElementById(`btn-${id}`);
    d.innerHTML='chọn';
    let msg=document.getElementById(`div-${id}`);
    msg.style.border='none';
    d.onclick=function() {addService(id,price);};
}
function addService(id,price){
    price_service+=price
    listService.push(id);
    let d=document.getElementById(`btn-${id}`);
    d.innerHTML='Bỏ chọn';
    let msg=document.getElementById(`div-${id}`);
    msg.style.border='3px groove #ee2020';
    d.onclick=function (){removeService(id,price);}
}

function checkStatusHall(){
    $("[id*='-error']").prop('hidden',true)
    let date=document.getElementById("date").value;
    let table=document.getElementById("countTable");
    let tableError= document.getElementById("table-error")
    let dateError= document.getElementById("date-error")
    let sessionError= document.getElementById("session-error")
    let select=document.getElementById("type_day")
    let session = select.options[select.selectedIndex].value;
    $("#type_day option").prop('disabled', false);

    if(Hall!=null&&date){
        fetch(`/QuanLyNhaHang/api/listOfBooked?weddingHallId=${Hall.id}&date=${date}`).then(res=>{
            return res.json();
        }).then(data=>{
            if(data.length==3){
                dateError.hidden=false;
            }
            data.forEach(s=>{
                select.options[s.id-1].disabled=true
                if(session==s.id){
                    sessionError.hidden=false;
                }
            })
            if(table>Hall.capacity){
                tableError.hidden=false;
                return;
            }
        });
    }
}
function createOrder(){

    $("[id*='-error']").prop('hidden',true)
    let date=document.getElementById("date").value;
    let table=document.getElementById("countTable").value;
    let select=document.getElementById("type_day")
    let session = select.options[select.selectedIndex].value;

        if(Hall!=null){
            if ( $('#listDish-1 li').length < 1 ) {

            }
            $("#orderModal").modal("show");

            fetch(`/QuanLyNhaHang/api/getPriceWeddingTime/${session}`).then(res=>res.json()).then(data=>{
                let amount=(price_tol*table)+price_service+(Hall.price*data.price)

                $("#wedding-hall-name").val(Hall.name)
                $("#quantity-table").val(table)
                $("#booking-date").val(date)
                $("#price-dish").val(price_tol)
                $("#price-service").val(price_service)
                $("#price-weddinghall").val(Hall.price*data.price)
                $("#price-total").val(amount)

                $("#form-payment").submit(event=>{
                    let typePay=$('input[name=optradio]:checked', '#form-payment').val()
                    event.preventDefault()
                    let url=$(this).attr("action")
                    fetch("/QuanLyNhaHang/api/receipt",{
                        method:"post",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body:JSON.stringify({
                            menu : listDish,
                            listService : listService,
                            weddinghallId : Hall.id,
                            priceWeddingId : session,
                            orderDate : date,
                            amount : amount,
                            typePay :typePay,
                            quantityTable: table
                        })
                    }).then(function (res) {
                        return res.json();
                    }).then(function (data) {

                        payment(data)
                    }).catch(error => (console.log(error)));

                })
            })
        }
}

function payment(data){
    fetch("/QuanLyNhaHang/api/payment",{
        method:"post",
        headers: {
            "Content-Type": "application/json"
        },
        body:JSON.stringify(data)
    }).then(res=>{
        console.log(res)
        return res.json()
    }).then(data=>{
        console.log(data)
        window.location.href =data.payUrl
    })
}

console.log($("[id*='-error']:hidden").length)


function validation(){
    if($("[id*='-error']:hidden").length<$("[id*='-error']").length){
        return false;
    }
    return true;
}

function QuantityTablevalidatior(){

}