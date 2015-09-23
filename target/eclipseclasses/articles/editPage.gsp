<%--
  Created by IntelliJ IDEA.
  User: narendra
  Date: 14/7/15
  Time: 3:18 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head> <title>Edit Page</title>
    <meta name="layout" content="bloggerLayout"/>
    <link href="${resource(dir:'css',file:'bootstrap.min.css')}" rel="stylesheet">
    <script src="${resource(dir: 'js',file: 'jquery-1.11.3.min.js')}"></script>
    <script src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>
</head>
<body>
<div class="col-sm-3">
</div>
<div id='create_page_div' class="col-sm-6" class="form-group">
    <h1>Welcome back edit your article here...</h1><br>
    <form method="post" action="${createLink(controller: "articles",action: "saveEditPage",params:[id:articleId])}" name="create_page_form">
        <input type="text" required id="title" value="${articleToshow.articleTitle}" autofocus="autofocus" class="form-control" name="article_title" maxlength="20" placeholder="Article Title"><br><br>
        <g:textArea id="article" required="required" value="${articleToshow.article}" style="height: 230px" class="form-control" name="article" maxlength="200" placeholder="Your Article"></g:textArea><br><br>
        <div class="col-sm-2"><input  type="submit" name="Submit" id="create_page_btn" class="btn btn-success"></div>
        <div class="col-sm-10">
            <input type="button" id="reset_btn" name="Reset" value="Reset" class="btn btn-danger"></div>
    </form>
</div>
<div class="col-sm-3">
</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<script>
    $("#reset_btn").click(function()
    {$("#title").val("")
        $("#article").val("")
    });
</script>

</body>
</html>