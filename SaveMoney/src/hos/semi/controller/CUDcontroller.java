package hos.semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hos.semi.service.CalService;
import hos.semi.service.LongService;
import hos.semi.service.MemberService;


@WebServlet({ "/", "/join", "/memDel", "/memUpdate","/adminDel", 
		"/ca_update", "/ca_delete", "/ca_addCa", "/ca_upCompl", "/ca_upDB",
		"/lp_add","/updateForm","/update","/del"})
public class CUDcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		multi(request,response);
	}


	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
					throws ServletException, IOException {
		multi(request,response);
	}


	private void multi(HttpServletRequest request, 
			HttpServletResponse response)
					throws ServletException, IOException{
		
		//서비스에게 request, response를 넘겨준다 (생성자)
		MemberService memservice = new MemberService(request,response);
		CalService calService = new CalService(request, response);	
		LongService service = new LongService(request,response);
		
		//URL 분기
		String uri = request.getRequestURI(); 
		String ctx = request.getContextPath();	
		String subAddr =uri.substring(ctx.length());
		
		switch(subAddr) {
		
		case "/join":
			System.out.println("회원가입 요청 시작");
			memservice.join();
			break;
		
		case "/memDel":
			System.out.println("회원탈퇴 요청 시작");
			memservice.memDel();
			break;
			
		case "/memUpdate":
			System.out.println("회원정보업데이트 시작");
			memservice.memUpdate();
			break;

		case "/adminDel":
			System.out.println("회원정보업데이트 시작");
			memservice.adminDel();
			break;
			
		case "/ca_update":
			System.out.println("컨트롤러 - 데이터 수정 요청 시작");
			calService.update();
			break;
		
		case "/ca_delete":
			System.out.println("컨트롤러 - 데이터 삭제 요청 시작");
			calService.delete();
			break;	
					
		case "/ca_addCa" :
			System.out.println("수입/지출/저축 입력시 카테고리 선택요청");
			calService.ca_addCa();
			break;
				 			
		case "/ca_upCompl" :
			System.out.println("ios데이터 DB 입력요청");
			calService.ca_upCompl();
			break;
			
		case "/ca_upDB" :
			System.out.println("수정사항 DB 저장요청");
			calService.ca_upDB();
			break;	
			
		case "/lp_add":
            System.out.println("장기계획 입력 요청");
             service.lp_add();
        break;
        
        case "/updateForm":
            System.out.println("수정 페이지 이동 요청");
             service.updateForm();
        break;
        
        case "/update":
            System.out.println("수정 요청");
             service.update();
        break; 
        
        case "/del":
            System.out.println("삭제 요청");
             service.del();
        break; 
		
		default:
				response.sendRedirect("/"); 		// 인덱스로 보내준다.
		
		}
		
	}

}
