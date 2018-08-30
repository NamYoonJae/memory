package icia.mvc.dao;

import java.util.List;
import java.util.Map;

import icia.mvc.bean.Board;
import icia.mvc.bean.Member;

public interface ImemberDao {
	
	//아이디 중복체크여부
	int mb_checkId(String m_id);
	
	//로그인
	int mb_Login(Member mb);

	//로그인시 회원 정보 가져오기
	Member getMemberInfo(String m_id);
	
	//일반 회원가입
	int mb_Join(Member mb) throws Exception;

	//일반유저 회원가입시 관심분야 저장
	int ch_check(Member mb);

	//취미 아티스트 회원가입
	int mb_ArtJoin(Member member);
	
	//취미아티스트 회원가입시 파일테이블 등록
	int m_ArtFileInserte(Map<String, String> fMap);
	
	//회원가입시 포인트와 경험치 저장
	int p_pointExp(Member mb);

	//회원 탈퇴
	int mp_MyOut(String m_id);

	//마이페이지 정보수정
	int mp_MyInfoChange(Member mb);

	//비밀번호 변경
	int mp_ChangePw(Member mb);

	//아이디 찾기
	String idFind(Member mb);

	//비밀번호 찾기
	String pwFind(Member mb);

	
	
}
