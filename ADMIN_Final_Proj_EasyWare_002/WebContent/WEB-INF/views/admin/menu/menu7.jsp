<%-- 
    작업 날짜 : 2015. 10. 18.
    구현 내용 :   
  
  @author By kira 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- JSTL 선언 -->

<!-- Resoures 선언 -->
<link href="<c:url value='/resources/[필요한 CSS파일경로명]' />"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/resources/layout/js/common.js'/>"></script>
<div class="row">
	<div class="col-sm-4">

		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title"> 보고서 양식 </h3>
			</div>
			<div class="panel-body">


				<h3>UI 템플릿</h3>
				<div class="checkbox">
					<label> <input type="checkbox"> Checkbox
					</label>
				</div>
				<div class="checkbox">
					<label> <input type="checkbox"> Checkbox
					</label>
				</div>
				<div class="checkbox">
					<label> <input type="checkbox"> Checkbox
					</label>
				</div>
				<div class="checkbox">
					<label> <input type="checkbox"> Checkbox
					</label>
				</div>
				<div class="checkbox">
					<label> <input type="checkbox"> Checkbox
					</label>
				</div>
				<div class="checkbox">
					<label> <input type="checkbox"> Checkbox
					</label>
				</div>
				<div class="checkbox">
					<label> <input type="checkbox"> Checkbox
					</label>
				</div>
				<div class="checkbox">
					<label> <input type="checkbox"> Checkbox
					</label>
				</div>
				<div class="checkbox">
					<label> <input type="checkbox"> Checkbox
					</label>
				</div>
				<div class="checkbox">
					<label> <input type="checkbox"> Checkbox
					</label>
				</div>
				<div class="checkbox">
					<label> <input type="checkbox"> Checkbox
					</label>
				</div>
				<div class="checkbox">
					<label> <input type="checkbox"> Checkbox
					</label>
				</div>
				<div class="radio">
                    <label>
                	<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                     라디오 버튼      
                    </label>  
                </div>
				<div class="radio">
                    <label>
                	<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                     라디오 버튼      
                    </label>  
                </div>
				<div class="radio">
                    <label>
                	<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                     라디오 버튼      
                    </label>  
                </div>
				
			</div>
		</div>
	</div>
	<div class="col-sm-7 col-xs-7 col-md-8 col-lg-8">
		<div class="well well-lg">
			보고자 결제   	
		</div>
	</div>	
	
	<div class="col-sm-7 col-xs-7 col-md-8 col-lg-8">
		<textarea class="ckeditor" cols="2" id="editor1" name="editor1" rows="40"/></textarea>
	</div>	
	
</div>	
	
	
	
<script type="text/javascript">
	$(docoment).ready(){
		CKEDITOR.replace( 'ckeditor' );
	};
</script>
