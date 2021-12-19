var Cart = {
	gioHang: function(maSanPham, soluong) {
		var data = {};
		data["maSanPham"] = maSanPham;
		data["soluong"] = soluong;

		$.ajax({
			url: "/chon-san-pham-dua-vao-gio-hang",
			type: "post",
			contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
			data: JSON.stringify(data), // object json -> string json

			dataType: "json", // dữ liệu từ web-service trả về là json.
			success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
				if (jsonResult.status == 200) {
					$("#thong_tin_gio_hang").html(jsonResult.data);			
				} else {
					alert('loi');
				}
			},
			error: function(jqXhr, textStatus, errorMessage) { // error callback 

			}
		});
	},
	
	updateGioHang : function(maSanPham, donGia ,soluong, total) {
		var data = {};
		data["donGia"] = donGia;
		data["soluong"] = soluong;

		$.ajax({
			url: "/update-gio",
			type: "post",
			contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
			data: JSON.stringify(data), // object json -> string json

			dataType: "json", // dữ liệu từ web-service trả về là json.
			success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
				if (jsonResult.status == 200) {
					$('#'+maSanPham).html(soluong*donGia);
					$('#total').html(soluong*donGia + total);
				} else {
					alert('loi');
				}
			},
			error: function(jqXhr, textStatus, errorMessage) { // error callback 

			}
		});
	},
}