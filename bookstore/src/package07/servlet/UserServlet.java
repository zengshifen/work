package package07.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import package07.dao.UserDao;
import package07.model.Administrator;
import package07.model.Guest;
import package07.model.User;
/**
 * 用户操作Servlet类
 * 通过doPost()方法进行处理
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1380736560965055473L;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//请求参数
		String method = request.getParameter("method");
		if(method != null){
			//用户注册
			if("guestRegister".equalsIgnoreCase(method)){
				//用户名
				String username = request.getParameter("username");
				//密码
				String password = request.getParameter("password");
				//电子邮箱
				String email = request.getParameter("email");
				//头像地址
				String face = request.getParameter("face");
				//创建UserDao
				UserDao dao = new UserDao();
				//判断用户名是否为null或空的字符串
				if(username != null && !username.isEmpty()){
					//判断用户名是否存在
					if(dao.findUserByName(username)){
						//如果用户名已存在，进行错误处理
						request.setAttribute("error", "您注册的用户名已存在！");
						request.getRequestDispatcher("error07.jsp").forward(request, response);
					}else{
						//实例化一个User对象
						User user = new Guest();
						//对user中的属性赋值
						user.setUsername(username);
						user.setPassword(password);
						user.setEmail(email);
						user.setFace(face);
						//保存user
						dao.saveUser(user);
						request.getRequestDispatcher("index.jsp").forward(request, response);
					
					}
				}
			}
			//用户登录
			else if("userLogin".equalsIgnoreCase(method)){
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				//实例化UserDao
				UserDao dao = new UserDao();
				//根据用户名、密码查询User
				User user = dao.findUser(username, password);
				//判断用户是否登录成功
				if(user != null){
					//判断user是否是管理员对象
					if(user instanceof Administrator){
						//将管理员对象放入到session中
						request.getSession().setAttribute("manager", user);
					}
					//将用户对象放入到session中
					request.getSession().setAttribute("user", user);
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}else{
					//登录失败
					request.setAttribute("error", "用户名或密码错误 ！");
					request.getRequestDispatcher("error07.jsp").forward(request, response);
				}
			}
			//退出登录
			else if("exit".equalsIgnoreCase(method)){
				request.getSession().removeAttribute("user");
				if(request.getSession().getAttribute("manager") != null){
					request.getSession().removeAttribute("manager");
				}
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}else{
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
}
