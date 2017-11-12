package bookstore;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class XiangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public XiangServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		HttpSession s1=request.getSession();
		String bname =s1.getAttribute("keywords88").toString().trim();
		ConnDB conn=new ConnDB();	//创建数据库连接对象
		String sql=null;
		
		if (bname==null || bname.isEmpty()) {	
			sql="select * from 图书数据表 ";
		}
		else{
		
			sql="select * from 图书数据表 where 书名 like '%" + bname + "%'";
	
		   
		}
		System.out.print(sql);
		
		ResultSet rs=conn.executeQuery(sql);	//查询全部商品信息
	
		List list=new ArrayList();
		try {
			while(rs.next()){ 
				BooksInfo goods=new BooksInfo();		
				goods.setBooksCode(rs.getString("图书编号"));
				goods.setBooksName(rs.getString("书名"));
				goods.setBooksAuthor(rs.getString("作者"));
				goods.setBooksPrice(rs.getDouble("价格"));
			    goods.setBooksImageAddress(rs.getString("图片地址"));
			    goods.setBooksdaImageAddress(rs.getString("大图片地址"));
			    goods.setBooksType(rs.getString("图书类型"));
			    goods.setBooksXiang(rs.getString("图书详情"));
				list.add(goods);		//将商品信息保存到List集合中
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (bname==null || bname.isEmpty()) {	
		   sql="select count(*) from 图书数据表  ";
		   request.setAttribute("searchName", "全部图书");
		}
		else{
		   //sql="select count(*) from 图书数据表  where 图书名称  like '%" + name + "%' or 图书作者 like '%" + name + "%'";
			sql="select count(*) from 图书数据表  where 书名  like '%" + bname + "%'";
		   request.setAttribute("searchName", bname);
		}
		rs=conn.executeQuery(sql);	//查询全部商品信息
		try {
			if(rs.next()){
				request.setAttribute("goodsCount", rs.getInt(1));
			}
			else{
				request.setAttribute("goodsCount",0);
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		//HttpSession session=request.getSession();
		request.setAttribute("goodsList", list);		//将商品信息保存到HttpServletRequest中
		request.getRequestDispatcher("xiangqing2.jsp").forward(request, response);		//重定向页面
	}

}

