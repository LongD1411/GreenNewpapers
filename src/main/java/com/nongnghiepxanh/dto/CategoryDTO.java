package com.nongnghiepxanh.dto;

public class CategoryDTO  extends AbstractDTO<CategoryDTO>{
	private String name, code, thumbnail, type;
	public CategoryDTO(Long id, String name, String code, String thumbnail, String type) {
        super(id);
        this.name = name;
        this.code = code;
        this.thumbnail = thumbnail;
        this.type = type;
    }
	
	public CategoryDTO() {
	}

	public String getName() {
		return name;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
