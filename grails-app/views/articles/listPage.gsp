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
    <script src="${resource(dir: 'js', file: 'jquery.dataTables.min.js')}"></script>
</head>

<body>
<style>
a.disabled:link, a.disabled:visited {
    color: grey;
}
</style>
<table id="table_article" style="margin-left: 30px"  class="table table-striped" width="90%">
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
    <div id="listArea">
        <g:render template="refreshedList" model="[userId:userId,articlesInfo:articlesInfo]"/>
    </div>
    </tbody>

</table>
<script>
    $("#table_article").DataTable({
        paging: true,
        "searching": false,
        "lengthMenu": [ 5, 7, 10 ],
        "pagingType": "full_numbers"

    } );
    function deleteByAjax(id) {
        $.ajax({
            url: "${createLink(controller:'articles',action:'deleteRecordByAjax')}",
            dataType: 'json',
            data: {
                id:id
            },
            success: function (id) {
              //  alert("///////////////"+id)
               // location.reload()
              $("#article_"+id).hide();
            //  $("#article_"+id+" td:nth-child(3)").text("max");
            },
            error: function (request, status, error) {
                alert(request)
            }
        });
    }
</script>

</body>
</html>