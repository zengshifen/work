package package07.model;

import java.util.Date;
/**
 * 留言信息持久化类
 */
public class Message {
	private Integer id;		//ID编号
	private String title;	//留言标题
	private String content;	//留言内容
	private Date createTime;//留言时间
	private User user;		//留言用户	
	private Revert revert;	//回复
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Revert getRevert() {
		return revert;
	}
	public void setRevert(Revert revert) {
		this.revert = revert;
	}
}

