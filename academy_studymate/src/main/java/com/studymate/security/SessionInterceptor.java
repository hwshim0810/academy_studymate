package com.studymate.security;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		HttpSession session = request.getSession();
		Object memId = session.getAttribute("memId");
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
		
		String[] paths = URI.split("/");
		if (paths.length == 2) {
			return true;
		} else if (paths.length > 2) { //비접속에서도가능
			switch (paths[2]) {
			case "error":
			case "needLogin":
			case "main":
			case "login":
			case "logoutConfirm":
			case "logout":
			case "isAbleId":
			case "memberMypage":
			case "isRightPass":
			case "memberFind":
			case "memberFindPass":
			case "memberFindId":
			case "memResPaging":
			case "memResDetail":
			case "noticeList":
			case "noticeRead":
			case "qnaList":
			case "getBorName":
			case "reviewList":
			case "roomList":
			case "roomRead":
			case "eventList":
			case "eventRead":
			case "getLocation":
			case "siteInfo":
			case "faq":
				return true;
			case "reserveSeleted":
				if (memId == null) {
					Map<?, ?> pathVariables
					= (Map<?, ?>) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
					String borNum = (String) pathVariables.get("borNum");
					String borName = (String) pathVariables.get("borName");
					
					session.setAttribute("page", "redirect:reserveSeleted/" + borNum + "-"
							+ URLEncoder.encode(borName, "UTF-8"));
					response.sendRedirect(request.getContextPath() + "/needLogin");
					return false;
				}
			default:
				if (memId != null) {
					if (!memId.equals("admin")) { // 관리자권한확인
						switch (paths[2]) {
						case "memberList":
						case "memberAdRead":
						case "noticeWrite":
						case "noticeUpdate":
						case "noticeDelete":
						case "qnaComment":
						case "reserveList":
						case "roomWrite":
						case "roomUpdate":
						case "roomDelete":
						case "eventWrite":
						case "eventUpdate":
						case "eventDelete":
							response.sendRedirect(request.getContextPath() + "/main");
							return false;
						}
					}
					return true;
				}
				response.sendRedirect(request.getContextPath() + "/needLogin");
				return false;
			}
		}
		return false;
	}
	
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	}
}
