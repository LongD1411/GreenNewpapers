package com.leubao.controller.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.leubao.dto.CategoryDTO;
import com.leubao.dto.NewDTO;
import com.leubao.service.ICategoryService;
import com.leubao.service.INewService;

@Controller(value="homeControllerOfWeb")
public class HomeController {
	@Autowired
	private INewService newService;
	@Autowired
	private ICategoryService categoryService;
	@RequestMapping(value="/trang-chu",method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("web/index");
		mav.addObject("active", "home");
		List<NewDTO> headNew = newService.findHeadNew("hot");
		List<NewDTO> featuredNew = newService.findHeadNew("featured");
		List<NewDTO> midNew = newService.findHeadNew("mid");
		List<CategoryDTO> topCategory = categoryService.topCategory("hot");
		CategoryDTO categoryModel = new CategoryDTO();
		categoryModel.setListResult(categoryService.findAllCategory());
		mav.addObject("categoryModel", categoryModel);
		mav.addObject("headNewList",headNew);
		mav.addObject("categoryModel",categoryModel);
		mav.addObject("midNewList",midNew);
		mav.addObject("featuredNews",featuredNew);
		mav.addObject("categoryList",topCategory);
		return mav;
	}
}
