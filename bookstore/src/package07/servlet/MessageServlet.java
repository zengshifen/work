package package07.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import package07.dao.MessageDao;
import package07.model.Message;
import package07.model.User;
import package07.util.PageModel;

/**
 * ����Servlet�࣬ͨ��doPost()��������������
 */
public class MessageServlet extends HttpServlet {

	private static final long serialVersionUID = 6018004479179335118L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ��ȡ��������
		String method = request.getParameter("method");
		if (method != null) {
			// ����
			if ("save".equalsIgnoreCase(method)) {
				// �ж��û��Ƿ��¼
				this.isLogin(request, response);
				// ���Ա���
				String title = request.getParameter("title");
				// ��������
				String content = request.getParameter("content");
				// ����������ݺ��л��з������滻Ϊ<br>
				if (content.indexOf("\n") != -1) {
					content = content.replaceAll("\n", "<br />");
				}
				// ��ȡ��¼�û���Ϣ
				User user = (User) request.getSession().getAttribute("user");
				// ����Message���󲢶�����и�ֵ
				Message message = new Message();
				message.setTitle(title);
				message.setContent(content);
				message.setCreateTime(new Date());
				message.setUser(user);
				// ʵ����MessageDao
				MessageDao dao = new MessageDao();
				dao.saveMessage(message); // ��������
				request.getRequestDispatcher("messageServlet?method=view")
						.forward(request, response);
			}
			// �鿴����
			else if ("view".equalsIgnoreCase(method)) {
				// ��ȡҳ��
				String page = request.getParameter("currPage");
				int currPage = 1; // ��ǰҳ
				int pageSize = 5; // ÿҳ��ʾ5����¼
				// ���page������Ϊ�����currPage��ֵ
				if (page != null) {
					currPage = Integer.parseInt(page);
				}
				MessageDao dao = new MessageDao(); // ʵ����MessageDao
				// ��ȡ��ҳ���
				PageModel pageModel = dao.getPaging(currPage, pageSize);
				request.setAttribute("pageModel", pageModel);
				request.getRequestDispatcher("messageList07.jsp").forward(
						request, response);
			}
		} else {
			request.getRequestDispatcher("index.jsp")
					.forward(request, response);
		}
	}

	/**
	 * �ж��û��Ƿ��¼
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void isLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// �ж�session�е�userֵ�Ƿ�Ϊnull
		if (request.getSession().getAttribute("user") == null) {
			// �û�û�е�¼���д�����
			request.setAttribute("error", "�Բ�������û�е�¼��");
			request.getRequestDispatcher("error07.jsp")
					.forward(request, response);
		}
	}
}
