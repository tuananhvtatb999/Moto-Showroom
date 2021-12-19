package com.devpro.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.devpro.entities.GioHang;
import com.devpro.entities.Product;
import com.devpro.entities.SaleOrder;
import com.devpro.entities.SaleOrderProducts;
import com.devpro.entities.SanPhamTrongGioHang;
import com.devpro.model.AjaxResponse;
import com.devpro.repositories.ProductRepo;
import com.devpro.repositories.SaleOrderRepo;
import com.devpro.services.SendEmailService;

@Controller
public class GioHangController extends BaseController {

	@Autowired
	ProductRepo productRepo;
	@Autowired
	SaleOrderRepo saleOrderRepo;
	
	@Autowired
	SendEmailService sendEmailService;

	@RequestMapping(value = { "/chon-san-pham-dua-vao-gio-hang" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> muaHang(@RequestBody SanPhamTrongGioHang sanPhamTrongGioHang,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		// lấy đối tượng SESSION trong memory dựa vào SESSION_ID có trong request.
		HttpSession httpSession = request.getSession();

		GioHang gioHang = null;

		// kiểm tra xem SESSION đã có gio hàng chưa ?
		// nếu chưa có thì tạo mới 1 giỏ hàng và lưu vào SESSION.
		if (httpSession.getAttribute("GIO_HANG") != null) {
			gioHang = (GioHang) httpSession.getAttribute("GIO_HANG");
		} else {
			gioHang = new GioHang();
			httpSession.setAttribute("GIO_HANG", gioHang);
		}

		List<SanPhamTrongGioHang> _sanPhamTrongGioHangs = gioHang.getSanPhamTrongGioHangs();

		boolean sanPhamDaCoTrongGioHangPhaiKhong = false;
		
		double tongTien = 0;
		// trường hợp đã có sản phẩm trong giỏ hàng.
		for (SanPhamTrongGioHang item : _sanPhamTrongGioHangs) {
			if (item.getMaSanPham() == sanPhamTrongGioHang.getMaSanPham()) {
				sanPhamDaCoTrongGioHangPhaiKhong = true;
				item.setSoluong(item.getSoluong() + sanPhamTrongGioHang.getSoluong());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng.
		if (!sanPhamDaCoTrongGioHangPhaiKhong) {

			Product product = productRepo.getOne(sanPhamTrongGioHang.getMaSanPham());
			sanPhamTrongGioHang.setTenSanPham(product.getTitle());
			if (product.getPriceSale() != null) {
				sanPhamTrongGioHang.setGiaban(product.getPriceSale());
			} else {
				sanPhamTrongGioHang.setGiaban(product.getPrice());
			}
			sanPhamTrongGioHang.setUrlImage(product.getProductImages().get(0).getTitle());
			gioHang.getSanPhamTrongGioHangs().add(sanPhamTrongGioHang);
		}

		httpSession.setAttribute("SL_SP_GIO_HANG", gioHang.getSanPhamTrongGioHangs().size());

		return ResponseEntity.ok(new AjaxResponse(200, String.valueOf(gioHang.getSanPhamTrongGioHangs().size())));
	}

	@RequestMapping(value = { "/hien-thi-san-pham-trong-gio-hang" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		// lấy đối tượng SESSION trong memory dựa vào SESSION_ID có trong request.
		HttpSession httpSession = request.getSession();

		String str = null;
		// kiểm tra xem SESSION đã có gio hàng chưa ?
		// nếu chưa có thì tạo mới 1 giỏ hàng và lưu vào SESSION.
		if (httpSession.getAttribute("GIO_HANG") != null) {
			str = "front-end/hien-thi-san-pham-trong-gio-hang";
		} else {
			str = "front-end/giohangtrong";
		}
		return str;
	}

	@RequestMapping(value = { "/hien-thi-san-pham-trong-gio-hang/{id}" }, method = RequestMethod.GET)
	public String indexD(@PathVariable Integer id, final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		// lấy đối tượng SESSION trong memory dựa vào SESSION_ID có trong request.
		HttpSession httpSession = request.getSession();
		
		GioHang gioHang = (GioHang) httpSession.getAttribute("GIO_HANG");
		if (httpSession.getAttribute("GIO_HANG") != null) {
			gioHang = (GioHang) httpSession.getAttribute("GIO_HANG");

			List<SanPhamTrongGioHang> list = gioHang.getSanPhamTrongGioHangs();
			Iterator<SanPhamTrongGioHang> it = list.iterator();
			for (Iterator<SanPhamTrongGioHang> iterator = list.iterator(); iterator.hasNext();) {
			    SanPhamTrongGioHang integer = iterator.next();
			    if(integer.getMaSanPham() == id) {
			        iterator.remove();
			    }
			}
			//httpSession.setAttribute("GIO_HANG", gioHang);
		}
		String str = null;
		if (httpSession.getAttribute("GIO_HANG") != null) {
			str = "front-end/hien-thi-san-pham-trong-gio-hang";
		} else {
			str = "front-end/giohangtrong";
		}
		httpSession.setAttribute("SL_SP_GIO_HANG", gioHang.getSanPhamTrongGioHangs().size());
		return str;
	}

	@RequestMapping(value = { "/luu_don_hang" }, method = RequestMethod.POST)
	public String save(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {

		// lấy đối tượng SESSION trong memory dựa vào SESSION_ID có trong request.
		HttpSession httpSession = request.getSession();

		GioHang gioHang = (GioHang) httpSession.getAttribute("GIO_HANG");

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");

		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCode(String.valueOf(System.currentTimeMillis()));
		saleOrder.setCreatedDate(LocalDate.now());
		saleOrder.setCustomerName(name);
		saleOrder.setCustomerAddress(address);
		saleOrder.setCustomerPhone(phone);
		saleOrder.setCustomerEmail(email);
		saleOrder.setTotal(gioHang.getTotal(productRepo));

		for (SanPhamTrongGioHang sanPhamTrongGioHang : gioHang.getSanPhamTrongGioHangs()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productRepo.getOne(sanPhamTrongGioHang.getMaSanPham()));
			saleOrderProducts.setQuality(sanPhamTrongGioHang.getSoluong());
			saleOrderProducts.setPrice(sanPhamTrongGioHang.getGiaban());
			saleOrderProducts.setCreatedDate(LocalDate.now());
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}

		saleOrderRepo.save(saleOrder);
		sendEmailService.sendMail(email, "MonaWatch", "Chúng tôi cảm ơn quý khách đã ủng hộ cửa hàng! Chúc quý khách một ngày vui vẻ."
				+ "\n Tổng giá trị đơn hàng:"+gioHang.getTotal(productRepo));

		// lưu xong xoá giỏ hàng đi
		httpSession.removeAttribute("GIO_HANG");
		httpSession.removeAttribute("SL_SP_GIO_HANG");
		model.addAttribute("message",
				"<script type=\"text/javascript\">\r\n" + "	alert('Cảm ơn bạn đã mua hàng!')\r\n" + "</script>");
		return "front-end/trangchu";
	}
	
	@RequestMapping(value = { "/update-gio" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> update(@RequestBody SanPhamTrongGioHang sanPhamTrongGioHang,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		// lấy đối tượng SESSION trong memory dựa vào SESSION_ID có trong request.
		HttpSession httpSession = request.getSession();

		GioHang gioHang = (GioHang) httpSession.getAttribute("GIO_HANG");


		List<SanPhamTrongGioHang> _sanPhamTrongGioHangs = gioHang.getSanPhamTrongGioHangs();

		for (SanPhamTrongGioHang item : _sanPhamTrongGioHangs) {
			if (item.getMaSanPham() == sanPhamTrongGioHang.getMaSanPham()) {
				item.setSoluong(sanPhamTrongGioHang.getSoluong());
			}
		}
		return ResponseEntity.ok(new AjaxResponse(200, String.valueOf(gioHang.getSanPhamTrongGioHangs().size())));
	}
}
