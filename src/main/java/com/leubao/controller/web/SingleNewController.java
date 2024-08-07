package com.leubao.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.leubao.dto.CategoryDTO;
import com.leubao.dto.NewDTO;
import com.leubao.service.ICategoryService;
import com.leubao.service.INewService;

@Controller(value="singlenewsControllerOfWeb")
public class SingleNewController {
	@Autowired
	private INewService newService;
	@Autowired
	private ICategoryService categoryService;
	@RequestMapping(value ="/{id}", method = RequestMethod.GET)
	public ModelAndView newPage(@PathVariable("id") Long id) {
		ModelAndView mav = new ModelAndView("web/SingleNew");
		NewDTO model = newService.findOneById(id);
		model.setListResult(newService.findHeadNew("hot"));
		CategoryDTO categoryModel = new CategoryDTO();
		categoryModel.setListResult(categoryService.findAllCategory());
		mav.addObject("model", model);
		mav.addObject("categoryModel", categoryModel);
		return mav;
	}
}
