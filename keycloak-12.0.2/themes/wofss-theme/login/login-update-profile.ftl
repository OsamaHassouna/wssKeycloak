<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("loginProfileTitle")}
    <#elseif section = "form">
        <div class="card card-3">
            <div class="card-body">
                <div style="text-align:center;">
                    <img src="${url.resourcesPath}/img/21_avatar_outline.gif" alt="logo" style="width:60px;">
                </div>

                <form id="kc-update-profile-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <#if user.editUsernameAllowed>
                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="text" id="username" name="username" value="${(user.username!'')}" class="${properties.kcInputClass!} input--style-3 input-width"/>
                            </div>
                        </div>
                    </#if>
                    <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="text" id="email" name="email" value="${(user.email!'')}" class="${properties.kcInputClass!} input--style-3 input-width" />
                        </div>
                    </div>

                    <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="text" id="firstName" name="firstName" value="${(user.firstName!'')}" class="${properties.kcInputClass!} input--style-3 input-width" />
                        </div>
                    </div>

                    <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input type="text" id="lastName" name="lastName" value="${(user.lastName!'')}" class="${properties.kcInputClass!} input--style-3 input-width" />
                        </div>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                            <div class="${properties.kcFormOptionsWrapperClass!}">
                            </div>
                        </div>

                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <#if isAppInitiatedAction??>
                            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!} wss-btn" type="submit" value="${msg("doSubmit")}" />
                            <button class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!} wss-btn" type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
                            <#else>
                            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} wss-btn" type="submit" value="${msg("doSubmit")}" />
                            </#if>
                        </div>
                    </div>
                </form>

            </div>
        </div>

        <style>
            .message-text{
                color:#FFF !important;
            }
        </style>
    </#if>
</@layout.registrationLayout>
