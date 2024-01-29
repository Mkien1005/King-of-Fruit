package bean;

public class ProductWithQuantity {
    private Products product;
    private int quantity;

    public ProductWithQuantity(Products product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Products getProduct() {
        return product;
    }

    public void setProduct(Products product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
