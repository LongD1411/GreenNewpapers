package com.nongnghiepxanh.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nongnghiepxanh.entity.CategoryEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {
	CategoryEntity findOneByCode(String Code);
}
