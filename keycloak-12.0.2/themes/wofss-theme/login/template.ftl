<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${url.resourcesPath}/img/favicon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <title><#nested "title"></title>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>

	<body style="background: url('${url.resourcesPath}/img/bg-2.png') no-repeat no-repeat; background-size: cover;">
        <div class="page-wrapper bg-gra-01">
            <div class="wrapper wrapper--w780">

                <#--  Render Form -->
                <#nested "form">

                <#--  Language Switcher -->
                <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                <div class="wofss-lang-switcher">
                    <#if locale.current == 'English' >
                        <a  href="javascript:currentUrl('ar')" aria-label="lang" class="float-right"><img src="${url.resourcesPath}/img/ar.svg" width="25"></a>
                    </#if>
                    <#if locale.current == 'Arabic' >
                        <a  href="javascript:currentUrl('en')" aria-label="lang" class="float-left"><img src="${url.resourcesPath}/img/en.svg" width="25"></a>
                    </#if>
                </div>
                </#if>
                
                <#-- Alerts -->
                <#if displayMessage && message?has_content>
                <div class="alert alert-${message.type}">
                    <#--  <img src="${url.resourcesPath}/img/alert.svg" width="15">  -->
                    <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                    <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                    <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                    <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                    <span class="message-text">  ${message.summary?no_esc} </span>
                </div>
                </#if>

            </div> 
        </div>

        <script>
            function currentUrl(lang) {
                setCookie("language",lang,30);
            var currentUrl= window.location.href;
            if(currentUrl.includes('kc_locale'))
            {
                if(lang == 'ar')
                    window.location.href=currentUrl.replace('kc_locale=en', 'kc_locale=ar');
                else if(lang == 'en')
                    window.location.href=currentUrl.replace('kc_locale=ar', 'kc_locale=en');
            }
            else
             {
                 if(currentUrl.includes("?"))
                    window.location.href=currentUrl + '&kc_locale=' + lang
                 else
                    window.location.href=currentUrl + '?kc_locale=' + lang
             }}
              
            (function() {
            var body = document.body;
            console.log(getCookie('language'));
            console.log(body.classList);
            if(getCookie('language') == 'ar')
            {
                body.classList.add("rtl");
            }else {
                body.classList.add("ltr");
            }  
            })();

            function setCookie(name, value, daysToLive) {
                // Encode value in order to escape semicolons, commas, and whitespace
                var cookie = name + "=" + encodeURIComponent(value);
                
                if(typeof daysToLive === "number") {
                    /* Sets the max-age attribute so that the cookie expires
                    after the specified number of days */
                    cookie += "; max-age=" + (daysToLive*24*60*60);
                    
                    document.cookie = cookie;
                }
            }
            function getCookie(name) {
                // Split cookie string and get all individual name=value pairs in an array
                var cookieArr = document.cookie.split(";");
                // Loop through the array elements
                for(var i = 0; i < cookieArr.length; i++) {
                    var cookiePair = cookieArr[i].split("=");
                    
                    /* Removing whitespace at the beginning of the cookie name
                    and compare it with the given string */
                    if(name == cookiePair[0].trim()) {
                        // Decode the cookie value and return
                        return decodeURIComponent(cookiePair[1]);
                    }
                }
                
                // Return null if not found
                return null;
            }
        </script>
	</body>
</html>
</#macro>