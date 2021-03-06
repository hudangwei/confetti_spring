<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../layout/taglib.jsp"%>

<c:url var="edit_post_url" value="/plays/edit/${play.id}" />
<c:url var ="tinymceCss" value='/css/tinymce.css'/>

<form:form commandName="play" cssClass="sky-form addPostForm" method="post" action="${edit_post_url}">
	<form:hidden path="id"/>
	<header><spring:message code="label.plays.add.heading" /></header>		
	<fieldset>
	
		<div class="form-item">
		<section>
			<label class="label">Choose Dossier <form:errors path="dossier" /></label> <label class="select">
			<form:select path="dossier.id">
				<form:option  value="">--Select one--</form:option>
				<form:options items="${dossiers}" itemValue="id" itemLabel="name"/>
				<form:errors path="dossier"/>
			</form:select>
			
			</label>
		</section>
	</div>
	
	
		<div class="form-item">
			<section>
				<label class="label">Choose Type <form:errors path="playType" /></label> <label class="select">
				<form:select path="playType.id" items="${playTypes}" itemValue="id" itemLabel="name"/>
				</label>
			</section>
		</div>
	
		
		<div class="form-item">
			<section>
				<label class="label"><spring:message code="label.plays.add.url" /> <span class="color-red">*</span> <form:errors path="url" /></label> <label class="input"> <form:input
						path="url" />
				</label>
			</section>
		</div>
		
		<div class="form-item">
			<section>
				<label class="label"><spring:message code="label.plays.add.embeddedUrl" /> <form:errors path="url" /></label> <label class="input"> 
				<form:input path="embeddedUrl" />
				</label>
			</section>
		</div>
		
		<div class="form-item">
			<section>
				<label class="label"><spring:message code="label.plays.add.title" /> <span class="color-red">*</span> <form:errors path="title" /></label> <label class="input"> <form:input
						path="title" />
				</label>
			</section>
		</div>
		
		
		
		
		<div class="form-item">
			
			<section class="form-item">
				<label class="label"><spring:message code="label.plays.add.description" /></label> <label class="textarea">
					<form:textarea path="description" cssClass="editorTextarea"/>
					
				</label>
				<div class="note">
					<strong>Note:</strong> A small description or a subtitle to your post
				</div>
			</section>
		</div>

	</fieldset>
	<footer>
		<button class="btn-u" type="submit" name="action" value="draft"><spring:message code="label.plays.add.submitBtn" /></button>
		
	</footer>



</form:form>
<!-- TinyMCE -->
<script type="text/javascript" src="<c:url value='/js/tinymce_4.4.1/tinymce/js/tinymce/tinymce.min.js'/>"></script>	
<script>

tinymce.init({
	  mode : "specific_textareas",
    editor_selector : "editorTextarea",
	  height: 500,
	  theme: 'modern',
	  content_css : "${tinymceCss}",
	  plugins: [
	    'advlist autolink lists link image charmap print preview hr anchor pagebreak',
	    'searchreplace wordcount sh4tinymce visualblocks visualchars code fullscreen',
	    'insertdatetime media nonbreaking save table contextmenu directionality',
	    'emoticons template paste textcolor colorpicker textpattern imagetools'
	  ],
	  toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
	  toolbar2: 'print preview media | forecolor backcolor emoticons | sh4tinymce',
	  image_advtab: true,
	  templates: [
	    { title: 'Test template 1', content: 'Test 1' },
	    { title: 'Test template 2', content: 'Test 2' }
	  ]
	  
});

</script>