<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div class="container">
  <h2>희망도서 신청/ 조회</h2>
  <br/>
  <h2><p align="center">도서 신청</p></h2>
  <br/>
  
  <form class="form-horizontal">
    <div class="form-group">
      <label class="col-sm-2 control-label">지역 구분 :</label>
      <div class="col-sm-10">
        <input class="form-control" id="focusedInput" type="text" placeholder="click..">
      </div>
    </div>
    <div class="form-group">
      <label for="disabledInput" class="col-sm-2 control-label">저자</label>
      <div class="col-sm-10">
        <input class="form-control" id="disabledInput" type="text" >
      </div>
    </div>
    
      <div class="form-group">
        <label for="disabledTextInput" class="col-sm-2 control-label">지역 구분 :</label>
         <div class="col-sm-10">
        <select id="Select" class="form-control">
        	<option></option>
            <option>국내</option>
            <option>동양</option>
            <option>서양</option>
            
            </select>
        </div>
      </div>
      <div class="form-group">
       <label for="disabledTextInput" class="col-sm-2 control-label">신청기관 :</label>
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-10">
          <select id="Select" class="form-control">
            <option></option>
            <option>군포도서관</option>
            <option>당동 도서관</option>
            <option>선경도서관</option>
            <option>중앙도서관</option>
            
          </select>
        </div>
      </div>
    <div class="form-group has-success has-feedback">
      <label class="col-sm-2 control-label" for="inputSuccess">단가</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="inputSuccess">
        <span class="glyphicon glyphicon-ok form-control-feedback"></span>
      </div>
    </div>
    <div class="form-group has-warning has-feedback">
      <label class="col-sm-2 control-label" for="inputWarning">ISBN <small>＊필수사항입니다.</small></label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="inputWarning">
        <span class="glyphicon glyphicon-warning-sign form-control-feedback"></span>
      </div>
    </div>
    <div class="form-group has-error has-feedback">
      <label class="col-sm-2 control-label" for="inputError">주기사항</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="inputError">
        <span class="glyphicon glyphicon-remove form-control-feedback"></span>
      </div>
    </div>
    <div align="center"><a href="/"><button type="button">신청하기</button></a></div>
  </form>
  
  
  <div class="container">
  <h2 align="center">신청 내역 조회</h2>
  <font color="blue">＊제목을 입력바랍니다.</font>
  <form action="/account/searchView">
    <div class="input-group">
      <input type="text" class="form-control" placeholder="Search" name="search">
      <div class="input-group-btn">
        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
      </div>
    </div>
  </form>
</div>
</div>

