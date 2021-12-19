package com.devpro.entities;

import java.math.BigDecimal;

public class SanPhamTrongGioHang {
	private int maSanPham;
	private String tenSanPham;
	private int soluong;
	private BigDecimal giaban;
	private String urlImage;

	
	public String getUrlImage() {
		return urlImage;
	}

	public void setUrlImage(String urlImage) {
		this.urlImage = urlImage;
	}

	public int getMaSanPham() {
		return maSanPham;
	}

	public void setMaSanPham(int maSanPham) {
		this.maSanPham = maSanPham;
	}

	public String getTenSanPham() {
		return tenSanPham;
	}

	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}

	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public BigDecimal getGiaban() {
		return giaban;
	}

	public void setGiaban(BigDecimal giaban) {
		this.giaban = giaban;
	}

}
