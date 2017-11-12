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
 * �û�����Servlet��
 * ͨ��doPost()�������д���
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
		//�������
		String method = request.getParameter("method");
		if(method != null){
			//�û�ע��
			if("guestRegister".equalsIgnoreCase(method)){
				//�û���
				String username = request.getParameter("username");
				//����
				String password = request.getParameter("password");
				//��������
				String email = request.getParameter("email");
				//ͷ���ַ
				String face = request.getParameter("face");
				//����UserDao
				UserDao dao = new UserDao();
				//�ж��û����Ƿ�Ϊnull��յ��ַ���
				if(username != null && !username.isEmpty()){
					//�ж��û����Ƿ����
					if(dao.findUserByName(username)){
						//����û����Ѵ��ڣ����д�����
						request.setAttribute("error", "��ע����û����Ѵ��ڣ�");
						request.getRequestDispatcher("error07.jsp").forward(request, response);
					}else{
						//ʵ����һ��User����
						User user = new Guest();
						//��user�е����Ը�ֵ
						user.setUsername(username);
						user.setPassword(password);
						user.setEmail(email);
						user.setFace(face);
						//����user
						dao.saveUser(user);
						request.getRequestDispatcher("index.jsp").forward(request, response);
					
					}
				}
			}
			//�û���¼
			else if("userLogin".equalsIgnoreCase(method)){
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				//ʵ����UserDao
				UserDao dao = new UserDao();
				//�����û����������ѯUser
				User user = dao.findUser(username, password);
				//�ж��û��Ƿ��¼�ɹ�
				if(user != null){
					//�ж�user�Ƿ��ǹ���Ա����
					if(user instanceof Administrator){
						//������Ա������뵽session��
						request.getSession().setAttribute("manager", user);
					}
					//���û�������뵽session��
					request.getSession().setAttribute("user", user);
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}else{
					//��¼ʧ��
					request.setAttribute("error", "�û������������ ��");
					request.getRequestDispatcher("error07.jsp").forward(request, response);
				}
			}
			//�˳���¼
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
