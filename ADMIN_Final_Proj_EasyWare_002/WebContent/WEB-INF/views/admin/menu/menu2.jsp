<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title"> MEMBER MANAGER LIST</h3>
	</div>
	<div class="panel-body">
		<h3> UI 템플릿 </h3>
		<pre>
	구현 컨셉  :::: 	 	
		
		</pre>
		
	</div>
</div>

<hr>
<table class="table table-striped table-hover ">
	<thead>
		<tr>
			<th>#</th>
			<th>MEMBER CODE</th>
			<th>MEMBER DEPARTMENT </th>
			<th>MEMBER POSITION</th>
			<th>MEMBER HIREDATE </th>
			<th>MEMBER STATE </th>
			<th>수정</th>
			<th>상세보기</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#etcModal" ><span class="glyphicon glyphicon-pencil"></span></button></td>
			<td><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#etcModal" ><span class="glyphicon glyphicon-zoom-in"></span></button></td>
		</tr>
		<tr>
			<td>2</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#etcModal" ><span class="glyphicon glyphicon-pencil"></span></button></td>
			<td><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#etcModal" ><span class="glyphicon glyphicon-zoom-in"></span></button></td>
			
		</tr>
		<tr class="info">
			<td>3</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#etcModal" ><span class="glyphicon glyphicon-pencil"></span></button></td>
			<td><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#etcModal" ><span class="glyphicon glyphicon-zoom-in"></span></button></td>
		</tr>
		<tr class="success">
			<td>4</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-pencil"></span></button></td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-zoom-in"></span></button></td>
		</tr>
		<tr class="danger">
			<td>5</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-pencil"></span></button></td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-zoom-in"></span></button></td>
		</tr>
		<tr class="warning">
			<td>6</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-pencil"></span></button></td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-zoom-in"></span></button></td>
		</tr>
		<tr class="active">
			<td>7</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td>Column content</td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-pencil"></span></button></td>
			<td><button class="btn btn-primary" type="button" ><span class="glyphicon glyphicon-zoom-in"></span></button></td>	
		</tr>
	</tbody>
</table>

<!-- 비고 Modal Start-->
<div class="modal fade" id="etcModal" tabindex="-1" role="dialog" aria-labelledby="etcModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="etcModalLabel"> 모달 타이틀 </h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="message-text" class="control-label"></label>
            <textarea class="form-control" id="message-text" cols="10" rows="10"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Save</button>
      </div>
    </div>
  </div>
</div>
<!-- 비고 Modal End-->

