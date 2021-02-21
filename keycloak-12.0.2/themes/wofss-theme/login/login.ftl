<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "title">
${msg("loginTitle",(realm.displayName!''))}
<#elseif section = "header">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<script></script>
<#elseif section = "form">
<div class="card card-3">
<div class="card-heading" style="background: url('${url.resourcesPath}/img/1.jpg') top left/cover no-repeat;"></div>
<#if realm.password>
<div class="card-body">
<div style="text-align:center;">
   <img  src="${url.resourcesPath}/img/logo.svg" alt="logo" style="height:80px;">
</div>
<h2 class="title" style="text-align:center;">${msg("doLogIn")}</h2>
<p class="desc"> ${msg("WelcomeLogIn")} </p>
<form id="kc-form-login" class="form form1"  onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
   <div class="input-group">
      <label>${msg("username")}</label>
      <div>
         <input id="username" class="input--style-3 input-width" type="text" name="username">
      </div>
   </div>
   <div class="input-group">
      <label>${msg("password")}</label>
      <div>
         <input class="input--style-3 input-width" id="txtPassword" type="password" name="password">                       
      </div>
   </div>
   <#if realm.rememberMe && !usernameEditDisabled??>
   <div class="checkbox">
      <label>
      <#if login.rememberMe??>
      <input id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
      <#else>
      <input id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
      </#if>
      </label>
   </div>
   <div class="forget-password" style="margin-top: -25px">
      <#if realm.resetPasswordAllowed>
      <span><a style="color:#e6186d;"  href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
      </#if>  
   </div>
   </#if>  
   <div class="p-t-20 p-b-20" style="text-align:center;">
      <button class="submit" value="${msg('doLogIn')}" type="submit">${msg("doSubmit")}</button>
   </div>
</form>
</#if>
<#if social.providers??>
<div id="social-providers" style="text-align:center;">
   <p><span style="text-align:center;"> or Login With </span></p>
</div>
<#list social.providers as p>
<div style="display: flex; margin-left:20px;">
   <input class="${p.displayName}" 
      style="margin-left:10;margin-right: 10"
      type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
   </#list>
</div>
</#if>
<div style="margin-top:40px;text-align:center">
   <span style="text-size:16px;">${msg("donotHaveAccount")}</span>
   <a href="${url.registrationUrl}" style="color:#e6186d;">${msg("doRegister")}</a>
   <div>
   </div>
</div>
</#if>
</@layout.registrationLayout>