package bean;

public class Products {
	private int id;
	private String name_prod;
	private String img_prod;
	private String cost;
	private String description;
	private String type;
	private String species;
	private String quantity_bought;
	private String quantity_stock;
	public Products(int id, String name, String image, String description, String cost, String type, String species) {
	    // Khởi tạo các thuộc tính của đối tượng Products từ các tham số đầu vào
	    this.id = id;
	    this.name_prod = name;
	    this.img_prod = image;
	    this.description = description;
	    this.cost = cost;
	    this.type = type;
	    this.species = species;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName_prod() {
		return name_prod;
	}
	public void setName_prod(String name_prod) {
		this.name_prod = name_prod;
	}
	public String getImg_prod() {
		return img_prod;
	}
	public void setImg_prod(String img_prod) {
		this.img_prod = img_prod;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSpecies() {
		return species;
	}
	public void setSpecies(String species) {
		this.species = species;
	}
	public String getQuantity_bought() {
		return quantity_bought;
	}
	public void setQuantity_bought(String quantity_bought) {
		this.quantity_bought = quantity_bought;
	}
	public String getQuantity_stock() {
		return quantity_stock;
	}
	public void setQuantity_stock(String quantity_stock) {
		this.quantity_stock = quantity_stock;
	}
}
