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

function updateStatus(endpoint, orderId, status) {
    let button = $(`#btn-update-status-${orderId}`);

    status ? button.removeClass("btn-secondary").addClass("btn-danger") : button.removeClass("btn-danger").addClass("btn-secondary")
    fetch(endpoint, {
        method: "put",
        body: JSON.stringify({
            orderId: orderId,
            status: status
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(res => {
        if (res.status === 204)
            location.reload();
    }).catch(function (err) {
        console.error(err);
    });
}
