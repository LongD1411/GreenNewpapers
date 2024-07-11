package com.nongnghiepxanh.service.impl;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nongnghiepxanh.convert.NewConvert;
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
	@Override
	public List<NewDTO> findAll(Pageable pageAble) {
		List<NewDTO> result = newConvert.toDTO(newRepository.findAll(pageAble).getContent());
		Collections.reverse(result);
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
}