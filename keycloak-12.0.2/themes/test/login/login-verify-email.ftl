<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("emailVerifyTitle")}
    <#elseif section = "form">

    <div class="card d-flex align-items-center p-40">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <p class="instruction">${msg("emailVerifyInstruction1")}</p>
                <#elseif section = "info">
                    <p class="instruction">
                        ${msg("emailVerifyInstruction2")}
                        <br/>
                        <a href="${url.loginAction}">${msg("doClickHere")}</a> ${msg("emailVerifyInstruction3")}
                    </p>
                </#if>
            </div>
        </div>
    </div>
</@layout.registrationLayout>