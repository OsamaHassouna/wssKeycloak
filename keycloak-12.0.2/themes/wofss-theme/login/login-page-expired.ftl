<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("pageExpiredTitle")}
    <#elseif section = "form">
        <div class="card card-3">
            <div class="card-body">
                <div style="text-align:center;">
                    <img src="${url.resourcesPath}/img/423_key_outline.gif" alt="logo" style="width:60px;">
                </div>
                <p id="instruction1" class="instruction">
                    ${msg("pageExpiredMsg1")} <a id="loginRestartLink" href="${url.loginRestartFlowUrl}">${msg("doClickHere")}</a> .<br/>
                    ${msg("pageExpiredMsg2")} <a id="loginContinueLink" href="${url.loginAction}">${msg("doClickHere")}</a> .
                </p>
            </div>
        </div>

        <style>
            .message-text{
                color:#FFF !important;
            }
        </style>
    </#if>
</@layout.registrationLayout>
