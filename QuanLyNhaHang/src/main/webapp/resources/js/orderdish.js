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
                btn.innerHTML = `<button type="button" class="btn btn-secondary"  onclick="removeDish(\`${dish.id}\`,\`${dish.name}\`,\`${dish.price}\`)">Xóa</button>`
            } else {
                btn.innerHTML = `<button type="button" class="btn btn-secondary" onClick="addDish(\`${dish.id}\`,\`${dish.name}\`,\`${dish.price}\`)">Thêm</button>`
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

let listDish = [];
let price_tol = 0;
let dish_tol = 0;
let listService=[];

function addDish(id, name, price) {
    let l = document.getElementById("listDish");
    let btn = document.getElementById(`btn${id}`);
    let total_price = document.getElementById("total_price");
    let total_dish = document.getElementById("total_dish");
    dish_tol++;
    price_tol += parseInt(price);
    total_price.innerHTML = price_tol.toString() + ',000';
    total_dish.innerHTML = dish_tol.toString();
    if (btn !== null) {
        btn.innerHTML = `<button type="button" class="btn btn-secondary"  onclick="removeDish(\`${id}\`,\`${name}\`,\`${price}\`)">Xóa</button>`
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


function removeDish(index, name, price) {
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
    btn.innerHTML = `<button type="button" class="btn btn-secondary" onClick="addDish(\`${index}\`,\`${name}\`,\`${price}\`)">Thêm</button>`
}
function loadService(endpoint){
    console.log(endpoint);
    fetch(endpoint+`?page=1`).then(function (response){
        return response.json();
    }).then(function (data){
        console.log(data);
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
                                        <button type="button" class="btn btn-secondary" id="btn-${item.id}" onclick="addService(${item.id})">Chọn</button>
                                    </div>                                        
                                </div>
                            </div>
        `
        })
    })
}
function removeService(id) {
    listService.splice(listService.indexOf(id),1);
    let d=document.getElementById(`btn-${id}`);
    d.innerHTML='chọn';
    let msg=document.getElementById(`div-${id}`);
    msg.style.border='none';
    d.onclick=function() {addService(id);};
}
function addService(id){
    listService.push(id);
    let d=document.getElementById(`btn-${id}`);
    d.innerHTML='Bỏ chọn';
    let msg=document.getElementById(`div-${id}`);
    msg.style.border='3px groove #ee2020';
    d.onclick=function (){removeService(id);}
}