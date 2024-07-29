package com.leubao.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.leubao.dto.CategoryDTO;
import com.leubao.entity.CategoryEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {
	CategoryEntity findOneByCode(String Code);

	List<CategoryEntity> findAllByType(String type);

	@Query("select distinct new com.leubao.dto.CategoryDTO(c.id, c.name, c.code, c.thumbnail, c.type) from CategoryEntity c join c.news n")
	List<CategoryDTO> findAllCategoryWorking();
}