package com.nongnghiepxanh.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nongnghiepxanh.entity.NewEntity;

public interface NewRepository extends JpaRepository<NewEntity, Long> {
	List<NewEntity> findAllByType(String type);
}
