<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="searchdiv">
	<form class="form-inline" id="searchform">
		<div class="form-group row col-sm-6 col-md-6 col-lg-6">
			<div class="col-xs-4 col-sm-3 col-md-3 col-lg-3 field">
				<label for="sel1" class="sr-only">검색 범위</label>
				<select class="form-control" id="keyField" name="keyField">
					<option value="memId">아이디</option>
					<option value="memName">이름</option>
					<option value="memAddr">주소</option>
					<option value="memEmail">이메일</option>
					<option value="memSex">성별</option>
				</select>
			</div>
			<div class="col-xs-5 col-sm-6 col-md-6 col-lg-6">
				<label class="sr-only">검색 내용:</label>
				<input type="text" class="form-control" id="keyWord" name="keyWord">
			</div>
			<div class="col-xs-1 col-sm-2 col-md-2 col-lg-2">
				<button class="btn btn-default" id="btnsearch">검색</button>
			</div>
		</div>
	</form>
</div>