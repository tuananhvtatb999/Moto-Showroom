package com.devpro.controller.admin;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devpro.entities.Product;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.controller.BaseController;
import com.devpro.entities.SaleOrder;
import com.devpro.model.AjaxResponse;
import com.devpro.repositories.SaleOrderRepo;

@Controller
public class AdminOrderController extends BaseController {

	@Autowired
	SaleOrderRepo saleOrderRepo;

	@GetMapping("/admin/list-orders")
	public String order(final HttpServletRequest request, final ModelMap model) {
		String search = request.getParameter("search");
		
		if (search != null) {
			List<SaleOrder> saleOrders = new ArrayList<SaleOrder>();
			for (SaleOrder saleOrder : saleOrderRepo.findAll()) {
				if (saleOrder.getCode().toLowerCase().equals(search.toLowerCase())) {
					saleOrders.add(saleOrder);
				}
			}
			model.addAttribute("orders", saleOrders);
		}
		return "back-end/donhang";
	}

	@GetMapping("/admin/list-orders/{id}")
	public String order(@PathVariable Integer id, final HttpServletRequest request) {
		SaleOrder sale = saleOrderRepo.getOne(id);
		// sale.setStatus(Integer.parseInt(request.getParameter("gridRadios")));
		saleOrderRepo.save(sale);
		return "back-end/donhang";
	}

	@RequestMapping(value = { "/delete-order" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> deletesaleOrder(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody Integer id) {
		saleOrderRepo.deleteById(id);
		return ResponseEntity.ok(new AjaxResponse(200, "Xóa thành công!"));
	}

	@PostMapping(value = { "/update-status" })
	public ResponseEntity<AjaxResponse> updateStatus(@RequestBody String data) {
		JSONObject json = new JSONObject(data);
		SaleOrder order = saleOrderRepo.getOne(json.getInt("id"));
		order.setStatus(json.getInt("status"));
		order.setUpdatedDate(LocalDate.now());
		saleOrderRepo.save(order);
		return ResponseEntity.ok(new AjaxResponse(200,"Success"));
	}
}
