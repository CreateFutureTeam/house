package com.offcn.house.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class House {
    private Integer id;

    private Integer userId;

    private Integer typeId;

    private String title;

    private String description;

    private Integer price;
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date pubdate;

    private Integer floorage;

    private String contact;

    private Integer streetId;
    //街道名字
    private String streetName;
    //区域名字
    private String districtName;
    //房屋类型
    private String typeName;
    
    private Integer driId;
//    开始时间
    private Date beginTime;
//    结束时间
    private Date endTime;
    //最小面积
    private Integer minFloorage;
    //最大面积
    private Integer maxFloorage;
    //最小价格
    private Integer minPrice;
    //最大价格
    private Integer maxPrice;
    
    public Integer getMinFloorage() {
		return minFloorage;
	}

	public void setMinFloorage(Integer minFloorage) {
		this.minFloorage = minFloorage;
	}

	public Integer getMaxFloorage() {
		return maxFloorage;
	}

	public void setMaxFloorage(Integer maxFloorage) {
		this.maxFloorage = maxFloorage;
	}

	public Integer getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(Integer minPrice) {
		this.minPrice = minPrice;
	}

	public Integer getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(Integer maxPrice) {
		this.maxPrice = maxPrice;
	}

	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Integer getDriId() {
		return driId;
	}

	public void setDriId(Integer driId) {
		this.driId = driId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public Integer getId(){
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
        this.title = title == null ? null : title.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
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
        this.contact = contact == null ? null : contact.trim();
    }

    public Integer getStreetId() {
        return streetId;
    }

    public void setStreetId(Integer streetId) {
        this.streetId = streetId;
    }
}