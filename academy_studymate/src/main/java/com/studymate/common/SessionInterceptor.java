package com.studymate.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//Controller로 이동하기 전에 처리하는 필터기능(로직 처리)
//HandlerInterceptorAdapter를 상속 받는다.
public class SessionInterceptor extends HandlerInterceptorAdapter{
	//preHandle() 컨트롤러가 가기 전에 호출되는 메서드(기본값 true / false면 컨트롤러로 보내지 않음)
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// check variable 입력 받았을 아이디 값을 받아온다.
		Object memId = request.getSession().getAttribute("memId");
		// 요청하는 URL주소가 같은지 확인
		// pass through when access login.do, join.do
		String URI = request.getRequestURI();
		
		if (URI.equals("/studymate/loginForm") || URI.equals("/studymate/memberWrite")) {
			if (memId != null) {//같은 로그인 정보로 다른 브라우져에서 다시 접속할때 작동
				response.sendRedirect(request.getContextPath() + "/main");
				return false;//true 리턴 Controller이동
			} else {
				return true;
			}
		}
		// where other pages 입력값이 NULL이면 sendRedirect로 보냄	
		switch (URI) {
		case "/studymate/memberList":case "/studymate/reserveList":
		case "/studymate/memberAdRead":case "/studymate/reserveWrite":
		case "/studymate/memberMypage":case "/studymate/reserveSeleted":
		case "/studymate/memberUpdateClient":case "/studymate/reserveUpdate":
		case "/studymate/memberUpdate":case "/studymate/reserveRead":
		case "/studymate/memberDelete":case "/studymate/reserveDelete":
		case "/studymate/isAbleId":case "/studymate/reviewWrite":
		case "/studymate/isRightPass":	case "/studymate/reviewRead":
		case "/studymate/memResPaging":case "/studymate/reviewUpdate":
		case "/studymate/memResDetail":case "/studymate/reviewDelete":
		case "/studymate/memberRealDel":case "/studymate/revReplyList":
		case "/studymate/noticeWrite":case "/studymate/revReplyWrite":
		case "/studymate/noticeUpdate":case "/studymate/revReplyDelete":
		case "/studymate/noticeDelete":case "/studymate/roomWrite":
		case "/studymate/qnaWrite":case "/studymate/roomUpdate":
		case "/studymate/qnaUpdate":case "/studymate/roomDelete":
		case "/studymate/qnaDelete":case "/studymate/getLocation":
		case "/studymate/qnaComment":
			if(memId == null) {
				response.sendRedirect(request.getContextPath() + "/loginForm");
				return false; // false를 리턴하면 Controller로 이동하지 않는다.
			} else {
				return true;	
			}
		default:
			break;
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	}
}
