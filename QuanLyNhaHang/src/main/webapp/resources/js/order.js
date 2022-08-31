function weddingHall(name, describe, capacity,price,image){
    let w=document.getElementById("wedding-hall");
    w.innerHTML=`<h3 id="hall-name">${name}</h3>
                 <p class="hall-describe">${describe}</p>
                 <p>Sức chứa:${capacity} - Giá: ${price} ,000 [VNĐ] </p>
                 <button type=button class="btn btn-primary" data-bs-toggle="modal"
                       data-bs-target="#exampleModal">Chọn sảnh khác
                 </button>`
    let img=document.getElementById("image-wd");
    img.src=image;
}