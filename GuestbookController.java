package ch10;

import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(urlPatterns = "/guestbook.nhn")
public class GuestbookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private GuestbookDAO dao;
	private ServletContext ctx;
	
	
	private final String START_PAGE = "ch10/guestbookList.jsp";
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new GuestbookDAO();
		ctx = getServletContext();
	}
	
    
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		
		dao = new GuestbookDAO();
		
		
		Method m;
		String view = null;
		
		
		if (action == null) {
			action = "listGuestbook";
			
		
		
		}
	}
	public String addGuestbook(HttpServletRequest request) {
	    String author = request.getParameter("authorInput");
	    String email = request.getParameter("emailInput");
	    String title = request.getParameter("titleInput");
	    String password = request.getParameter("passwordInput");
	    String content = request.getParameter("contentInput");

	    if (author != null && !author.isEmpty() &&
	        email != null && !email.isEmpty() &&
	        title != null && !title.isEmpty() &&
	        password != null && !password.isEmpty() &&
	        content != null && !content.isEmpty()) {
	        
	        Guestbook n = new Guestbook();
	        try {
	            n.setPers(author);
	            n.setEmail(email);
	            n.setTitle(title);
	            n.setPassword(password);
	            n.setContent(content);
	            dao.addGuestbook(n);
	        } catch (Exception e) {
	            e.printStackTrace();
	            ctx.log("방명록 추가 과정에서 문제 발생!!");
	            request.setAttribute("error", "방명록이 정상적으로 등록되지 않았습니다!!");
	            return listGuestbook(request);
	        }
	    }
	    return "redirect:/guestbook.nhn?action=listGuestbook";
	}

	
	private String getFilename(Part part) {
		return null;
	}


	public String listGuestbook(HttpServletRequest request) {
		List<Guestbook> list;
		try {
			list = dao.getAll();
			request.setAttribute("guestbooklist", list);
		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("방명록 목록 생성 과정에서 문제 발생!!");
			request.setAttribute("error", "방명록 목록이 정상적으로 처리되지 않았습니다!!");
		}
		return "redirect:/guestbook.nhn?action=listGuestbook";
	}
	
	public String getGuestbook(HttpServletRequest request) {
		int aid = Integer.parseInt(request.getParameter("aid"));
		try {
			Guestbook n = dao.getGuestbook(aid);
			request.setAttribute("guestbook", n);
		} catch (SQLException e) {
			e.printStackTrace();
			ctx.log("뉴스를 가져오는 과정에서 문제 발생!!");
			request.setAttribute("error", "뉴스를 정상적으로 가져오지 못했습니다!!");
		}
		return "ch10/guestbookView.jsp";
	}
	public String deleteGuestbook(HttpServletRequest request) {
		int aid = Integer.parseInt(request.getParameter("aid"));
		try {
			dao.delGuestbook(aid);
		} catch (SQLException e) {
			e.printStackTrace();
			ctx.log("방명록 삭제 과정에서 문제 발생!!");
			request.setAttribute("error", "방명록이 정상적으로 삭제되지 않았습니다!!");
			return listGuestbook(request);
		}
		return "redirect:/guestbook.nhn?action=listGuestbook";
	}
    public GuestbookController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}