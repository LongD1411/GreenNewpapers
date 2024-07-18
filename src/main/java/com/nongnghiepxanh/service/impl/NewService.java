package com.nongnghiepxanh.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nongnghiepxanh.convert.CategoryConvert;
import com.nongnghiepxanh.convert.NewConvert;
import com.nongnghiepxanh.dto.CategoryDTO;
import com.nongnghiepxanh.dto.NewDTO;
import com.nongnghiepxanh.entity.CategoryEntity;
import com.nongnghiepxanh.entity.NewEntity;
import com.nongnghiepxanh.repository.CategoryRepository;
import com.nongnghiepxanh.repository.NewRepository;
import com.nongnghiepxanh.service.INewService;
@Service
public class NewService implements INewService{
	@Autowired
	private NewRepository newRepository;
	@Autowired
	private CategoryRepository cateRepo;
	@Autowired
	private NewConvert newConvert;
	@Autowired
	private CategoryConvert cateConvert;
	@Override
	public List<NewDTO> findAll(Pageable pageAble) {
		List<NewDTO> result = newConvert.toDTO(newRepository.findAll(pageAble).getContent());
		return result;
	}
	@Override
	public int totalItem() {
		
		return (int) newRepository.count();
	}
	@Override
	@Transactional
	public NewDTO save(NewDTO dto) {
		CategoryEntity categoryEntity = cateRepo.findOneByCode(dto.getCategoryCode());
		NewEntity newEntity = new NewEntity();
		if(dto.getId() != null) {
			NewEntity oldNewEntity = newRepository.findOne(dto.getId());
			newEntity = newConvert.toEntity(oldNewEntity, dto);
			newEntity.setCategory(categoryEntity);
		}else {
			newEntity = newConvert.toEntity(dto);
		    newEntity.setCategory(categoryEntity);
		}
		return newConvert.toDTO(newRepository.save(newEntity));
	}
	@Override
	public NewDTO findOneByID(Long id) {
		return newConvert.toDTO(newRepository.findOne(id));
	}
	@Override
	@Transactional
	public void deleteNew(long[] ids) {
		for(Long id: ids) {
			newRepository.delete(id);
		}
	}
	@Override
	public List<NewDTO> findHeadNew(String type) {
		 return newConvert.toDTO(newRepository.findAllByType(type));
	}
	@Override
	public List<NewDTO> findAllTop2() {
		List<NewDTO> result = new ArrayList<>();
		List<CategoryDTO> categoryList = cateConvert.toDTO(cateRepo.findAll());
		for(CategoryDTO category: categoryList) {
			 Pageable pageable = new PageRequest(0, 2);
			List<NewDTO> news = newConvert.toDTO(newRepository.findTop2ByCategoryId(category.getId(),pageable));
			result.addAll(news);
		}
		return result;
	}
}
