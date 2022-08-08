function getProducts(endpoint){
    fetch(endpoint).then(function (res){
        return res.json()
    }).then(function (data){
        console.info(data)
    }).catch(function (err){
        console.error(err)
    })
}