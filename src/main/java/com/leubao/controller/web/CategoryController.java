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

@Controller(value = "categoryControllerOfWeb")
public class CategoryController {
	@Autowired
	private INewService newService;
	@Autowired
	private ICategoryService categoryService;
	@RequestMapping(value="/danh-muc",method = RequestMethod.GET)
	public ModelAndView category() {
		ModelAndView mav = new ModelAndView("web/category");
		//footer
		CategoryDTO categoryModel = new CategoryDTO();
		categoryModel.setListResult(categoryService.findAllCategory());
		mav.addObject("categoryModel", categoryModel);
		//content
		List<NewDTO> trendNews =  newService.findHeadNew("hot");
		List<CategoryDTO> categoryList = categoryService.findAllCategoryWorking();
		List<NewDTO> news = newService.findAllTop2();
		mav.addObject("trendNews",trendNews);
		mav.addObject("categoryList", categoryList);
		mav.addObject("news", news);
		mav.addObject("active", "category");
		return mav;
	}
}
