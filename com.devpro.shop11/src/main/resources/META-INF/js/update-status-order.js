function showNotification(from, align, message) {
    color = 1;

    $.notify({
        message: message

    }, {
        type: type[color],
        timer: 500,
        placement: {
            from: from,
            align: align
        }
    });
}

var Order = {
    updateStatus: function (idO) {
        var data = {};
        data["id"] = idO;
        data["status"] =  $('.form-check-input:checked').val();
        $.ajax({
            url: "/update-status",
            type: "post",
            contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
            data: JSON.stringify(data), // object json -> string json

            dataType: "json", // dữ liệu từ web-service trả về là json.
            success: function (jsonResult) { // được gọi khi web-service trả về dữ liệu.
                if (jsonResult.status == 200) {
                    location.reload();
                } else {
                    alert('loi');
                }
            },
            error: function (jqXhr, textStatus, errorMessage) { // error callback

            }
        });
    },
}