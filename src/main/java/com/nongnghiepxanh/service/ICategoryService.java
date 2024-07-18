package com.nongnghiepxanh.service;

import java.util.List;
import java.util.Map;

import com.nongnghiepxanh.dto.CategoryDTO;

public interface ICategoryService {
	Map<String,String> findAll();
	List<CategoryDTO> topCategory(String type);
}
