<%@ page import="blogger.Articles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="bloggerLayout"/>
		<link href="${resource(dir:'css',file:'bootstrap.min.css')}" rel="stylesheet">
		<script src="${resource(dir: 'js',file: 'jquery-1.11.3.min.js')}"></script>
		<title>Welcome to Grails</title>
	</head>
<body>
<div class="col-sm-2"></div>
<div class="col-sm-8" style="align-content: center">
<h1 style="color: #33CC33">Articles and more Articles...</h1>
	<%
def criteria =Articles.createCriteria()
def result = criteria.list{}
result.each {Articles articles=it as Articles
%>
<form style="border: transparent;color:#080808;border-radius: 10px">
	<fieldset>
		<legend style="border-radius: 2px"><strong>${articles.articleTitle}:</strong></legend>
		<blockquote style="">

			<p>${articles.article}</p>
			<footer>Author:<cite title="Source Title">${articles.articleAuthorName}</cite>
			<b style="box-shadow: #205081">-----------------------------------------------
				---------------------------
				${articles.dateCreated.getDateString()},${articles.dateCreated.getTimeString()}</b></footer>

			</blockquote>
	</fieldset>
</form>

<%
//	println(articles.articleTitle)
//	println(articles.article)
}
    %>
</div>
<div class="col-sm-2"></div>
<script>

	$(document).ready(function() {
		$('p').CapitalLetter({
			'float': 'left',
			'padding': 0,
			'margin': '0 0.1em 0 0',
			'color': '#CC3300'
		});
	});
</script>

	</body>
</html>
