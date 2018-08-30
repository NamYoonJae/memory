package icia.mvc.habbynew;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Member;
import icia.mvc.service.MySpaceMM;
import icia.mvc.service.NoteMM;

@Controller
public class MySpaceController {
private ModelAndView mav;
	
	@Autowired
	private NoteMM nt;
	@Autowired
	private MySpaceMM ms;
	
	
	@Autowired
	private HttpSession session;
	
	HttpServletRequest request;
	
	@RequestMapping(value = "/mySpace", method = RequestMethod.GET)
	   public ModelAndView mySpace() {
			mav = new ModelAndView();
		
			
			mav.setViewName("myspace/mySpace"); 
			return mav;
	   }
	
	@RequestMapping(value = "/mySpaceList", method = RequestMethod.GET)
	   public ModelAndView myClassList(int sort) {
			mav = new ModelAndView();
			System.out.println(sort);
			
			Member mb = (Member) session.getAttribute("mb");
			String id = mb.getM_id();
			System.out.println("id ="+id);
			
			
			switch(sort){
			case 1:
				mav = ms.MyClassList(mb); // 즐겨찾기한 클레스
				break;
			case 2:
				mav = ms.MyWriteList(1,mb); // 즐겨찾기한 글

				break;
			case 3:    // 내가 쓴 글
				if(mb.getM_sort()==1){   // 일반회원일 경우
				mav = ms.MyWriteList(2, mb);
				}else if(mb.getM_sort()==3){  // 취미아티스트일 경우
				mav = ms.MyWriteClassList(mb);	
				} else{
				mav = ms.MyWriteList(2, mb); // 점오일경우
				}
				break;
			case 4:
				mav = ms.MyWriteClassList(mb); // 내가 쓴 클래스 판매자,점오 전용
				
				break;
			}

			return mav;
	   }
	
	@RequestMapping(value = "/myBookDel", method = RequestMethod.GET)
	   public ModelAndView myBookDel(int index) {
		
			System.out.println("index " + index);
			mav = new ModelAndView();
			
			
			ms.myBookDel(index);
			//mav.addObject("sort",2);
			mav.setViewName("redirect:/mySpaceList?sort=2");
			return mav;
	   }
	
	@RequestMapping(value = "/myBookDel_f", method = RequestMethod.GET)
	   public ModelAndView myBookDel_f(int index) {
		
			System.out.println("index " + index);
			mav = new ModelAndView();
			
			
			ms.myBookDel(index);
			//mav.addObject("sort",2);
			mav.setViewName("redirect:/freeDetail?cb_index="+index);
			return mav;
	   }
	
	//즐겨찾기 후 내 공간 이동 하시겠습니까 ? Yes
	@RequestMapping(value = "/myBookIn_f", method = RequestMethod.GET)
	   public ModelAndView myBookIn_f(int index) {
		
			System.out.println("index " + index);
			mav = new ModelAndView();
			
			System.out.println("myBookIn_f");
			ms.myBookIn(index);
			mav.setViewName("redirect:/mySpaceList?sort=2");
			
			return mav;
	   }
	
	//즐겨찾기 후 내 공간 이동 하시겠습니까 ? No
	/*@RequestMapping(value = "/myBookIn_n", method = RequestMethod.GET)
	   public ModelAndView myBookIn_n(int index) {
		
			System.out.println("index " + index);
			mav = new ModelAndView();
			
			System.out.println("myBookIn_n");
			ms.myBookIn(index);
			mav.setViewName("redirect:/freeDetail?sort=2");
			
			return mav;
	   }*/
	
	//redirect:/freeDetail?sort=2
	
	
	
	
	
	
	@RequestMapping(value = "/myClassDel", method = RequestMethod.GET)
	   public ModelAndView myClassDel(int index) {
		
			System.out.println("index " + index);
			mav = new ModelAndView();
			
			
			ms.myClassDel(index);
			//mav.addObject("sort",2);
			mav.setViewName("redirect:/mySpaceList?sort=1");
			return mav;
	   }
	
	
	
}
