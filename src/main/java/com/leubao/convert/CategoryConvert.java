package com.leubao.convert;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.leubao.dto.CategoryDTO;
import com.leubao.entity.CategoryEntity;

@Component
public class CategoryConvert {
	public List<CategoryDTO> toDTO(List<CategoryEntity> entities) {
		List<CategoryDTO> result = new ArrayList<>();
		for(CategoryEntity item: entities) {
			CategoryDTO dto = new CategoryDTO();
			dto.setCode(item.getCode());
			dto.setId(item.getId());
			dto.setName(item.getName());
			dto.setThumbnail(item.getThumbnail());
			dto.setType(item.getType());
			result.add(dto);
		}
		return result;
	}
	public CategoryDTO toDTO(CategoryEntity entity) {
		CategoryDTO dto = new CategoryDTO();
		dto.setCode(entity.getCode());
		dto.setId(entity.getId());
		dto.setName(entity.getName());
		dto.setThumbnail(entity.getThumbnail());
		dto.setType(entity.getType());
		return dto;
	}
	public CategoryEntity toEntity(CategoryDTO dto) {
		CategoryEntity entity = new CategoryEntity();
		entity.setCode(dto.getCode());
		entity.setName(dto.getName());
		entity.setThumbnail(dto.getThumbnail());
		entity.setType(dto.getType());
		return entity;
	}
	public CategoryEntity toEntity(CategoryDTO dto, CategoryEntity entity) {
		entity.setCode(dto.getCode());
		entity.setName(dto.getName());
		entity.setThumbnail(dto.getThumbnail());
		entity.setType(dto.getType());
		return entity;
	}
}
