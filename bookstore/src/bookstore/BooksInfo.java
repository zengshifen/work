package bookstore;

public class BooksInfo {
	
	  private String booksCode="";
	  
	 
	  private String booksName="";
	 
	 
	  private String booksAuthor="";
	  
	  private String booksImageAddress;
	 
	  private String booksXiang="";
	  
	  public String getBooksXiang() {
		return booksXiang;
	}
	public void setBooksXiang(String booksXiang) {
		this.booksXiang = booksXiang;
	}

	private double booksPrice=0.0;
	  
	  // ͼƬ��ַ
	  private String booksdaImageAddress;
	  
	 
	  public String getBooksdaImageAddress() {
		return booksdaImageAddress;
	}
	public void setBooksdaImageAddress(String booksdaImageAddress) {
		this.booksdaImageAddress = booksdaImageAddress;
	}

	private String booksType="";

	  
	  private String leixing;
		public String getLeixing() {
			return leixing;
		}
		public void setLeixing(String leixing) {
			this.leixing = leixing;
		}
	  
	  
	public String getBooksCode() {
		return booksCode;
	}

	public void setBooksCode(String booksCode) {
		this.booksCode = booksCode;
	}

	public String getBooksName() {
		return booksName;
	}

	public void setBooksName(String booksName) {
		this.booksName = booksName;
	}

	public String getBooksAuthor() {
		return booksAuthor;
	}

	public void setBooksAuthor(String booksAuthor) {
		this.booksAuthor = booksAuthor;
	}

	public double getBooksPrice() {
		return booksPrice;
	}

	public void setBooksPrice(double booksPrice) {
		this.booksPrice = booksPrice;
	}

	public String getBooksImageAddress() {
		return booksImageAddress;
	}

	public void setBooksImageAddress(String booksImageAddress) {
		this.booksImageAddress = booksImageAddress;
	}

	public String getBooksType() {
		return booksType;
	}

	public void setBooksType(String booksType) {
		this.booksType = booksType;
	}
	  
}
