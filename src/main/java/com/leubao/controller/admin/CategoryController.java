package com.leubao.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.leubao.dto.CategoryDTO;
import com.leubao.service.ICategoryService;

@Controller(value="categoryControllerOfAdmin")
public class CategoryController {
	@Autowired
	private ICategoryService categoryService;
	@RequestMapping(value = "/quan-tri/danh-muc/danh-sach", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("admin/category/list");
		CategoryDTO model = new CategoryDTO();
		model.setListResult(categoryService.findAllCategory());
		mav.addObject("model", model);
		return mav;
	}
	@RequestMapping(value="/quan-tri/danh-muc/chinh-sua")
	public ModelAndView edit(@RequestParam(value = "id", required = false, defaultValue = "-1") Long id) {
		ModelAndView mav = new ModelAndView("admin/category/edit");
		CategoryDTO model = new CategoryDTO();
		if(id==-1) {
			mav.addObject("model", model);
		}else {
			model = categoryService.findOneByID(id);
			mav.addObject("model", model);
		}
		return mav;
	}
}
