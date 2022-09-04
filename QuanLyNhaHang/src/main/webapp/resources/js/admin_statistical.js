/* global Utils */

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
/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
let listLabel=[];
let listPrice=[];
let listCount=[];
let n=0;
function loadData(endpoint) {
    fetch(endpoint).then(function (response) {
        return response.json();
    }).then(function (data) {
        data.forEach(item=>{
            getData(item.whId.name,item.amount);
        });
    });
    const ctx = document.getElementById('myChart').getContext('2d');
    const myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: listLabel,
            datasets: [{
                    label: 'Thong ke doanh thu',
                    data: listPrice,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)'
                    ],
                    borderWidth: 1
                }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
    let table=document.getElementById("table_hall");
    console.log(listLabel);
    console.log(listLabel);
    console.log(listPrice);
    console.log(listCount);
    table.innerHTML=``;
    for (let i=0;i<n;i++) {
        table.innerHTML+=`
        <th scope="col">${listLabel[i]}</th>
        <th scope="col">${listCount[i]}</th>
        <th scope="col">${listPrice[i]}</th>`
        console.log(i);
    }
}
function getData(label,data){
    if (listLabel.indexOf(label)!=-1){
        listPrice[listLabel.indexOf(label)]+=data;
        listCount[listLabel.indexOf(label)]++;
    }
    else {
        listLabel.push(label);
        listPrice.push(data);
        listCount.push(1);
        n++;
    }

}




