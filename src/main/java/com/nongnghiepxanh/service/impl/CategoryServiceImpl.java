package com.nongnghiepxanh.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nongnghiepxanh.convert.CategoryConvert;
import com.nongnghiepxanh.entity.CategoryEntity;
import com.nongnghiepxanh.repository.CategoryRepository;
import com.nongnghiepxanh.service.ICategoryService;
@Service
public class CategoryServiceImpl implements ICategoryService {
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private CategoryConvert categoryConvert;
	@Override
	public Map<String,String> findAll() {	
		List<CategoryEntity> entities = categoryRepository.findAll();
		Map<String,String> result = new HashMap<>();
		for(CategoryEntity item: entities) {
			result.put(item.getCode(), item.getName());
		}
		return result;
	}
}
