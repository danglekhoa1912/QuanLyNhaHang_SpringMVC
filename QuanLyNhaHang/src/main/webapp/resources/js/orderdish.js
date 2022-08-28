function loadPage(endpoint,categoryId,page,pagesize,count) {
    fetch(endpoint+`?categoryId=${categoryId}&page=${page}`).then(function (response) {
        return response.json();
    }).then(function (data) {
                let d = document.getElementById("dish-total");
                d.innerHTML=``;
                data.forEach(dish=>{
                    d.innerHTML+=`
                    <div class="col-md-3 col-xs-12 d-flex" style="padding: 10px;">
                                <div class="card">
                                    <img class="card-img-top" class="img-fluid" src="${dish.imgae}" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title">${dish.name}</h4>
                                        <p class="card-text">
                                                ${dish.price},000 [VND]
                                        </p>
                                        <button type="button" href="" class="btn btn-secondary">Thêm</button>
                                    </div>
                                </div>
                            </div>`
                })
    })
    let p=document.getElementById("pagination");
    p.innerHTML=``;
    for (let i = 1; i <= Math.ceil(count/pagesize); i++) {
        let newEnpoint=`${endpoint}`
        p.innerHTML+=`<li class="page-item"><button type="button" class="page-link" onclick="loadPage(\`${newEnpoint}\`,${categoryId},${i},${pagesize},${count})">${i}</button></li>`
    }
}