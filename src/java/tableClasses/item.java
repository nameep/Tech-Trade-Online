/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tableClasses;

/**
 *
 * @author namee
 */
public class item {
    private  String name ;
    private String category;
    private String description;
    private float price;
    private int quantity;
    
    // get and set methods for 'name' 
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    

    // get and set methods for 'category'
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    // get and set methods for 'description'
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    // get and set methods for 'price'
    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
    // get and set methods for 'quantity' >>>> on Cart
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }    
}
