package com.nongnghiepxanh.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "categoryControllerOfWeb")
public class CategoryController {
	@RequestMapping(value="/danh-muc",method = RequestMethod.GET)
	public ModelAndView category() {
		ModelAndView mav = new ModelAndView("web/category");
		mav.addObject("active", "category");
		return mav;
	}
}
