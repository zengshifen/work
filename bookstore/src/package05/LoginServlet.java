package package05;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 设置request与response的编码
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//获取表单数据
		String userName=request.getParameter("login_username");
		String userPassword=request.getParameter("login_password");
		UserManage userm=new UserManage();
		UserInfo user=new UserInfo();
		user=userm.userLogin(userName, userPassword);	
		if(user!=null){
			request.getSession().setAttribute("loginUser", user);
			request.setAttribute("info", "登录成功！");
			//out.println("成功登录");
		}
		else{
			request.setAttribute("info2", "登录失败！");
			request.getRequestDispatcher("login_failure.jsp").forward(request,response);
			//out.println("登录失败");
		}
		//转发message.jsp页面
		request.getRequestDispatcher("include.jsp").forward(request,response);
	}

}

