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
let count_dishById=0;
let idByCateId=0
let Page=0;
function loadPage(endpoint, categoryId, page, pagesize, count) {
    count_dishById=count;
    idByCateId=categoryId;
    let d = document.getElementById("table_dishes");
    d.innerHTML = `<thead class="thead-light">
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Tên món ăn</th>
                <th scope="col">Giá</th>
                <th scope="col"></th>
            </tr>
            </thead>`;
    fetch(endpoint + `?categoryId=${categoryId}&page=${page}`).then(function (response) {
        return response.json();
    }).then(function (data) {
        data.forEach(dish => {
            let image=`${dish.imgae}`;
            d.innerHTML += `
            <tr class="table-info">
                <th scope="row">${dish.id}</th>
                <td>${dish.name}</td>
                <td>${dish.price}</td>
                <td><button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#imageModal" id="btn-${dish.id}" onclick="editDish(\`${dish.id}\`,\`${dish.name}\`,\`${image}\`,\`${dish.price}\`,\`${categoryId}\`)">Chỉnh sửa</button></td>
            </tr>
            `
        })
    })
    let p = document.getElementById("pagination");
    p.innerHTML = ``;
    for (let i = 1; i <= Math.ceil(count / pagesize); i++) {
        let newEnpoint = `${endpoint}`
        p.innerHTML += `<li class="page-item"><a type="button" class="page-link" href="#" onclick="loadPage(\`${newEnpoint}\`,${categoryId},${i},${pagesize},${count})">${i}</a></li>`
        Page=page;
    }
}
function editDish(id, name, image ,  price, categoryId){
    document.getElementById('categoryDish').value=categoryId;
    document.getElementById("imageDish").src=image;
    document.getElementById("nameDishes").value=name;
    document.getElementById("price").value=parseInt(price);
    document.getElementById("btn-delete").style.display="block";
}
function initEditDishes(){
    document.getElementById('categoryDish').value=1;
    document.getElementById("imageDish").src="";
    document.getElementById("nameDishes").value=null;
    document.getElementById("price").value=0;
    document.getElementById("btn-delete").style.display="none";
}
function search_dish(endpoint, categoryId, page, pagesize, count) {
    let s = document.getElementById("search").value;
    count=count_dishById;
    categoryId=idByCateId;
    console.log(s.length);
    if (s.length !== 0) {
        let d = document.getElementById("table_dishes");
        d.innerHTML = `<thead class="thead-light">
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Tên món ăn</th>
                <th scope="col">Giá</th>
                <th scope="col">Hình ảnh</th>
            </tr>
            </thead>`;
        for (let i = 1; i <= Math.ceil(count / pagesize); i++) {
            fetch(endpoint + `?categoryId=${categoryId}&page=${i}`).then(function (response) {
                return response.json();
            }).then(function (data) {
                data.forEach(dish => {
                    if (removeAccents(dish.name).toLowerCase().indexOf(removeAccents(s).toLowerCase().trimEnd()) !== -1) {
                        let image=`${dish.imgae}`;
                        d.innerHTML += `
            <tr class="table-info">
                <th scope="row">${dish.id}</th>
                <td>${dish.name}</td>
                <td>${dish.price}</td>
                <td><button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#imageModal" id="btn-${dish.id}" onclick="editDish(\`${dish.id}\`,\`${dish.name}\`,\`${image}\`,\`${dish.price}\`,\`${categoryId}\`)">Chỉnh sửa</button></td>
            </tr>
            `
                    }
                })
            })
        }
    }
    else {
        loadPage(endpoint, categoryId, Page, pagesize, count);
    }
}
function removeAccents(str) {
    let AccentsMap = [
        "aàảãáạăằẳẵắặâầẩẫấậ",
        "AÀẢÃÁẠĂẰẲẴẮẶÂẦẨẪẤẬ",
        "dđ", "DĐ",
        "eèẻẽéẹêềểễếệ",
        "EÈẺẼÉẸÊỀỂỄẾỆ",
        "iìỉĩíị",
        "IÌỈĨÍỊ",
        "oòỏõóọôồổỗốộơờởỡớợ",
        "OÒỎÕÓỌÔỒỔỖỐỘƠỜỞỠỚỢ",
        "uùủũúụưừửữứự",
        "UÙỦŨÚỤƯỪỬỮỨỰ",
        "yỳỷỹýỵ",
        "YỲỶỸÝỴ"
    ];
    for (let i=0; i<AccentsMap.length; i++) {
        let re = new RegExp('[' + AccentsMap[i].substr(1) + ']', 'g');
        let char = AccentsMap[i][0];
        str = str.replace(re, char);
    }
    return str;
}
function loadService(endpoint) {
    fetch(endpoint + `?page=1`).then(function (response) {
        return response.json();
    }).then(function (data) {
        let msg = document.getElementById("order-services");
        msg.innerHTML=``;
        data.forEach(item => {
            msg.innerHTML +=`
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
                                </div>
                            </div>
                `
        })
    })
}