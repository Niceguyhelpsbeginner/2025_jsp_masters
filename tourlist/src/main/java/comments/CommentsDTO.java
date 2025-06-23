package comments;

public class CommentsDTO {
    private String commentnum;
    private String commented_post;
    private String commenter;
    private String content;
    private String created_at;
    
    // 기본 생성자
    public CommentsDTO() {
    }
    
    // 모든 필드를 매개변수로 받는 생성자
    public CommentsDTO(String commentnum, String commented_post, String commenter, String content, String created_at) {
        this.commentnum = commentnum;
        this.commented_post = commented_post;
        this.commenter = commenter;
        this.content = content;
        this.created_at = created_at;
    }
    
    public CommentsDTO(String commented_post, String commenter, String content) {
        this.commented_post = commented_post;
        this.commenter = commenter;
        this.content = content;
    }
    
    // Getter와 Setter 메소드들
    public String getCommentnum() {
        return commentnum;
    }
    
    public void setCommentnum(String commentnum) {
        this.commentnum = commentnum;
    }
    
    public String getCommented_post() {
        return commented_post;
    }
    
    public void setCommented_post(String commented_post) {
        this.commented_post = commented_post;
    }
    
    public String getCommenter() {
        return commenter;
    }
    
    public void setCommenter(String commenter) {
        this.commenter = commenter;
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
} 