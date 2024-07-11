package com.nongnghiepxanh.convert;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.nongnghiepxanh.dto.CategoryDTO;
import com.nongnghiepxanh.entity.CategoryEntity;

@Component
public class CategoryConvert {
	public List<CategoryDTO> toDTO(List<CategoryEntity> entities) {
		List<CategoryDTO> result = new ArrayList<>();
		for(CategoryEntity item: entities) {
			CategoryDTO dto = new CategoryDTO();
			dto.setCode(item.getCode());
			dto.setId(item.getId());
			dto.setName(item.getName());
			result.add(dto);
		}
		return result;
	}
}
