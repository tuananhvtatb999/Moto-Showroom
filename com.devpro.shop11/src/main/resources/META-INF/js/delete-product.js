var Product = {
	deleteProduct: function(idP) {
		var id = idP;
		var ok = confirm("Bạn chắc chắn muốn xóa!");
		$.ajax({
			url: "/delete-product",
			type: "post",
			contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
			data: JSON.stringify(id), // object json -> string json

			dataType: "json", // dữ liệu từ web-service trả về là json.
			success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
				if (jsonResult.status == 200) {
					if (ok) {
						location.reload();
						alert(jsonResult.data);
					}else{
						return;
					}
				} else {
					alert('loi');
				}
			},
			error: function(jqXhr, textStatus, errorMessage) { // error callback 

			}
		});
	},
	deleteOrder: function(idP) {
		var id = idP;
		$.ajax({
			url: "/delete-order",
			type: "post",
			contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
			data: JSON.stringify(id), // object json -> string json

			dataType: "json", // dữ liệu từ web-service trả về là json.
			success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
				if (jsonResult.status == 200) {
					location.reload();
					alert(jsonResult.data);
				} else {
					alert('loi');
				}
			},
			error: function(jqXhr, textStatus, errorMessage) { // error callback 

			}
		});
	},
	updateStatus: function(idO) {
		var id = idO;
		$.ajax({
			url: "/update-status",
			type: "post",
			contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
			data: JSON.stringify(id), // object json -> string json

			dataType: "json", // dữ liệu từ web-service trả về là json.
			success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
				if (jsonResult.status == 200) {
				} else {
					alert('loi');
				}
			},
			error: function(jqXhr, textStatus, errorMessage) { // error callback 

			}
		});
	},
	searchProduct: function(names) {
		var name = names;
		$.ajax({
			url: "/donghonam",
			type: "post",
			contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
			data: JSON.stringify(name), // object json -> string json

			dataType: "json", // dữ liệu từ web-service trả về là json.
			success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
				if (jsonResult.status == 200) {
				} else {
					alert('loi');
				}
			},
			error: function(jqXhr, textStatus, errorMessage) { // error callback 

			}
		});
	},

}

var Blog = {
	deleteblog: function(idP) {
		var id = idP;
		var ok = confirm("Bạn chắc chắn muốn xóa!");
		$.ajax({
			url: "/delete-blog",
			type: "post",
			contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
			data: JSON.stringify(id), // object json -> string json

			dataType: "json", // dữ liệu từ web-service trả về là json.
			success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
				if (jsonResult.status == 200) {
					if (ok) {
						location.reload();
						alert(jsonResult.data);
					}else{
						return;
					}
				} else {
					alert('loi');
				}
			},
			error: function(jqXhr, textStatus, errorMessage) { // error callback 

			}
		});
	},
}