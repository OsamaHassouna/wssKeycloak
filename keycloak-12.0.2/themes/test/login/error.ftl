<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
        <div class="card d-flex align-items-center p-40">
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <p class="instruction">${message.summary?no_esc}</p>
                    <#if client?? && client.baseUrl?has_content>
                        <p><a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                    </#if>
                </div>
            </div>
        </div>

        <#--  <div id="kc-error-message">
        </div>  -->
    </#if>
</@layout.registrationLayout>