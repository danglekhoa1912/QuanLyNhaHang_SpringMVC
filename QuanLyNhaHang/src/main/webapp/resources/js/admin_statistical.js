let d = document.getElementById("modalBox");
function viewMenu(endpoint, id) {
    d.innerHTML = `
        <thead class="thead-light">
            <tr>
                <th scope="col">Tên</th>
                <th scope="col">Loại món ăn</th>
                <th scope="col">Giá tiền</th>
            </tr>
        </thead>`;
    fetch(endpoint + `?id=${id}`).then(function (response) {
        return response.json();
    }).then(function (data) {
        data.forEach(item => {
            d.innerHTML += `
            <tr class="table-light">
                <th>${item.name}</th>
                <th>${item.id}</th>
                <th>${item.price}</th>
            </tr>
            `;
        })
    })
}
function viewListService(endpoint, id) {
    d.innerHTML = `
        <thead class="thead-light">
            <tr>
                <th scope="col">Tên</th>
                <th scope="col">Giá tiền</th>
            </tr>
        </thead>`;
    fetch(endpoint + `?id=${id}`).then(function (response) {
        return response.json();
    }).then(function (data) {
        data.forEach(item => {
            d.innerHTML += `
            <tr class="table-light">
                <th>${item.name}</th>
                <th>${item.price}</th>
            </tr>
            `;
        })
    })
}
function initMonth(endpoint) {
    let s = document.getElementById("month").value;
    const m = s.split("-");
    console.log(m);
    initData(endpoint, parseInt(m[1]), parseInt(m[0]));
}
function initData(endpoint, m, y) {
    let count = 0;
    let total = 0;
    fetch(endpoint).then(function (response) {
        return response.json();
    }).then(function (data) {
        count = 0;
        total = 0;
        data.forEach(item => {
            let date = new Date(item.orderDate);
            if (date.getMonth() + 1 === m && date.getFullYear() === y) {
                count++;
                total += item.amount;
            }
        })
        document.getElementById("total_price").innerHTML = total;
        document.getElementById("total_order").innerHTML = count;
    })

    document.getElementById("month_statis").innerHTML = `${m}/${y}`;
    document.getElementById("month-statis").innerHTML = `${m}/${y}`;

}