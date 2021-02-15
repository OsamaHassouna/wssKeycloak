<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
    
        <div id="kc-error-message">
            <div class="page-wrapper bg-gra-01">
                <div class="wrapper wrapper--w780">
                    <div class="card card-3">
                        <div class="card-body">
                            <div style="text-align:center;">
                                <img src="${url.resourcesPath}/img/alert.svg" alt="logo" style="width:60px;">
                            </div>
                            <#--  <h2 class="title" style="text-align:center;">  </h2>  -->
                            <p class="desc instruction">${message.summary}</p>
                            <#if client?? && client.baseUrl?has_content>
                                <p><a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                            </#if>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <style>
            .wofss-lang-switcher{
                display:none;
            }

            .page-wrapper{
                min-height: 100% !important;
            }
        </style>

    </#if>
</@layout.registrationLayout>