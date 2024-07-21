	package com.nongnghiepxanh.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.nongnghiepxanh.dto.NewDTO;

public  interface INewService {
	List<NewDTO> findAll(Pageable pageAble);
	int totalItem();
	NewDTO save(NewDTO dto);
	NewDTO findOneByID(Long id);
	List<NewDTO> findNewByCategoryCode(String code);
	void deleteNew(long [] ids);
	List<NewDTO> findHeadNew(String type);
	List<NewDTO> findAllTop2();
	NewDTO findOneById(Long id);
}
