<%--
  Created by IntelliJ IDEA.
  User: narendra
  Date: 13/7/15
  Time: 6:35 PM
--%>

<%@ page import="com.User; grails.plugin.springsecurity.SpringSecurityService; blogger.Articles" contentType="text/html;charset=UTF-8"
%>
<html>
<head>
    <title>List Page</title>
    <meta name="layout" content="bloggerLayout"/>
    <link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet">
    <script src="${resource(dir: 'js', file: 'jquery-1.11.3.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
</head>

<body>
<style>
a.disabled:link, a.disabled:visited {
    color: grey;
}
</style>
<table class="table table-hover">
    <thead>
    <tr>
        <th>#</th>
        <th>Date</th>
        <th>Author</th>
        <th>Title</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${articlesInfo}" var="article">
        <tr>
            <td>${article.id}</td>
            <td>${article.getDateCreated().getDateString()}</td>
            <td>${article.articleAuthorName}</td>
            <td>${article.articleTitle}</td>
            <sec:ifAnyGranted roles="ROLE_AUTHOR">
                <g:if test="${userId == article.articleAuthorId}">
                    <td><a id="edit_author"  style="color: green" href="${createLink(controller: "articles", action: "editPage", params: [id: article.id])}">Edit</a>
                %{-----<a class="delete" style="color: green" href="${createLink(controller: "articles",action: "deleteRecord" ,id:"${article.id}")}">Delete</a>--}%
                    -----<a href="javascript:void(0)" class="delete" onclick="deleteByAjax('${article.id}')" style="color: green">Delete</a>
                </g:if>
                <g:else>

                    <td><a id="edit_author_other" style="color: red" href="javascript:void(0);">Edit</a>
                        <a class="delete" style="color: red" href="javascript:void(0);">Delete</a></td>
                </g:else>
            </sec:ifAnyGranted>
            <sec:ifAnyGranted roles="ROLE_ADMIN">
                <td>
                <td><a id="edit_admin" style="color: green"
                       href="${createLink(controller:"articles", action: "editPage", params: [id:article.id])}">Edit</a>---
                    <a class="delete" style="color: green"
                       href="${createLink(controller: "articles", action: "deleteRecord", params: [id: article.id])}">Delete</a>
                </td>
            </sec:ifAnyGranted>
        </tr>
    </g:each>
    </tbody>

</table>
<script>
    function deleteByAjax(id) {
        $.ajax({
            url: "${createLink(controller:'articles',action:'deleteRecordByAjax',params:[id:id])}",
            dataType: 'json',
            data: {},
            success: function () {
                alert("deleted")
            },
            error: function (request, status, error) {
                alert(status)
            },
            complete: function () {
            }
        });
    }
</script>

</body>
</html>