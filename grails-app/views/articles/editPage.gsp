<%--
  Created by IntelliJ IDEA.
  User: narendra
  Date: 14/7/15
  Time: 3:18 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Edit Page</title>
    <meta name="layout" content="bloggerLayout"/>
    <link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet">
    <script src="${resource(dir: 'js', file: 'jquery-1.11.3.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
</head>

<body>
<div class=col-md-2></div>

<div class="col-md-8">
    <center><h1>B.A.S. HOSTEL</h1></center>

    <form>

        <div class="form-group">
            <label for="name_id" class="col-lg-3">Name:</label>

            <div class="col-md-9">
                <input type="text" autofocus="autofocus" class="form-control" minlength="3"
                       required="required" name="name"
                       id="name_id"/><br>
            </div>
        </div>

        <div class="form-group">
            <label for="fathername_id" class="col-lg-3">Father Name:</label>

            <div class="col-md-9">
                <input type="text" autofocus="autofocus" class="form-control" minlength="3"
                       required="required" name="fathername"
                       id="fathername_id"/><br>
            </div>
        </div>

        <div class="form-group">
            <label for="dob_id" class="col-lg-3">Date Of Birth:</label>

            <div class="col-md-9">
                <input type="date" autofocus="autofocus" class="form-control"
                       required="required" name="dob"
                       id="dob_id"/><br>
            </div>
        </div>

        <div class="form-group">
            <label for="email_id" class="col-lg-3">Email:</label>

            <div class="col-md-9">
                <input type="email" class="form-control" required="required" name="email"
                       id="email_id"/><br>
            </div>
        </div>

        <div class="form-group">
            <label for="contact_id" class="col-lg-3">Contact:</label>

            <div class="col-md-9">
                <input type="number" maxlength="10" class="form-control" min="1" minlength="10"
                       required="required" name="contact"
                       id="contact_id"/><br>
            </div>
        </div>


        <div class="form-group">
            <label for="p_address_id" class="col-lg-3">Permanent Address:</label>

            <div class="col-md-9">
                <input type="text" autofocus="autofocus" class="form-control"
                       required="required" name="p_address"
                       id="p_address_id"/><br>
            </div>
        </div>

        <div class="form-group">
            <label for="l_address_id" class="col-lg-3">Local Address:</label>

            <div class="col-md-9">
                <input type="text" autofocus="autofocus" class="form-control"
                       required="required" name="l_address"
                       id="l_address_id"/><br>
            </div>
        </div>

        <div class="form-group">
            <label for="institute_id" class="col-lg-3">Colloge/institute/Office:</label>

            <div class="col-md-9">
                <input type="text" autofocus="autofocus" class="form-control"
                       required="required" name="institute"
                       id="institute_id"/><br>
            </div>
        </div>

        <div class="form-group">
            <label for="password_id" class="col-lg-3">Password:</label>

            <div class="col-md-9">
                <input type="password" class="form-control" minlength="5" required="required"
                       name="password" id="password_id"/><br>
            </div>
        </div>

        <div class="form-group">
            <label for="confirm_password_id" class="col-lg-3">Confirm Password:</label>

            <div class="col-md-9">
                <input type="password" class="form-control" minlength="5" required="required"
                       name="confirm_password" equalTo="#password_id"
                       id="confirm_password_id"/>
                %{--<span id='message'></span>--}%
            </div>
        </div>




    <h2>Rule and Regulation</h2>
    <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">Rule and Rsegulation</button>

    <div id="demo" class="collapse">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
    </div>
    <center>
        <g:submitButton name="Submit" style="margin-top: 20px" class="btn btn-success"
                        value="Register"
                        id="submit_btn"/>
    </center>
    </form>
</div>

<div class=col-md-2></div>

<script>
    $("#userSinghUpForm").validate({
        rules: {},
        messages: {
            name: {
                required: "Please enter Candidate name"
            },
            fathername: {
                required: "Please enter Father's name"
            },
            dob: {
                required: "Please enter Date of birth"
            },
            email: {
                required: "Please enter Email id name"
            },

            l_address: {
                required: "Please enter Local Address"
            },
            p_address: {
                required: "Please enter Permanent Address"
            },
            contact: {
                min: "Contact must be a number",
                minlength: "Contact lenght must be 10",
                required: "Please enter Contact",
                maxlength: "Contact lenght must be 10"
            },
            institute: {
                required: "Please enter institute/collage/company name"
            },

            password: {
                minlength: "Password must contain 5 charecters",
                required: "Please enter password"
            },
            confirm_password: {
                minlength: "Confirm Password must contain 5 charecters",
                required: "Please enter Confirm password",
                equalTo: "Please enter the password same as above"
            }

        }
    });
</script>

</body>
</html>