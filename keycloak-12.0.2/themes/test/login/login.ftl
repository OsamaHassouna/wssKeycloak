<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=social.displayInfo; section>
        <#if section = "title">
            <#--  ${msg("loginAccountTitle")}  -->
         ${msg("loginTitle",(realm.displayName!''))}

        <#elseif section = "form">

        <div class="card d-flex align-items-center">
            <div class="left">
                <div class="img-container"></div>
            </div>
            <div class="right">
                <div class="row">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group mb-40">
                            <div class="logo text-center">
                                <img  src="${url.resourcesPath}/img/logo.png" alt="logo">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group row mb-50">
                            <div class="col-sm-12 col-md-6 col-lg-6 text-right">
                                <a href="${url.loginUrl}" class="btn-link btn-muted pb-hover active font-weight-bold font-size-lg">${msg("login")}</a>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-6 text-left">
                                <a href="${url.registrationUrl}" class="btn-link btn-muted pb-hover font-weight-bold font-size-lg">${msg("doRegister")}</a>
                            </div>
                        </div>
                    </div>
                </div>

                <#--  Login Form  -->
                <#if realm.password>
                    <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">

                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group mb-20">
                                    <label for="username" >
                                        <#if !realm.loginWithEmailAllowed>
                                            ${msg("username")}
                                        <#elseif !realm.registrationEmailAsUsername>
                                            ${msg("usernameOrEmail")}
                                        <#else>
                                            ${msg("email")}
                                        </#if>
                                    </label>
                                    <div class="input-group">
                                        <div class="input-icon">
                                            <i class="fa fa-envelope"></i>
                                        </div>
                                        <input tabindex="1" id="username" name="username" value="${(login.username!'')}" type="text" 
                                            class='form-control' autofocus autocomplete="off" placeholder="yourmail@example.com"
                                            aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>">

                                            <#if messagesPerField.existsError('username','password')>
                                                <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                                </span>
                                            </#if>
                                        </#if>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group mb-30">
                                    <label for="password">${msg("password")}</label>
                                    <div class="input-group">
                                        <div class="input-icon font-size-sm">
                                            <i class="fa fa-lock"></i>
                                        </div>
                                        <input tabindex="2" id="password" name="password" type="password" class='form-control' placeholder="********"
                                            autocomplete="off" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>">
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group row d-flex align-items-center mb-50">
                                    <div class="col-sm-12 col-md-7 col-lg-7">
                                        <button class="btn btn-primary full-width" name="login" id="kc-login" type="submit" value="${msg('doLogIn')}">${msg('login')}</button>
                                    </div>
                                    <#if realm.rememberMe && !usernameEditDisabled??>
                                    <div class="col-sm-12 col-md-5 col-lg-5">
                                        <label class="checkbox">
                                            <#if login.rememberMe??>
                                            <input type="checkbox" checked>
                                            <#else>
                                            <input type="checkbox">
                                            </#if>
                                            <span></span>
                                            ${msg("rememberMe")}
                                        </label>
                                    </div>
                                    </#if>
                                </div>
                            </div>
                            
                            <#if realm.resetPasswordAllowed>
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group text-center">
                                    <a href="${url.loginResetCredentialsUrl}" class="btn-link text-primary">
                                        ${msg("doForgotPassword")}
                                    </a>
                                </div>
                            </div>
                            </#if>

                        </div>
                    </form>
                </#if>
                
            </div>
        </div>

    <#--  Remember me &  Forgot password & Login button  -->
    <#--  <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
        <div id="kc-form-options">
            <#if realm.rememberMe && !usernameEditDisabled??>
                <div class="checkbox">
                    <label>
                        <#if login.rememberMe??>
                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                        <#else>
                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                        </#if>
                    </label>
                </div>
            </#if>
            </div>  -->
            <#--  <div class="${properties.kcFormOptionsWrapperClass!}">
                <#if realm.resetPasswordAllowed>
                    <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                </#if>
            </div>  -->

    <#--  </div>  -->
    <#--  <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
        <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
        <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg('doLogIn')}"/>
    </div>  -->
    <#--  
        <div id="kc-form">
        <div id="kc-form-wrapper">
        
            </div>  -->
    <#--  
            <#if realm.password && social.providers??>
                <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                    <hr/>
                    <h4>${msg("identity-provider-login-label")}</h4>

                    <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                        <#list social.providers as p>
                            <a id="social-${p.alias}" class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                                    type="button" href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                    <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                                <#else>
                                    <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                                </#if>
                            </a>
                        </#list>
                    </ul>
                </div>
            </#if>  -->

        <#--  </div>  -->
        <#--  <#elseif section = "info" >
            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                <div id="kc-registration-container">
                    <div id="kc-registration">
                        <span>${msg("noAccount")} <a tabindex="6"
                                                    href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                    </div>
                </div>
            </#if>
        </#if>  -->

    </@layout.registrationLayout>
