package package07.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import package07.dao.MessageDao;
import package07.model.Message;
import package07.model.Revert;

/**
 * 系统管理的Servlet类,
 * 只有管理员权限可以操作
 */
public class ManagerServlet extends HttpServlet {

	private static final long serialVersionUID = 47334074575945894L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.isManager(request, response);		//判断管理员是否具有管理员权限
		String method = request.getParameter("method");		//获取请求类型
		//删除留言信息
		if("delete".equalsIgnoreCase(method)){	
			String id = request.getParameter("id");
			if(id != null){
				MessageDao dao = new MessageDao();		//实例化MessageDao
				dao.deleteMessage(Integer.valueOf(id));	//删除留言信息
			}
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		//回复留言
		else if("revert".equalsIgnoreCase(method)){
			String msgId = request.getParameter("id");	//获取留言的ID号
			MessageDao dao = new MessageDao();			//实例化MessageDao
			Message message = dao.getMessage(Integer.valueOf(msgId));	//加载留言
			request.setAttribute("message", message);
			request.getRequestDispatcher("managerRevert07.jsp").forward(request, response);
		}
		//保存回复信息
		else if("saveOrUpdateRevert".equalsIgnoreCase(method)){
			String msgId = request.getParameter("id");			//获取留言的ID号
			String content = request.getParameter("content");	//获取回复的内容
			//如果回复的内容含有换行符，将替换为<br />
			if(content.indexOf("\n") != -1){
				content = content.replaceAll("\n", "<br />");
			}
			MessageDao dao = new MessageDao();			//创建MessageDao
			Message message = dao.getMessage(Integer.valueOf(msgId));	//加载留言
			if(message != null){
				Revert revert = message.getRevert();	//从留言中加载回复信息
				if(revert == null){
					revert = new Revert();	//创建回复
				}
				revert.setContent(content);
				revert.setRevertTime(new Date());
				message.setRevert(revert);	//向留言中添加回复
				dao.saveMessage(message);	//更新留言
			}
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		//没有传递参数值method
		else{
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
	/**
	 * 判断登录用户是否具有管理员权限
	 */
	public void isManager(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//判断是否是管理员身份
		if (request.getSession().getAttribute("manager") == null) {
			request.setAttribute("error", "对不起，您没有权限进行操作！");
			request.getRequestDispatcher("error07.jsp")
					.forward(request, response);
		}
	}
}
