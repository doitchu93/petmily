package com.kh.adoption.model.vo;

public class Animal {
	
	private int animalNo; // 동물 번호
	private String categoryNo; // 1.개  2.고양이  3.기타
	private String categoryName;
	private String animalName; // 동물 이름
	private String gender; // 동물 성별
	private String neutralization; // 중성화여부 default 'Y'
	private int animalAge; // 동물 나이
	private double weight; // 동물 몸무게 (kg)
	private int friendly; // 친화도
	private int active; // 활발함
	private String adopted; // 입양여부 default 'N'
	private String description; // 상세설명
	private int userNo; // 회원번호
	private String titleImg;
	
	public Animal() {}
	
	public Animal(int animalNo, String categoryName, String animalName, String gender, String neutralization,
			int animalAge, double weight) {
		super();
		this.animalNo = animalNo;
		this.categoryName = categoryName;
		this.animalName = animalName;
		this.gender = gender;
		this.neutralization = neutralization;
		this.animalAge = animalAge;
		this.weight = weight;
	}
	public Animal(int animalNo, String categoryNo, String animalName, String gender, String neutralization,
			int animalAge, double weight, int friendly, int active, String adopted, String description, int userNo) {
		super();
		this.animalNo = animalNo;
		this.categoryNo = categoryNo;
		this.animalName = animalName;
		this.gender = gender;
		this.neutralization = neutralization;
		this.animalAge = animalAge;
		this.weight = weight;
		this.friendly = friendly;
		this.active = active;
		this.adopted = adopted;
		this.description = description;
		this.userNo = userNo;
	}


	public Animal(String categoryNo, String animalName, String gender, String neutralization, int animalAge,
			double weight, int friendly, int active, String description, int userNo) {
		super();
		this.categoryNo = categoryNo;
		this.animalName = animalName;
		this.gender = gender;
		this.neutralization = neutralization;
		this.animalAge = animalAge;
		this.weight = weight;
		this.friendly = friendly;
		this.active = active;
		this.description = description;
		this.userNo = userNo;
	}


	public Animal(int animalNo, String categoryNo, String animalName, String gender, String neutralization,
			int animalAge, double weight, int friendly, int active, String adopted, String description, int userNo,
			String titleImg) {
		super();
		this.animalNo = animalNo;
		this.categoryNo = categoryNo;
		this.animalName = animalName;
		this.gender = gender;
		this.neutralization = neutralization;
		this.animalAge = animalAge;
		this.weight = weight;
		this.friendly = friendly;
		this.active = active;
		this.adopted = adopted;
		this.description = description;
		this.userNo = userNo;
		this.titleImg = titleImg;
	}



	public Animal(int animalNo, String categoryNo, String animalName, String gender, String neutralization, int animalAge,
			double weight, int friendly, int active, String adopted, String description) {
		super();
		this.animalNo = animalNo;
		this.categoryNo = categoryNo;
		this.animalName = animalName;
		this.gender = gender;
		this.neutralization = neutralization;
		this.animalAge = animalAge;
		this.weight = weight;
		this.friendly = friendly;
		this.active = active;
		this.adopted = adopted;
		this.description = description;
	}
	
	
	// insertAnimal
	public Animal(String categoryNo, String animalName, String gender, String neutralization, int animalAge, double weight,
			int friendly, int active, String description) {
		super();
		this.categoryNo = categoryNo;
		this.animalName = animalName;
		this.gender = gender;
		this.neutralization = neutralization;
		this.animalAge = animalAge;
		this.weight = weight;
		this.friendly = friendly;
		this.active = active;
		this.description = description;
	}
	
	
	// selectAnimalList
	public Animal(int animalNo, String categoryNo, String animalName, String gender, String neutralization,
			int animalAge, double weight, String adopted, String titleImg) {
		super();
		this.animalNo = animalNo;
		this.categoryNo = categoryNo;
		this.animalName = animalName;
		this.gender = gender;
		this.neutralization = neutralization;
		this.animalAge = animalAge;
		this.weight = weight;
		this.adopted = adopted;
		this.titleImg = titleImg;
	}

	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public int getAnimalNo() {
		return animalNo;
	}

	public void setAnimalNo(int animalNo) {
		this.animalNo = animalNo;
	}

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getAnimalName() {
		return animalName;
	}

	public void setAnimalName(String animalName) {
		this.animalName = animalName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNeutralization() {
		return neutralization;
	}

	public void setNeutralization(String neutralization) {
		this.neutralization = neutralization;
	}

	public int getAnimalAge() {
		return animalAge;
	}

	public void setAnimalAge(int animalAge) {
		this.animalAge = animalAge;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public int getFriendly() {
		return friendly;
	}

	public void setFriendly(int friendly) {
		this.friendly = friendly;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getAdopted() {
		return adopted;
	}

	public void setAdopted(String adopted) {
		this.adopted = adopted;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	

	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	@Override
	public String toString() {
		return "Animal [animalNo=" + animalNo + ", categoryNo=" + categoryNo + ", animalName=" + animalName
				+ ", gender=" + gender + ", neutralization=" + neutralization + ", animalAge=" + animalAge + ", weight="
				+ weight + ", friendly=" + friendly + ", active=" + active + ", adopted=" + adopted + ", description="
				+ description + "]";
	}
	
	
	
	
}
