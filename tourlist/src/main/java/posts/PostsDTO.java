package posts;

public class PostsDTO {
	private String postnum;
	private String title;
	private String content;
	private String created_at;
	private String views;
	private String like_count;
	private String author_id;
	private String image_path;
	private String country;
	
	public PostsDTO(String postnum, String title, String content, String created_at, String views, String like_count, String author_id,String img_path, String country) {
		this.postnum = postnum;
		this.title = title;
		this.content = content;
		this.created_at = created_at;
		this.views = views;
		this.like_count = like_count;
		this.author_id = author_id;
		this.country = country;
	}
	public PostsDTO(String title, String content, String author_id, String image_path, String country) {
		this.title = title;
		this.content = content;
		this.author_id = author_id;
		this.image_path = image_path;
		this.country = country;
	}
	public String getImage_path() {
		return this.image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public String getPostnum() {
		return postnum;
	}

	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public String getViews() {
		return views;
	}

	public void setViews(String views) {
		this.views = views;
	}

	public String getLike_count() {
		return like_count;
	}

	public void setLike_count(String like_count) {
		this.like_count = like_count;
	}

	public String getAuthor_id() {
		return author_id;
	}

	public void setAuthor_id(String author_id) {
		this.author_id = author_id;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
}
