<!DOCTYPE html>
<html>
	<head>
		<title>Welcome to Bloggers.com</title>
		<meta name="layout" content="bloggerLayout"/>
		<link href="${resource(dir:'css',file:'bootstrap.min.css')}" rel="stylesheet">
		<script src="${resource(dir: 'js',file: 'jquery-1.11.3.min.js')}"></script>
		<script src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>
		<style>
		#header {background-color:#000000;padding: 10px;text-align: left;}
		#footer {background-color:transparent;text-align: left;}
		</style>
		<g:layoutHead/>
	</head>
	<body>
	<div id="header"  style="color:#000000;margin-bottom: 10px">
		<div class="row" aria-orientation="horizontal">
		<div class="col-sm-3" style="background-color:#000000;">
			<h1 style="color: #FFFFFF">BLOGGER.com</h1>
		</div>
		<div class="col-sm-2" aria-orientation="vertical" style="background-color:#000000;margin-top: 20px">
			<form name="createPage_form" id="createPage_form_id" action="${createLink(controller: 'articles',action: 'createPage')}" method="post">
				<button type="submit"  id="create_page_btn" class="btn btn-primary">Create</button>
			</form>
		</div>
			<div class="col-sm-3" aria-orientation="vertical" style="background-color:#000000;margin-top: 20px">
				<form name="createPage_form" id="listPage_form_id" action="${createLink(controller: 'articles',action: 'listPage')}" method="post">
				 <button type="submit" id="list_page_btn" class="btn btn-primary" style="padding-left: 26px;padding-right: 26px">List</button>
                </form>

		  </div>
			<div class="col-sm-1" style="background-color:#000000;margin-top: 18px">
				<form name="login_form" id="home_btn_form" action="${createLink(controller: 'articles',action: 'home')}" method="post">
					<button type="submit" id="home_btn" name="home_btn" class="btn btn-primary" style="margin-right: 18px;padding-left: 17px;padding-right: 16px">Home</button>
				</form>
			</div>

			<div class="col-sm-3" style="background-color:#000000;margin-top: 18px">
			<form name="login_form" id="login_form_id" action="${createLink(controller: 'login',action: 'auth')}" method="post">
			    	<button type="submit" id="login_btn" name="login_btn" class="btn btn-primary" style="margin-right: 18px;padding-left: 17px;padding-right: 16px">Login</button>
            </form>
			<form name="logout_form" id="logout_form_id" action="${createLink(controller: 'logout')}" method="post">
					<button type="submit" id="logout_btn" name="logout_btn"  class="btn btn-primary" style="margin-right: 18px">Logout</button>
			</form>
		</div>
		</div>
	</div>
	<g:layoutBody/>
	<div id="footer" style="position: fixed;bottom: 0px;width: 100%"><b style="margin-left: 80%">#Copyright NextThought</b><br><b style="margin-left: 80%">Created By:NextThought</b></div>
	<sec:ifLoggedIn>
		<script>
			$("#login_form_id").hide()
			$("#logout_form_id").show()
		</script>

	</sec:ifLoggedIn>

	<sec:ifNotLoggedIn>
		<script>
			$("#logout_form_id").hide()
			$("#login_form_id").show()
			$("#create_page_btn").hide()
			$("#list_page_btn").hide()
		</script>
	</sec:ifNotLoggedIn>

	</body>
</html>
