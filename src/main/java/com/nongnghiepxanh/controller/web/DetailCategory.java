package com.nongnghiepxanh.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nongnghiepxanh.dto.CategoryDTO;
import com.nongnghiepxanh.dto.NewDTO;
import com.nongnghiepxanh.service.ICategoryService;
import com.nongnghiepxanh.service.INewService;

@Controller
@RequestMapping(value = "/danh-muc")
public class DetailCategory {
	@Autowired
	private INewService newService;
	@Autowired
	private ICategoryService categoryService;
	@RequestMapping(value = "/{categoryCode}", method = RequestMethod.GET)
	public ModelAndView home(@PathVariable("categoryCode") String categoryCode) {
		ModelAndView mav = new ModelAndView("web/detailcategory");
		//content	
		NewDTO model = new NewDTO();
		model.setListResult(newService.findNewByCategoryCode(categoryCode));
		model.setMessage("category");
		model.setAlert(categoryCode);
		mav.addObject("newModel", model);
		
		CategoryDTO categoryModel = categoryService.findOneByCategoryCode(categoryCode);
		categoryModel.setListResult(categoryService.findAllCategory());
		mav.addObject("categoryModel", categoryModel);
		mav.addObject("active", "category");
		return mav;

	}
}
