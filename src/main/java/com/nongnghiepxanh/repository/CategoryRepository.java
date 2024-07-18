package com.nongnghiepxanh.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nongnghiepxanh.entity.CategoryEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {
	CategoryEntity findOneByCode(String Code);
	List<CategoryEntity> findAllByType(String type);
}
