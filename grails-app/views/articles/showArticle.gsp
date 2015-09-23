<%--
  Created by IntelliJ IDEA.
  User: narendra
  Date: 22/7/15
  Time: 5:59 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><param name="Article" value="${articleToDispaly.articleTitle}"/> Page</title>
    <meta name="layout" content="bloggerLayout"/>
    <link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet">
    <script src="${resource(dir: 'js', file: 'jquery-1.11.3.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'jquery.dataTables.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'angular.min.js')}"></script>
</head>
<body>
<form style="border: transparent;margin-top:2%;text-align:center;margin-right:10%;margin-left:10%;color:#080808;border-radius: 10px">
    <fieldset>
        <legend style="border-radius: 2px;text-align: left">
            Article&nbsp;:&nbsp;<strong>${articleToDispaly.articleTitle}</strong></legend>
        <blockquote style="">
            <p style="text-align: left">${articleToDispaly.article}</p>
            <footer style="text-align: left">Author&nbsp;:&nbsp;<cite title="Source Title" style="text-align: left">${articleToDispaly.articleAuthorName}</cite>
                <b style="box-shadow: #205081;text-align: right">
                   <div style="margin-right: 30px">Date : ${articleToDispaly.dateCreated.getDateString()}</div>
                    <div style="text-align: right">Time : ${articleToDispaly.dateCreated.getTimeString()}</div></b></footer>
        </blockquote>
    </fieldset>
</form>
<br>
<div style="margin-left: 10%;margin-right:10%">
<g:if test="${commentToDisplay!=null}">
   <strong>Comments:</strong><br>
   <hr> <g:each in="${commentToDisplay}" var="commentInfo">
        <b style="text-align: left">By&nbsp;:&nbsp;${commentInfo.commentPersonName}</b>
        <b style="padding-left: 79%">Dated&nbsp;:&nbsp;${commentInfo.dateCreated.getDateString()}</b>
        <br>
        <b style="padding-left: 87%">Time&nbsp;:&nbsp;${commentInfo.dateCreated.getTimeString()}</b>
        <br>
        <strong><g:textArea name="old_comments" id='${commentInfo.id}' style="color:#cc0000;border-width:0px;width: 700px;height: 100px;margin-left: 10%;text-align: center">${commentInfo.comment}</g:textArea>
        </strong>
    <br>
    </g:each>
</g:if>
</div>
<div ng-app="commentArticle" ng-controller="makeComment">
    <b style="margin-left: 10%">Please Comment</b>
    <form class="form-group">
      <b style="margin-left: 10%">Name:</b><input type="text" class="form-control" ng-model="personName" style="width: 200px;margin-left: 10%" placeholder="Chirag Bhasin" id="personName">
    <span ng-bind="comment" style="border-width:0px;width: 700px;height: 100px;margin-left: 10%;text-align: center"></span>
    <g:textArea name="comment_name" class="form-control" required="required" ng-model="comment" style="width: 700px;height: 100px;margin-left: 10%;text-align: center"/>
        <br>
        <b style="margin-left: 10%"><input type="button" required ng-click="callMe()"  name="Add Comment" value="Add Comment" class="btn btn-primary"/>
        </b>

  </form>
</div>

<script>
//    alert("inside script")
    var app = angular.module('commentArticle',[]);
    app.controller('makeComment', function($scope, $http) {
        $scope.callMe=function(){
            %{--alert("Clicked");--}%
            %{--alert(${articleToDispaly.id})--}%
            %{--$http.get("${createLink(controller: "articles",action:"saveComment")}");--}%
            $http.get("${createLink(controller: "articles",action:"saveComment")}", {
                params: {
                    articleId: "${articleToDispaly.id}",
                    commentPersonName:$scope.personName,
                    comment:$scope.comment
                }
            }).success(function(str) {
                if(str=="success")
                location.reload()}).error(function(){alert("error")});
        };
    });
</script>
</body>
</html>