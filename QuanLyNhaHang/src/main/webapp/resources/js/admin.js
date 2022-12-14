function editHall(id,name, describe, capacity, price,img) {
    console.log(name)
    document.getElementById("idHall").value = id;
    document.getElementById("nameHall").value = name;
    document.getElementById("describeHall").value = describe;
    document.getElementById("capacityHall").value = parseInt(capacity);
    document.getElementById("priceHall").value = parseInt(price);
    document.getElementById("hallImg").src = img;
    document.getElementById("imageUpload").value = img;
    document.getElementById("imageUpload").setAttribute("hidden",'true')
    document.getElementById("modal-title").innerHTML = "Chỉnh sửa sảnh";
}

function initModalEdit() {
    document.getElementById("idHall").value = null;
    document.getElementById("nameHall").value = null;
    document.getElementById("describeHall").value = null;
    document.getElementById("capacityHall").value = null;
    document.getElementById("priceHall").value = null;
    document.getElementById("hallImg").src = null;
    document.getElementById("imageUpload").setAttribute("hidden",'false')
    document.getElementById("modal-title").innerHTML = "Thêm sảnh";
}

let count_dishById = 0;
let idByCateId = 0
let Page = 0;

function loadPage(endpoint, categoryId, page, pagesize, count) {
    count_dishById = count;
    idByCateId = categoryId;
    let d = document.getElementById("table_dishes");
    d.innerHTML = `<thead class="thead-light">
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Tên món ăn</th>
                <th scope="col">Giá</th>
                <th scope="col"></th>
                <th scope="col"></th>
            </tr>
            </thead>`;
    fetch(endpoint + `/dishes?categoryId=${categoryId}&page=${page}`).then(function (response) {
        return response.json();
    }).then(function (data) {
        data.forEach(dish => {
            let image = `${dish.imgae}`;
            d.innerHTML += `
            <tr class="table-info">
                <th scope="row">${dish.id}</th>
                <td>${dish.name}</td>
                <td>${dish.price}</td>
                <td><button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#imageModal" id="btn-${dish.id}" onclick="editDish(${dish.id},\`${dish.name}\`,\`${image}\`,${dish.price},${categoryId})">Chỉnh sửa</button></td>
                <td><button type="button" class="btn btn-danger" onclick="deleteDish(\`${endpoint}/admin/deleteDish/${dish.id}\`)" >Xóa</button></td>               
            </tr>
            `
        })
    })
    let p = document.getElementById("pagination");
    p.innerHTML = ``;
    for (let i = 1; i <= Math.ceil(count / pagesize); i++) {
        let newEnpoint = `${endpoint}`
        p.innerHTML += `<li class="page-item"><a type="button" class="page-link" href="#" onclick="loadPage(\`${newEnpoint}\`,${categoryId},${i},${pagesize},${count})">${i}</a></li>`
        Page = page;
    }
}

function editDish(id, name, image, price, categoryId) {
    document.getElementById('dishId').value = id;
    document.getElementById('category').value = categoryId;
    document.getElementById("imageDish").src = image;
    document.getElementById("nameDishes").value = name;
    document.getElementById("price").value = price;
}

function initEditDishes() {
    document.getElementById('category').value = 1;
    document.getElementById("imageDish").src = "";
    document.getElementById("nameDishes").value = null;
    document.getElementById("price").value = 0;
}

function search_dish(endpoint, categoryId, page, pagesize, count) {
    let s = document.getElementById("search").value;
    count = count_dishById;
    categoryId = idByCateId;
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
                        let image = `${dish.imgae}`;
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
    } else {
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
    for (let i = 0; i < AccentsMap.length; i++) {
        let re = new RegExp('[' + AccentsMap[i].substr(1) + ']', 'g');
        let char = AccentsMap[i][0];
        str = str.replace(re, char);
    }
    return str;
}

function loadService(endpoint) {
    fetch(endpoint + `/service?page=1`).then(function (response) {
        return response.json();
    }).then(function (data) {
        let msg = document.getElementById("order-services");
        msg.innerHTML = ``;
        data.forEach(item => {
            let image = `${item.image}`
            msg.innerHTML += `
                        <div class="col-3 d-flex style="padding: 10px;">
                                <div class="card" id="div-${item.id}">
                                    <img class="card-img-top" class="img-fluid" src="${item.image}" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title">${item.name}</h4>
                                        <p class="card-textd-">${item.describe}</p>
                                        <p class="card-text">
                                                ${item.price},000 [VND]
                                        </p>
                                    </div>       
                                    <div class="card-footer d-flex justify-content-between align-items-center">
                                        <button type="button" data-bs-toggle="modal" data-bs-target="#serviceModal" onclick="editService(${item.id},\`${item.name}\`,\`${item.price}\`,\`${item.describe}\`,\`${image}\`)" class="btn btn-info ">Chỉnh sửa</button>
                                         <button type="button" class="btn btn-danger" onclick="deleteDish(\`${endpoint}/admin/deleteService/${item.id}\`)"  >Xóa</button></td>               
                            
                                </div>
                            </div>
                        </div>
                `
        })
    })
}

function editService(id,name, price, describe, img) {
    document.getElementById("serviceId").value = id;
    document.getElementById("img").src = img;
    document.getElementById("nameService").value = name;
    document.getElementById("describe").value = describe;
    document.getElementById("price").value = parseInt(price);
    document.getElementById("btn-delete").style.display = "block";
}

function initModalService() {
    document.getElementById("img").src = '';
    document.getElementById("nameService").value = null;
    document.getElementById("describe").value = null;
    document.getElementById("price").value = 0;
    document.getElementById("btn-delete").style.display = "none";
}

function deleteDish(endpoint) {
    fetch(endpoint, {
        method: "delete"
    }).then(res => {
        if (res.status === 204)
            location.reload();
    }).catch(function (err) {
        console.error(err);
    });
}

function readURL(input,inputId) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#'+inputId).attr('src', e.target.result)
        };

        reader.readAsDataURL(input.files[0]);
    }
}