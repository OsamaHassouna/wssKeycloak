<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
    <!DOCTYPE html
        PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <meta name="robots" content="noindex, nofollow">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="shortcut icon" href="${url.resourcesPath}/img/favicon.png" type="image/x-icon">
            <#-- <link rel="stylesheet" type="text/css"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" /> -->

            <#if properties.meta?has_content>
                <#list properties.meta?split(' ') as meta>
                <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
                </#list>
            </#if>

            <title>${msg("loginTitle",(realm.displayName!''))}</title>
            <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
            

            <#--  Styles => common and resources  -->
            <#if properties.stylesCommon?has_content>
                <#list properties.stylesCommon?split(' ') as style>
                    <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
                </#list>
            </#if>
            <#if properties.styles?has_content>
                <#list properties.styles?split(' ') as style>
                    <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
                </#list>
            </#if>
            
            <#--  Scripts => common and resources  -->
            <#if properties.scripts?has_content>
                <#list properties.scripts?split(' ') as script>
                    <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
                </#list>
            </#if>
            <#if scripts??>
                <#list scripts as script>
                    <script src="${script}" type="text/javascript"></script>
                </#list>
            </#if>
        </head>

        <body class="${properties.kcBodyClass!}">
            <div class="${properties.kcLoginClass!} ${properties.kcContainerClass!} d-flex align-items-center justify-content-center">
                        
                <#-- App-initiated actions should not see warning messages about the need to complete the action -->
                <#-- during login.                                                                               -->
               
                <#--  <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                    <div id="kc-locale">
                        <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                            <div class="kc-dropdown" id="kc-locale-dropdown">
                                <a href="#" id="kc-current-locale-link">${locale.current}</a>
                                <ul>
                                    <#list locale.supported as l>
                                        <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                                        </#list>
                                </ul>
                            </div>
                        </div>
                    </div>
                </#if>  -->

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
                    
                <#--  <#if displayMessage && message?has_content && (message.type != ' warning' || !isAppInitiatedAction??)>
                    <div
                        class="alert-${message.type} ${properties.kcAlertClass!} pf-m-<#if message.type = 'error'>danger<#else>${message.type}</#if>">
                        <div class="pf-c-alert__icon">
                            <#if message.type='success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                            <#if message.type='warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                            <#if message.type='error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                            <#if message.type='info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                        </div>
                        <span class="${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</span>
                    </div>
                </#if>                           -->

                <#--  Rendering Form  -->
                <#nested "form">
                       
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
                }
             }
              
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
