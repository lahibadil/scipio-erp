<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<div class="screenlet">
    <h3>${uiLabelMap.EcommerceRequestHistory}</h3>
    <div class="screenlet-body">
        <@table>
            <@tr>
                <@td width="10%"><span style="white-space: nowrap;">${uiLabelMap.OrderRequest} ${uiLabelMap.CommonNbr}</span>
                </@td>
                <@td width="10">&nbsp;</@td>
                <@td width="10%"><span style="white-space: nowrap;">${uiLabelMap.CommonType}</span>
                </@td>
                <@td width="10">&nbsp;</@td>
                <@td width="20%">${uiLabelMap.CommonName}
                </@td>
                <@td width="10">&nbsp;</@td>
                <@td width="40%">${uiLabelMap.CommonDescription}
                </@td>
                <@td width="10">&nbsp;</@td>
                <@td width="10%">${uiLabelMap.CommonStatus}
                </@td>
                <@td width="10">&nbsp;</@td>
                <@td width="20%">
                    <div>${uiLabelMap.OrderRequestDate}</div>
                    <div>${uiLabelMap.OrderRequestCreatedDate}</div>
                    <div>${uiLabelMap.OrderRequestLastModifiedDate}</div>
                </@td>
                <@td width="10">&nbsp;</@td>
                <@td width="10">&nbsp;</@td>
            </@tr>
            <#list requestList as custRequest>
                <#assign status = custRequest.getRelatedOne("StatusItem", true)>
                <#assign type = custRequest.getRelatedOne("CustRequestType", true)>
                
                <@tr>
                    <@td>${custRequest.custRequestId}
                    </@td>
                    <@td width="10">&nbsp;</@td>
                    <@td>${type.get("description",locale)!}
                    </@td>
                    <@td width="10">&nbsp;</@td>
                    <@td>${custRequest.custRequestName!}
                    </@td>
                    <@td width="10">&nbsp;</@td>
                    <@td>${custRequest.description!}
                    </@td>
                    <@td width="10">&nbsp;</@td>
                    <@td>${status.get("description",locale)}
                    </@td>
                    <@td width="10">&nbsp;</@td>
                    <@td>
                        <div><span style="white-space: nowrap;">${custRequest.custRequestDate!}</span></div>
                        <div><span style="white-space: nowrap;">${custRequest.createdDate!}</span></div>
                        <div><span style="white-space: nowrap;">${custRequest.lastModifiedDate!}</span></div>
                    </@td>
                    <@td width="10">&nbsp;</@td>
                    <@td align="right">
                        <a href="<@ofbizUrl>/ViewRequest?custRequestId=${custRequest.custRequestId}</@ofbizUrl>" class="${styles.link_nav!} ${styles.action_view!}">${uiLabelMap.CommonView}</a>
                    </@td>
                    <@td width="10">&nbsp;</@td>
                </@tr>
            </#list>
            <#if !requestList?has_content>
                <@tr><@td colspan="9"><@commonMsg type="result-norecord">${uiLabelMap.OrderNoRequestFound}</@commonMsg></@td></@tr>
            </#if>
        </@table>
    </div>
</div>
