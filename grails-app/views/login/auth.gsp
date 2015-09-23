<%--
  Created by IntelliJ IDEA.
  User: narendra
  Date: 11/7/15
  Time: 3:15 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login Form</title>
    <meta name="layout" content="bloggerLayout"/>
    <link href="${resource(dir:'css',file:'bootstrap.min.css')}" rel="stylesheet">
    <script src="${resource(dir: 'js',file: 'jquery-1.11.3.min.js')}"></script>
    <script src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>
</head>
<body>
<div class="col-sm-4" aria-orientation="horizontal">
</div>
<div id='login' class="col-sm-4">
    <div class='inner'>

        <g:if test='${flash.message}'>
            <div class='login_message'>${flash.message}</div>
        </g:if>

        <form action='${postUrl}'  method='POST' id='loginForm' class='cssform' autocomplete='off'>
            <div class="form-group">
                <label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
                <input type='text'  class="form-control"  placeholder="AnujNIgam"  name='j_username' id='username'/>
            </div>

            <div class="form-group">
                <label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
                <input type='password' class="form-control" placeholder="..........."  name='j_password'  id='password'/>
            </div>

            <p id="remember_me_holder">
                <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
            </p>

            <p>
                <input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
            </p>
        </form>
    </div>
</div>
<div class="col-sm-4">
</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<script type='text/javascript'>
    <!--
    (function() {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>
</body>
</html>