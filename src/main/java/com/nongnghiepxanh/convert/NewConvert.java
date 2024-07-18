package com.nongnghiepxanh.convert;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.nongnghiepxanh.dto.NewDTO;
import com.nongnghiepxanh.entity.CategoryEntity;
import com.nongnghiepxanh.entity.NewEntity;
import com.nongnghiepxanh.repository.CategoryRepository;

@Component
public class NewConvert {
	public List<NewDTO> toDTO(List<NewEntity> entities){
			List<NewDTO> result = new ArrayList<>();
			for(NewEntity item : entities) {
				NewDTO dto = new NewDTO();
				dto.setTitle(item.getTitle());
				dto.setCategoryCode(item.getCategory().getCode());
				dto.setId(item.getId());
				dto.setContent(item.getContent());
				dto.setShortDescription(item.getShortDescription());
				dto.setThumbnail(item.getThumbnail());
				dto.setType(item.getType());
				dto.setCreatedDate((Timestamp) item.getCreatedDate());
				dto.setModifiedBy(item.getModifiedBy());
				result.add(dto);
			}
		return result;
	}
	public NewEntity toEntity(NewDTO dto) {
		NewEntity entity = new NewEntity();
		entity.setContent(dto.getContent());
		entity.setShortDescription(dto.getShortDescription());
		entity.setTitle(dto.getTitle());
		entity.setThumbnail(dto.getThumbnail());
		entity.setType(dto.getType());
		return entity;
	}
	public NewEntity toEntity(NewEntity entity,NewDTO dto) {
		entity.setContent(dto.getContent());
		entity.setShortDescription(dto.getShortDescription());
		entity.setThumbnail(dto.getThumbnail());
		entity.setTitle(dto.getTitle());
		entity.setType(dto.getType());
		return entity;
	}
	public NewDTO toDTO(NewEntity entity) {
		NewDTO dto = new NewDTO();
		dto.setCategoryCode(entity.getCategory().getCode());
		dto.setContent(entity.getContent());
		dto.setShortDescription(entity.getShortDescription());
		dto.setTitle(entity.getTitle());
		dto.setId(entity.getId());
		dto.setThumbnail(entity.getThumbnail());
		dto.setType(entity.getType());
		dto.setCreatedDate((Timestamp) entity.getCreatedDate());
		dto.setModifiedBy(entity.getModifiedBy());
		return dto;
		
	}
}
