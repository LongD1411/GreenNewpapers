package com.nongnghiepxanh.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nongnghiepxanh.convert.CategoryConvert;
import com.nongnghiepxanh.dto.CategoryDTO;
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
	@Override
	public List<CategoryDTO> topCategory(String type) {
		
		return categoryConvert.toDTO(categoryRepository.findAllByType(type));
	}
	@Override
	public List<CategoryDTO> findAllCategory() {
		return  categoryConvert.toDTO(categoryRepository.findAll());
	}
	@Override
	public List<CategoryDTO> findAllCategoryWorking() {
        return categoryRepository.findAllCategoryWorking();
    }
	@Override
	public CategoryDTO findOneByCategoryCode(String code) {
		// TODO Auto-generated method stub
		return categoryConvert.toDTO(categoryRepository.findOneByCode(code));
	}
}
