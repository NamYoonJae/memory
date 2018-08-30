package icia.mvc.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import icia.mvc.bean.Notice;

public interface InoticeDAO {
	
	//공지사항 작성 시 게시판 테이블 등록
	int b_NoticeWrite(Notice notice);
	
	//공지사항 작성 시 공지사항 테이블 등록
	int b_Announce(Notice notice);
	
	//공지사항 작성 시 파일 테이블 등록
	int b_AnFileInserte(Map<String, String> fMap);
	
	//공지사항 상세보기
	List<Notice> getboardDetail(int cb_index);
	
	//공지사항 수정 시 파일 제거
	int anFileDel(int cb_index);
	
	//공지사항 수정 시 게시판 테이블 수정
	int b_NoticeChange(Notice notice);
	
	/*//공지사항 수정 시 공지사항 테이블 수정
	int b_AnnounceChange(Notice notice);*/
	
	//공지사항 수정 시 파일 새로 업데이트
	int b_AnFileChange(Map<String, String> fMap);
	
	//공지사항 테이블 삭제
	int announceDel(int cb_index);

	//게시판 테이블 삭제
	int comboardDel(int cb_index);

	//공지사항 분류
	List<Notice> b_NoticeSort(int cb_sort);

	//게시글 리스트 불러오기
	List<Notice> getboardList();
		
	/*int removeChk();*/

	/*List<Notice> getAnnList();*/

}
