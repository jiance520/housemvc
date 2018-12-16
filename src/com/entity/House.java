package com.entity;

import java.util.Date;

public class House {
    private Integer id;

    private Integer userId;

    private Integer typeId;

    private String title;

    private String description;

    private Integer price;

    private Date pubdate;

    private Integer floorage;

    private String contact;

    private Integer streetId;

    private String image;
    private Street street;
    private Type2 type;
    private Users user;
	public House() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Date getPubdate() {
		return pubdate;
	}
	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}
	public Integer getFloorage() {
		return floorage;
	}
	public void setFloorage(Integer floorage) {
		this.floorage = floorage;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public Integer getStreetId() {
		return streetId;
	}
	public void setStreetId(Integer streetId) {
		this.streetId = streetId;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Street getStreet() {
		return street;
	}
	public void setStreet(Street street) {
		this.street = street;
	}
	public Type2 getType() {
		return type;
	}
	public void setType(Type2 type) {
		this.type = type;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "House [id=" + id + ", userId=" + userId + ", typeId=" + typeId
				+ ", title=" + title + ", description=" + description
				+ ", price=" + price + ", pubdate=" + pubdate + ", floorage="
				+ floorage + ", contact=" + contact + ", streetId=" + streetId
				+ ", image=" + image + ", street=" + street + ", type=" + type
				+ ", user=" + user + "]";
	}

}