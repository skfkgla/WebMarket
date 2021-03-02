package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	public Product getProductById(String productId) { //productId란 매개변수를 갖는 getProductById메소드
		Product productById = null;		//productById변수를 선언
		
		for(int i =0; i<listOfProducts.size(); i++) {	//Products의 크기만큼 반복하는 for문
			Product product = listOfProducts.get(i);	//Products를 product변수에 저장
			if(product != null && product.getProductId()
					!= null && product.getProductId().equals(productId))	//product의 값이 있거나,productId값이 매개변수와 같으면
			{
				productById = product;										//product값이 productById에 저장하고 반환
				break;
			}
		}
		return productById;
	}
	
	public ProductRepository() {
		Product phone = new Product("P1234","iPhone 6s", 800000);
		phone.setFilename("P1234.png");
		phone.setDescription("4.7-inch, 1334X750 Renina HD display, 8-megapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		
		Product notebook = new Product("P1235", "LG PC 그램", 1500000);
		notebook.setFilename("P1235.png");
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		
		Product tablet = new Product("P1236", "Galaxy Tap S", 900000);
		tablet.setFilename("P1236.png");
		tablet.setDescription("212.8*125.6*6.6mm, Super AMOLED display, Octa-Core processor");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsumg");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
		
}
