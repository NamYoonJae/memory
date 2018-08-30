package icia.mvc.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Board;
import icia.mvc.bean.ClassBean;
import icia.mvc.bean.Member;
import icia.mvc.bean.Recommand;
import icia.mvc.bean.Report;
import icia.mvc.dao.IMySpaceDAO;
import icia.mvc.dao.ImemberDao;

		

		@Service
		public class MySpaceMM {
		
			@Autowired
			private HttpSession session;
			@Autowired
			private ImemberDao mDao;
			@Autowired
			private IMySpaceDAO msDao;
			@Autowired
			private HttpServletRequest request;
			private ModelAndView mav;
			
	
			public ModelAndView MyClassList(Member mb) {  // btn = 1
				System.out.println("MyClassList");
				mav= new ModelAndView();
				ArrayList<Integer> EnrolledCnt = new ArrayList<Integer>();
				List<ClassBean> mcImg = new ArrayList<ClassBean>();
				String id = mb.getM_id();
				
				List<ClassBean> mcList = msDao.MyClassList(id);
				System.out.println("size "+mcList.size());
				
				try {
					for(int i=0;i<mcList.size();i++){
						System.out.println(mcList.get(i).getC_index());
						mcImg = msDao.MyClassImg(mcList.get(i).getC_index());
						System.out.println(mcImg);
						mcList.get(i).setC_mainImg(mcImg.get(0).getC_mainImg());
						System.out.println(mcImg.get(0).getC_mainImg());
						mcList.get(i).setC_count(mcImg.get(0).getC_count());
						System.out.println(mcImg.get(0).getC_count());
					}
					System.out.println("확인");
					System.out.println(mcList.get(0).getC_mainImg());
					System.out.println(mcList.get(0).getC_address());
					System.out.println(mcList.get(0).getC_index());
					System.out.println(mcList.get(0).getC_content());
					
					for(int i = 0 ; i<mcList.size(); i++){
					 System.out.println(mcList.size());
					 int index = mcList.get(i).getC_index();
					 int cnt = msDao.MyClassEnrolled(index);
					 
					 System.out.println(cnt);
					 EnrolledCnt.add(cnt);
					}
				} catch (Exception e) {
					
				}
				
				
				System.out.println("size : " + mcList.size() +"  "+ EnrolledCnt.size());
				
				String mwText = MyClassListText(mcList, EnrolledCnt);
				
				mav.addObject("classList",mcList);
			
				String path = "/HNresources/uploadFolder/resources/hobbyClass/";
				mav.addObject("path", path); 
				mav.addObject("mwText" , mwText);
				mav.setViewName("myspace/mySpace");
				//mav.setViewName("myspace/myClassList");
				return mav;
				
			}
			
			

			public ModelAndView MyWriteList(int s , Member mb) {  // btn  = 2 , 3
				System.out.println("MyWriteList");
				mav= new ModelAndView();
				String id = mb.getM_id();
				System.out.println("서비스에서 id ="+id);				
				String mwText = null;
				if(s==1){
					System.out.println(1);
					List<Board> mwList = msDao.MyBookList(id);	
					mwText = MyBookListText(mwList);
					
				}else if(s==2){
					System.out.println(2);
					List<Board> mwList = msDao.MyWriteList(id);	
					mwText = MyWriteListText(mwList);
					String selected = MyWriteClassSelectText(3,mb);
					mav.addObject("selected" , selected);
				}
			
				
				//mav.addObject("mwList" , mwList);
				
				mav.addObject("mwText" , mwText);
				mav.setViewName("myspace/mySpace");
				
				return mav;
			}
			
			// 취미아티스트 클래스 쓴 목록
			public ModelAndView MyWriteClassList(Member mb) { // btn 4
				
				List<ClassBean> msWclass = null;
				String msText = null;
				String id = mb.getM_id();
				
				try {
					msWclass = msDao.MyWriteClassList(id);
					System.out.println(msWclass);
					msText = MyWriteClassText(msWclass);
					
				} catch (NullPointerException e) {
					msText = null;
					System.out.println("실패");
				}
				String selected = MyWriteClassSelectText(4,mb); // 셀렉트 박스 출력
				// 셀렉트 박스
				mav.addObject("selected" , selected);
				// 테이블 출력
				mav.addObject("mwText" , msText);
				mav.setViewName("myspace/mySpace");
				return mav;
	
			}
			
			public void myBookDel(int index) {
				Map<String,String> rc =  new HashMap<String, String>();
				Member mb = (Member) session.getAttribute("mb");
				String id = mb.getM_id();
				System.out.println("id ="+id);
				
				int suc = 0;
				
				rc.put("index", String.valueOf(index)); // map으로 만들어서 마이바티스로 보내는거
				rc.put("id", id); 
	
				System.out.println(rc.values());
				
				msDao.myBookDel(rc);
				System.out.println("suc" + suc);
			}
		
			public void myClassDel(int index) {
				Map<String,String> rc =  new HashMap<String, String>();
				Member mb = (Member) session.getAttribute("mb");
				String id = mb.getM_id();
				System.out.println("id ="+id);
				
				int suc = 0;
				
				rc.put("index", String.valueOf(index));
				rc.put("id", id);
	
				System.out.println(rc.values());
				
				msDao.myClassDel(rc);
				System.out.println("suc" + suc);
					
			}
			
			public String MyClassListText(List<ClassBean> mcList, ArrayList<Integer> cnt){
				StringBuilder tag = new StringBuilder();
				String status = "[기타]";
		
		
				
				if(mcList.size()==0){
					tag.append("<div id = 'alert-box'>즐겨찾기한 클래스가 없습니다.</div>\n");
				}
/*
				tag.append("<div class='classes'>\n");
				tag.append("<c:forEach items='${ClassNameList}' var='cnList'>\n");
				tag.append("	<input type='button' value='${cnList.cn_name}' onclick='typeList(this, '${cnList.cn_index}')'/>\n");
				tag.append("	<c:set var='i' value='${i+1}'/>\n");
				tag.append("	<c:if test='${i%4 ==0}'><br/></c:if>\n");
				tag.append("	</c:forEach>\n");
				tag.append("</div>\n");
				
				tag.append("<div class='searches'>\n");
				tag.append("	<select name='searchProcess' onchange='statusSearch()' style='width:120px;margin:5px 0px 0px 0px'>\n");
				tag.append("		<option value='0'>전체</option>\n");
				tag.append("<option value='1'>준비중</option>\n");
				tag.append("<option value='2'>모집중</option>\n");
				tag.append("	<option value='3'>모집 마감</option>\n");
				tag.append("	<option value='4'>완료</option>\n");
				tag.append("</select>\n");
				tag.append("<br/>\n");
				tag.append("</div>\n");
				tag.append("<div id='introContent' style='text-align: center;' align='center'>\n");
				tag.append("	<c:if test='${classList != '[]'}'>\n");
				tag.append("<c:forEach items='#{classList}' var='cList'>\n");
				tag.append("<c:if test='${cList.c_status != 0}'>\n");
				tag.append("<div id='position'>\n");
				tag.append("<div id='classToggle'>\n");
				tag.append("<img id='heart' class='noheart'='resources/sj/heart_toggle(white).png' onclick='myClass(this,'${cList.c_index}')'/>\n");
				tag.append("		<input type='hidden' class='c_index' value='${cList.c_index}'>\n");
				tag.append("	</div>\n");
				tag.append("			<div class='mainImg_div' onclick='classDetail('${cList.c_index}')'>\n");
				tag.append("						<img class='mainImg' src='${path}${cList.c_mainImg}'\n");
				tag.append("</div>\n");
				tag.append("<div class='classList middle' onmouseover='mouseIn(this)' onmouseout='mouseOut(this)' onclick='classDetail('${cList.c_index}')'>\n");
				tag.append("				<div class='classList_sub'>\n");
				tag.append("<h4>진행상황</h4>\n");
				tag.append("						<c:if test='${cList.c_count != null}'>\n");
				tag.append("								${cList.c_count} / ${cList.c_maxPerson}\n");
				tag.append("						</c:if>");
				tag.append("					<c:if test='${cList.c_count == null}'>\n");
				tag.append("					0 / ${cList.c_maxPerson}\n");
				tag.append("						</c:if>\n");
				tag.append("							</div>\n");
				tag.append("						</div>\n");
				tag.append("						<div class='mainText_div' onclick='classDetail('${cList.c_index}')'>\n");
				tag.append("							제목 : ${cList.c_subject}<br/>작성자 : ${cList.m_id }<br/>\n");
				tag.append("							[ ${cList.c_simpleContent} ]\n");
				tag.append("						</div>\n");
				tag.append("	</div>\n");
				tag.append("</c:if>\n");
				tag.append("		</c:forEach>\n");
				tag.append("	</c:if>\n");
				tag.append("	</div>\n");
*/
				
			for(int i = 0 ; i<mcList.size(); i++){
				switch(mcList.get(i).getC_status())
			{
				case "0":
					status = "심사중";
					break;
				case "1":
					status = "준비중";
					break;
				case "2":
					status = "모집중";
					break;
				case "3":
					status = "모집완료";
					break;
				case "4":
					status = "완료";
					break;
			
			}		
			
				tag.append("<div id='introContent' style='text-align: center;' align='center'>\n");
				tag.append("		<div id='position'>\n");
				tag.append("		<div id='classToggleHeart' onclick='myClassDel(this,"+mcList.get(i).getC_index()+")'>\n" );
				tag.append("		<img id='heart' class='noheart' src='resources/sj/heart_toggle(red).png'/>\n");
				tag.append("	</div>\n");
				tag.append("<div class='mainImg_div' onclick='mySpaceDetail("+mcList.get(i).getC_index()+")'>\n");
				tag.append("<img class='mainImg' src='/HNresources/uploadFolder/resources/hobbyClass/"+mcList.get(i).getC_mainImg()+"'/>\n");
				tag.append("</div>\n");   
				tag.append("	<div class='classList middle' onmouseover='mouseIn(this)' onmouseout='mouseOut(this)' onclick='mySpaceDetail("+mcList.get(i).getC_index()+")'>\n");
				tag.append("		<div class='classList_sub'>\n");
				tag.append("		<h4>"+ status +"</h4>");
				tag.append("		("+cnt.get(i)+"/10)");
				tag.append("		</div>\n");
				tag.append("	</div>\n");
				tag.append("</div>	\n");	
				tag.append("	</div>\n");
			
			}
			return tag.toString();
			}

			public ModelAndView MyBookList() {
				System.out.println("MyBookList");
				mav= new ModelAndView();
				return mav;
			}

			
			

			public String MyBookListText(List<Board> mwList){
				StringBuilder tag = new StringBuilder();
				//tag.append("<div id='eb_blank'></div>\n");
				tag.append("<table>\n");
				tag.append("<tr>\n");
				tag.append("<th>  </th><th>대분류</th><th>제목</th><th>내용</th><th>작성자</th><th>작성일</th>\n");
				tag.append("</tr>\n");
				
				String sort = "기타";
				for(int i = 0 ; i<mwList.size(); i++){
					switch(mwList.get(i).getCb_sort())
					{
					case 1:
						sort = "[자유게시판]";
						break;
					case 2:
						sort = "[투표게시판]";
						break;
					case 3:
						sort = "[포토갤러리]";
						break;
				}
				tag.append("<tr>\n");
				tag.append("<td>\n");
				tag.append("<div id = 'classToggle'>\n");
				tag.append("<img id = 'star"+i+"' class = 'nostar' onclick = 'starDel(this,"+mwList.get(i).getCb_index()+")' src='resources/sj/star_toggle(yellow).png'/>\n");
				tag.append("</div>\n");
				tag.append("</td>");
				
				int len = mwList.get(i).getCb_content().length();
			
				
				tag.append("<td>"+sort+"</td>\n");
				tag.append("<td>"+mwList.get(i).getCb_subject()+"</td>\n");
				if(len >= 20) {
					tag.append("<td><a href='#' onclick='myBookDetail("+mwList.get(i).getCb_index()+")'>"+mwList.get(i).getCb_content().substring(0, 20)+"...</a></td>\n");
				}else {
					tag.append("<td><a href='#' onclick='myBookDetail("+mwList.get(i).getCb_index()+")'>"+mwList.get(i).getCb_content()+"</a></td>\n");
				}tag.append("<td>"+mwList.get(i).getM_id()+"</td>\n");
				tag.append("<td>"+mwList.get(i).getCb_date().substring(0, 11) +"</td>\n");
				tag.append("</tr>\n");
				}
			
				tag.append("</table>");
				
				
				return tag.toString();
			}
			

			public String MyWriteListText(List<Board> mwList){
				StringBuilder tag = new StringBuilder();

				tag.append("<table>\n");
				tag.append("<tr>\n");
				tag.append("<th>대분류</th><th>제목</th><th>내용</th><th>작성일</th>\n");
				tag.append("</tr>\n");
				String sort = "기타";
					for(int i = 0 ; i<mwList.size(); i++){
						switch(mwList.get(i).getCb_sort())
						{
						case 1:
							sort = "[자유게시판]";
							break;
						case 2:
							sort = "[투표게시판]";
							break;
						case 3:
							sort = "[포토갤러리]";
							break;
					}

				tag.append("<tr>\n");
			
				
				tag.append("<td>"+sort+"</td>\n");
				tag.append("<td>"+mwList.get(i).getCb_subject()+"</td>\n");
				int len = mwList.get(i).getCb_content().length();
				if(len >= 20) {
					tag.append("<td>"+mwList.get(i).getCb_content().substring(0, 20)+"...</a></td>\n");
				}else {
					tag.append("<td>"+mwList.get(i).getCb_content()+"</a></td>\n");
				}
				tag.append("<td>"+mwList.get(i).getCb_date().substring(0, 11)+"</td>\n");

				tag.append("</tr>\n");
				}
				tag.append("</table>");
				return tag.toString();
			}
			
		
			// 셀렉트 박스
			public String MyWriteClassSelectText(int select, Member mb){
				System.out.println(select);
				StringBuilder tag = new StringBuilder();
				String n1 = null , n2 = null;
				
				if(mb.getM_sort()==2){
					if(select==3){
						n1 = "selected='selected'";
					}else if(select==4){
						n2 = "selected='selected'";
					}
					tag.append("<select name='searchProcess' onchange='selectSel(this.form)' style='width:120px;margin:5px 0px 0px 0px'>\n");
					tag.append("<option value='1' "+n1+">내가 쓴 글</option>\n");
					tag.append("<option value='2' "+n2+">내 클래스</option>\n");
					tag.append("</select>\n");
				}
				return tag.toString();
			}
	
			public String MyWriteClassText(List<ClassBean> msWclass){
				StringBuilder tag = new StringBuilder();

				tag.append("<table>\n");
				tag.append("<tr>\n");
				tag.append("<th>분류</th><th>제목</th><th>진행 상황</th><th>작성일</th>\n");
				tag.append("</tr>\n");
				String sort = "기타";
					for(int i = 0 ; i<msWclass.size(); i++){
						switch(msWclass.get(i).getCn_index())
						{
						case 0:
							sort = "[도서]";
							break;
						case 1:
							sort = "[영화]";
							break;
						case 2:
							sort = "[음악]";
							break;
						case 3:
							sort = "[공예]";
							break;
						case 4:
							sort = "[사진]";
							break;
						case 5:
							sort = "[운동]";
							break;
					
					}
				tag.append("<tr>\n");

				tag.append("<td>"+sort+"</td>\n");	
				tag.append("<td>"+msWclass.get(i).getC_subject()+"</td>");
				
				String status = "기타";
				switch(msWclass.get(i).getC_status())
				{
				case "0":
					status = "[심사중]";
					break;
				case "1":
					status = "[준비중]";
					break;
				case "2":
					status = "[모집중]";
					break;
				case "3":
					status = "[모집완료]";
					break;
				case "4":
					status = "[완료]";
					break;
			}
				tag.append("<td><a href='#' onclick='mySpaceDetail("+msWclass.get(i).getC_index()+")'>"+status+"</td>");
				tag.append("<td>"+msWclass.get(i).getC_date()+"</td>\n");
				tag.append("</tr>\n");
					}
				tag.append("</table>");
				return tag.toString();
			
			}



			//즐겨찾기
			public void myBookIn(int index) {
				System.out.println("myBookIn Call");
				Map<String,String> rc =  new HashMap<String, String>();
				Member mb = (Member) session.getAttribute("mb");
				String id = mb.getM_id();
				System.out.println("id ="+id);
				
				int suc = 0;
				
				rc.put("index", String.valueOf(index)); // map으로 만들어서 마이바티스로 보내는거
				rc.put("id", id); 
	
				
				System.out.println(id+index);
		
				msDao.myBookIn(rc);
				//System.out.println("suc" + suc);
					
			}


}
