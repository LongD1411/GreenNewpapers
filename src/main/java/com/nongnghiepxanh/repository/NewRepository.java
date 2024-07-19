package com.nongnghiepxanh.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.nongnghiepxanh.entity.NewEntity;

public interface NewRepository extends JpaRepository<NewEntity, Long> {
	List<NewEntity> findAllByType(String type);
	@Query("SELECT n FROM NewEntity n WHERE n.category.id = ?1 ORDER BY n.createdDate DESC")
    List<NewEntity> findTop2ByCategoryId(Long categoryId, Pageable pageable);
	List<NewEntity> findByCategoryCode(String code);
}
