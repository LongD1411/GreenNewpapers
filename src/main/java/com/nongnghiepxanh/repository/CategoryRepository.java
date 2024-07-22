package com.nongnghiepxanh.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.nongnghiepxanh.dto.CategoryDTO;
import com.nongnghiepxanh.entity.CategoryEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {
	CategoryEntity findOneByCode(String Code);

	List<CategoryEntity> findAllByType(String type);

	@Query("select distinct new com.nongnghiepxanh.dto.CategoryDTO(c.id, c.name, c.code, c.thumbnail, c.type) from CategoryEntity c join c.news n")
	List<CategoryDTO> findAllCategoryWorking();
}