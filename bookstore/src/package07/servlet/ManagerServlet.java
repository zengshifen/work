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
 * ϵͳ�����Servlet��,
 * ֻ�й���ԱȨ�޿��Բ���
 */
public class ManagerServlet extends HttpServlet {

	private static final long serialVersionUID = 47334074575945894L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.isManager(request, response);		//�жϹ���Ա�Ƿ���й���ԱȨ��
		String method = request.getParameter("method");		//��ȡ��������
		//ɾ��������Ϣ
		if("delete".equalsIgnoreCase(method)){	
			String id = request.getParameter("id");
			if(id != null){
				MessageDao dao = new MessageDao();		//ʵ����MessageDao
				dao.deleteMessage(Integer.valueOf(id));	//ɾ��������Ϣ
			}
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		//�ظ�����
		else if("revert".equalsIgnoreCase(method)){
			String msgId = request.getParameter("id");	//��ȡ���Ե�ID��
			MessageDao dao = new MessageDao();			//ʵ����MessageDao
			Message message = dao.getMessage(Integer.valueOf(msgId));	//��������
			request.setAttribute("message", message);
			request.getRequestDispatcher("managerRevert07.jsp").forward(request, response);
		}
		//����ظ���Ϣ
		else if("saveOrUpdateRevert".equalsIgnoreCase(method)){
			String msgId = request.getParameter("id");			//��ȡ���Ե�ID��
			String content = request.getParameter("content");	//��ȡ�ظ�������
			//����ظ������ݺ��л��з������滻Ϊ<br />
			if(content.indexOf("\n") != -1){
				content = content.replaceAll("\n", "<br />");
			}
			MessageDao dao = new MessageDao();			//����MessageDao
			Message message = dao.getMessage(Integer.valueOf(msgId));	//��������
			if(message != null){
				Revert revert = message.getRevert();	//�������м��ػظ���Ϣ
				if(revert == null){
					revert = new Revert();	//�����ظ�
				}
				revert.setContent(content);
				revert.setRevertTime(new Date());
				message.setRevert(revert);	//����������ӻظ�
				dao.saveMessage(message);	//��������
			}
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		//û�д��ݲ���ֵmethod
		else{
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
	/**
	 * �жϵ�¼�û��Ƿ���й���ԱȨ��
	 */
	public void isManager(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//�ж��Ƿ��ǹ���Ա���
		if (request.getSession().getAttribute("manager") == null) {
			request.setAttribute("error", "�Բ�����û��Ȩ�޽��в�����");
			request.getRequestDispatcher("error07.jsp")
					.forward(request, response);
		}
	}
}
