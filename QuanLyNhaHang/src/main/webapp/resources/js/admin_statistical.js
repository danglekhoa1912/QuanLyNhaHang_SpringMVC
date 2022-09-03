let d=document.getElementById("modalBox");
function viewMenu(endpoint,id){
    d.innerHTML=`
        <thead class="thead-light">
            <tr>
                <th scope="col">Tên</th>
                <th scope="col">Loại món ăn</th>
                <th scope="col">Giá tiền</th>
            </tr>
        </thead>`;
    fetch(endpoint+`?id=${id}`).then(function (response) {
        return response.json();
    }).then(function (data) {
        data.forEach(item=>{
            d.innerHTML+=`
            <tr class="table-light">
                <th>${item.name}</th>
                <th>${item.id}</th>
                <th>${item.price}</th>
            </tr>
            `;
        })
    })
}
function viewListService(endpoint,id){
    d.innerHTML=`
        <thead class="thead-light">
            <tr>
                <th scope="col">Tên</th>
                <th scope="col">Giá tiền</th>
            </tr>
        </thead>`;
    fetch(endpoint+`?id=${id}`).then(function (response) {
        return response.json();
    }).then(function (data) {
        data.forEach(item=>{
            d.innerHTML+=`
            <tr class="table-light">
                <th>${item.name}</th>
                <th>${item.price}</th>
            </tr>
            `;
        })
    })
}