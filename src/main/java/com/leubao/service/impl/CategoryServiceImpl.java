package com.leubao.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.leubao.convert.CategoryConvert;
import com.leubao.dto.CategoryDTO;
import com.leubao.entity.CategoryEntity;
import com.leubao.repository.CategoryRepository;
import com.leubao.repository.NewRepository;
import com.leubao.service.ICategoryService;
@Service
public class CategoryServiceImpl implements ICategoryService {
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private NewRepository newRepository;
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
	@Override
	public CategoryDTO findOneByID(Long id) {
		
		return categoryConvert.toDTO(categoryRepository.findOne(id));
	}
	@Override
	public CategoryDTO save(CategoryDTO dto) {
		CategoryDTO dto2 = new CategoryDTO();
		if(dto.getId()==null) {
			dto2 =  categoryConvert.toDTO(categoryRepository.save(categoryConvert.toEntity(dto)));
		}else {
			CategoryEntity oldEntity = categoryRepository.findOne(dto.getId());
			CategoryEntity newEntity = categoryConvert.toEntity(dto, oldEntity);
			dto2 = categoryConvert.toDTO(categoryRepository.save(newEntity));
		}
		return dto2;
	}	
//	 public void deleteCategory(long [] ids) {
//	       for(Long id :ids) {
//	    	   if (newRepository.existsByCategoryId(id)) {
//		            throw new IllegalStateException("Cannot delete category with related news items.");
//		        }
//		        categoryRepository.delete(id);
//	       }
//	    }
}
