package com.leubao.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.leubao.dto.CategoryDTO;
import com.leubao.service.ICategoryService;
import com.leubao.service.INewService;

@Controller(value = "contactControllerOfWeb")
public class ContactController {
	@Autowired
	private ICategoryService categoryService;
	@RequestMapping(value = "/lien-he", method = RequestMethod.GET)
	public ModelAndView contact() {
		ModelAndView mav = new ModelAndView("web/contact");
		// footer
		CategoryDTO categoryModel = new CategoryDTO();
		categoryModel.setListResult(categoryService.findAllCategory());
		mav.addObject("categoryModel", categoryModel);
		mav.addObject("active", "contact");
		return mav;
	}
}
