	package com.nongnghiepxanh.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.nongnghiepxanh.dto.NewDTO;

public  interface INewService {
	List<NewDTO> findAll(Pageable pageAble);
	int totalItem();
	NewDTO save(NewDTO dto);
	NewDTO findOneByID(Long id);
	void deleteNew(long [] ids);
}
