function deleteHall(endpoint) {
    fetch(endpoint, {
        method: "delete"
    }).then(res => {
        if (res.status === 204)
            location.reload();
    }).catch(function (err) {
        console.error(err);
    });
}
