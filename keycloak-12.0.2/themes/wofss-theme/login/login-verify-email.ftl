<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    
        <#--  ${msg("emailVerifyTitle")}  -->
    <#if section = "form">       
    

        <div class="card card-3">
            <div class="card-body">
                <div style="text-align:center;">
                    <img src="${url.resourcesPath}/img/24_approved_checked_outline.gif" alt="logo" style="width:60px;">
                </div>

                <h1 class="vf-form-title-1" style="font-weight:bold; margin-bottom:30px;">
                    ${msg("emailVerifyTitle")} 
                </h1>

                <p style="font-size:16px;" class="instruction">
                    ${msg("emailVerifyInstruction1")}
                </p>

                <p style="font-size:16px;" class="instruction">
                    ${msg("emailVerifyInstruction2")}
                </p>

                <div style="text-align:center">
                    <a href="${url.loginAction}"> 
                        <button class="re-send">
                            ${msg("emailVerifyButton")}
                        </button>
                    </a>
                </div>

            </div>
        </div>

        <style>
            .message-text{
                color:#FFF !important;
            }
        </style>

    </#if>
</@layout.registrationLayout>