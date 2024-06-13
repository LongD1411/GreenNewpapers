package com.nongnghiepxanh.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.nongnghiepxanh.dto.MyUser;
import com.nongnghiepxanh.entity.RoleEntity;
import com.nongnghiepxanh.entity.UserEntity;
import com.nongnghiepxanh.repository.UserRepository;


@Service
public class CustomUserDetailsService implements UserDetailsService{
	@Autowired
	private UserRepository userRepository;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity userEntity = userRepository.findOneByUserNameAndStatus(username, 1);
		if(userEntity ==null) {
			throw new UsernameNotFoundException("User not found");
		}	
		List<GrantedAuthority> authorities = new ArrayList<>();
		for(RoleEntity role: userEntity.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getCode()));
		}
		//put thong tin vao security, duy tri thong tin khi user login vao he thong
		MyUser myUser = new MyUser(userEntity.getUserName(), userEntity.getPassword(), true, true, true, true, authorities);
		myUser.setFullName(userEntity.getFullName());
		return myUser;
	}

}
