package com.leubao.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.leubao.convert.CategoryConvert;
import com.leubao.convert.NewConvert;
import com.leubao.dto.CategoryDTO;
import com.leubao.dto.NewDTO;
import com.leubao.entity.CategoryEntity;
import com.leubao.entity.NewEntity;
import com.leubao.repository.CategoryRepository;
import com.leubao.repository.NewRepository;
import com.leubao.service.INewService;
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
		 NewEntity entity = newRepository.save(newEntity);
		return  dto;
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
	@Override
	public List<NewDTO> findNewByCategoryCode(String code) {
		return newConvert.toDTO(newRepository.findByCategoryCode(code));
	}
	@Override
	public NewDTO findOneById(Long id) {
		
		return newConvert.toDTO(newRepository.findOne(id));
	}
}
