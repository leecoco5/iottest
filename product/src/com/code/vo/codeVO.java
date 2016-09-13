package com.code.vo;

	public class codeVO {
		private int productnum;
		private String producttype;
		private String productname;
		private int price;
		private String color;
		private String photo;
		private int count;
		private String comments;
		
		public String getComments() {
			return comments == null ? "" : comments.trim();
		}
		public void setComments(String comments) {
			this.comments = comments;
		}
		public String getPhoto() {
			return photo == null ? "" : photo.trim();
		}
		public void setPhoto(String photo) {
			this.photo = photo;
		}
		
		
		public int getCount() {
			return count;
		}
		public void setCount(int count) {
			this.count = count;
		}
		public int getProductnum() {
			
			return productnum;
		}
		public void setProductnum(int productnum) {
			this.productnum = productnum;
		}
		public String getProducttype() {
			return producttype == null ? "" : producttype.trim();
		}
		public void setProducttype(String producttype) {
			this.producttype = producttype;
		}
		public String getProductname() {
			return productname == null ? "" : productname.trim();
		}
		public void setProductname(String productname) {
			this.productname = productname;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public String getColor() {
			return color == null ? "" : color.trim();
		}
		public void setColor(String color) {
			this.color = color;
		}
		
		
	}