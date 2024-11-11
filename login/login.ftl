<!-- ~/keycloak-themes/my-custom-theme/login/login.ftl -->
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Login</title>
    <#--  Import stylesheets and Google fonts  -->
    <link rel="stylesheet" href="${url.resourcesPath}/styles/main.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,300;1,400;1,600;1,700&display=swap" rel="stylesheet">
    <style>
        body {
            background: url('${url.resourcesPath}/img/hippocampus.png') no-repeat center right fixed #002766; 
            background-size: contain;
        }
    </style>
</head>
<body>
    <div class="page-container">
        <div class="login-header">
            <img class="icon" src="${url.resourcesPath}/img/logo.png?v=2" alt="BBOP logo">
        </div>
        <div class="login-wrapper"> 
            <div class="login-container">
                <div class="login-title">
                    <p>Sign in to your account</p>
                </div>
                <#if social.providers??>
                    <#list social.providers as idp>
                        <a href=${idp.loginUrl} class="social-link">
                            <img class="icon" src="${url.resourcesPath}/icons/${idp.alias}.svg" alt="${idp.displayName} Icon">
                            ${idp.displayName}
                        </a>
                    </#list>
                </#if>
            </div>
	    <div class="divider-text">or</div>
            <div class="form-container">
                <form
		    id="kc-form-login"
		    class="login-form"
		    onsubmit="login.disabled = true; return true;"
		    action=
		    method="post">
                    <fieldset class="login-form-group">
                        <label class="login-form-label" for="username">Username</label>
                        <input
			    aria-invalid=""
			    autocomplete="off"
			    class="login-form-input"
			    id="username"
			    name="username"
			    placeholder="Enter your username here..."
			    required
			    type="text"
			    value="">
                    </fieldset>
                    <fieldset class="login-form-group">
                        <label class="login-form-label" for="password">Password</label>
                        <input
			    aria-invalid=""
			    autocomplete="off"
			    class="login-form-input"
			    id="password"
			    name="password"
			    placeholder="****"
			    required
			    type="password"
			    value="">
                    </fieldset>

                    <input type="hidden" id="id-hidden-input" name="credentialId" />

	            <input
			class="login-form-submit"
			name="login"
			type="submit"
			value="Sign In" />
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function getCookie(name) {
	  const value = `; ${document.cookie}`;
	  const parts = value.split(`; ${name}=`);
	  if (parts.length === 2) return parts.pop().split(';').shift();
	}

	const session_code = getCookie("AUTH_SESSION_ID")

	const actionValue = `https://staging.openbluebrain.com/auth/realms/SBO/login-actions/authenticate?session_code=-${session_code}&amp;execution=9f5ce9ba-f364-4f9a-9063-09351330dff0&amp;client_id=sbo-core-webapp&amp;tab_id=3qLXSgP8wJY`

        document.getElementById('kc-form-login').setAttribute(action, actionValue);
    </script>
</body>
</html>
