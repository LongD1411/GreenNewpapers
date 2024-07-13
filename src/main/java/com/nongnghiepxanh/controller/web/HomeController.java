package com.nongnghiepxanh.controller.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value="homeControllerOfWeb")
public class HomeController {
	@RequestMapping(value="/trang-chu",method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("web/index");
		mav.addObject("active", "home");
		return mav;
	}
	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}
	@RequestMapping(value = "/lien-he", method = RequestMethod.GET)
	public ModelAndView contact() {
		ModelAndView mav = new ModelAndView("web/contact");
		return mav;
	}
	@RequestMapping(value = "/single-new-test", method = RequestMethod.GET)
	public ModelAndView singlenew() {
		ModelAndView mav = new ModelAndView("web/SingleNew");
		return mav;
	}
	@RequestMapping(value = "/thoat", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new  ModelAndView("redirect:/trang-chu");
	}
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		ModelAndView mav = new ModelAndView("redirect:/dang-nhap?accessDenied");
		return mav;
	}
}
