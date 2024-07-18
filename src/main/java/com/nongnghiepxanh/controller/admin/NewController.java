package com.nongnghiepxanh.controller.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nongnghiepxanh.dto.NewDTO;
import com.nongnghiepxanh.service.ICategoryService;
import com.nongnghiepxanh.service.INewService;

@Controller(value = "newControllerOfAdmin")
public class NewController {
	@Autowired
	private INewService newService;
	@Autowired ICategoryService categoryService;
	@RequestMapping(value = "/quan-tri/bai-viet/danh-sach", method = RequestMethod.GET)
	public ModelAndView home(@RequestParam(value = "page", defaultValue = "1", required = false) int page) {
		Pageable pageAble = new PageRequest(page - 1, 4);
		NewDTO model = new NewDTO();
		model.setListResult(newService.findAll(pageAble));
		model.setLimit(4);
		model.setPage(page);
		model.setTotalItem(newService.totalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));

		ModelAndView mav = new ModelAndView("admin/new/list");
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/bai-viet/chinh-sua", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam(value = "id",required = false, defaultValue = "-1")long id) {
		ModelAndView mav = new ModelAndView("admin/new/edit");
		NewDTO model = new NewDTO();
		Map<String,String> categories = categoryService.findAll();
		mav.addObject("categories", categories);
		if(id==-1) {
			mav.addObject("model", model);
		}else {
			model = newService.findOneByID(id);
			mav.addObject("model", model);
		}
		return mav;
	}
}
