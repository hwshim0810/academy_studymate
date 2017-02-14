package com.studymate.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerMapping;
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
		Map<?, ?> pathVariables
			= (Map<?, ?>) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
		
		if (URI.equals("/studymate/loginForm") || URI.equals("/studymate/memberWrite")) {
			if (memId != null) {//같은 로그인 정보로 다른 브라우져에서 다시 접속할때 작동
				response.sendRedirect(request.getContextPath() + "/main");
				return false;//true 리턴 Controller이동
			} else {
				return true;
			}
		}
		// where other pages 입력값이 NULL이면 sendRedirect로 보냄	
		String currentPage = (String) pathVariables.get("currentPage");
		String memKey = (String) pathVariables.get("memId");
		String bonKey = (String) pathVariables.get("bonNum");
		String boqKey = (String) pathVariables.get("boqNum");
		String borKey = (String) pathVariables.get("borNum");
		String resKey = (String) pathVariables.get("resNum");
		String borvKey = (String) pathVariables.get("borvNum");
		
		if (URI.equals("/studymate/memberList/" + currentPage) || URI.equals("/studymate/memberAdRead/" + currentPage + "-" + memKey) 
				|| URI.equals("/studymate/memberUpdate/" + currentPage + "-" + memKey) || URI.equals("/studymate/memberUpdate/" + currentPage) 
				|| URI.equals("/studymate/memberRealDel/" + currentPage) || URI.equals("/studymate/noticeUpdate/" + currentPage + "-" + bonKey) 
				|| URI.equals("/studymate/noticeUpdate/" + currentPage) || URI.equals("/studymate/noticeDelete/" + currentPage + "-" + bonKey) 
				|| URI.equals("/studymate/qnaRead/" + currentPage + "-" + boqKey) || URI.equals("/studymate/qnaUpdate/" + currentPage + "-" + boqKey) 
				|| URI.equals("/studymate/qnaUpdate/" + currentPage) || URI.equals("/studymate/qnaDelete/" + currentPage + "-" + boqKey) 
				|| URI.equals("/studymate/qnaComment/" + currentPage + "-" + boqKey) || URI.equals("/studymate/qnaComment/" + currentPage) 
				|| URI.equals("/studymate/reserveList/" + currentPage) || URI.equals("/studymate/reserveSeleted/" + borKey) 
				|| URI.equals("/studymate/reserveRead/" + currentPage + "-" + resKey) || URI.equals("/studymate/reserveUpdate/" + currentPage + "-" + resKey) 
				|| URI.equals("/studymate/reserveDelete/" + currentPage + "-" + resKey) || URI.equals("/studymate/reviewRead/" + currentPage + "-" + borvKey) 
				|| URI.equals("/studymate/reviewUpdate/" + currentPage + "-" + borvKey) || URI.equals("/studymate/reviewDelete/" + currentPage + "-" + borvKey) 
				|| URI.equals("/studymate/roomUpdate/" + currentPage + "-" + borKey) || URI.equals("/studymate/roomDelete/" + currentPage + "-" + borKey)) {
		
			if(memId == null) {
				response.sendRedirect(request.getContextPath() + "/needLogin");
				return false; // false를 리턴하면 Controller로 이동하지 않는다.
			} else {
				return true;	
			}
		}
		
		switch (URI) {
		case "/studymate/reserveWrite":
		case "/studymate/memberMypage":
		case "/studymate/memberUpdateClient":
		case "/studymate/isAbleId":
		case "/studymate/reviewWrite":
		case "/studymate/isRightPass":
		case "/studymate/memResPaging":
		case "/studymate/memResDetail":
		case "/studymate/memberRealDel":
		case "/studymate/revReplyList":
		case "/studymate/noticeWrite":
		case "/studymate/revReplyWrite":
		case "/studymate/revReplyDelete":
		case "/studymate/roomWrite":
		case "/studymate/qnaWrite":
		case "/studymate/getLocation":
			if(memId == null) {
				response.sendRedirect(request.getContextPath() + "/needLogin");
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
