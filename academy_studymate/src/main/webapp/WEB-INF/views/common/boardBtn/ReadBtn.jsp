<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<div class="pull-right">
			<c:choose>
				<c:when test="${not empty param.keyField && not empty param.keyWord}">
					<c:url value="${listBtn}" var="listUrl">
						<c:param name="keyField" value="${param.keyField}" />
						<c:param name="keyWord" value="${param.keyWord}" />
					</c:url>
					<c:url value="${updateBtn}/${currentPage}-${primaryKey}" var="updateUrl">
						<c:param name="keyField" value="${param.keyField}" />
						<c:param name="keyWord" value="${param.keyWord}" />
						<c:param name="update" value="y" />
					</c:url>
					<c:url value="${deleteBtn}/${currentPage}-${primaryKey}" var="deleteUrl">
						<c:param name="keyField" value="${param.keyField}" />
						<c:param name="keyWord" value="${param.keyWord}" />
						<c:if test="${not empty qnaGroupnum}">
							<c:param name="boqGroupnum" value="${qnaGroupnum}"/>
						</c:if>
					</c:url>
				</c:when>
				<c:otherwise>
					<c:url value="${listBtn}" var="listUrl" />
					<c:url value="${updateBtn}/${currentPage}-${primaryKey}" var="updateUrl">
						<c:param name="update" value="y" />
					</c:url>
					<c:url value="${deleteBtn}/${currentPage}-${primaryKey}" var="deleteUrl" />
				</c:otherwise>
			</c:choose>
			<button class="btn btn-info btn-font" id="btnback">뒤로</button>
			<a class="btn btn-primary btn-font" href="${listUrl}">목록</a>
		</div>