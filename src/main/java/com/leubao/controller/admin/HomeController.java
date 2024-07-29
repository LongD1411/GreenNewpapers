//package com.nongnghiepxanh.controller.admin;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.data.domain.Pageable;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.nongnghiepxanh.dto.NewDTO;
//import com.nongnghiepxanh.service.INewService;
//
//@Controller(value = "homeControllerOfAdmin")
//public class HomeController {
//	@Autowired
//	private INewService iNewService;
//
//	@RequestMapping(value = "/quan-tri/trang-chu", method = RequestMethod.GET)
//	public ModelAndView home(@RequestParam(value = "page", required = false, defaultValue = "-1") int page) {
//		NewDTO model = new NewDTO();
//
//		if (page == -1) {
//			page = 1;
//		}
//		model.setPage(page);
//		model.setLimit(1);
//		Pageable pageAble = new PageRequest(page - 1, 1);
//		model.setListResult(iNewService.findAll(pageAble));
//		model.setTotalItem(iNewService.totalItem());
//		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
//		ModelAndView mav = new ModelAndView("admin/new/list");
//		mav.addObject("model", model);
//		return mav;
//	}
//
//}
package com.leubao.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "homeControllerOfAdmin")
public class HomeController {
	@RequestMapping(value = "/quan-tri/trang-chu", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("admin/index");
		return mav;
	}
}
