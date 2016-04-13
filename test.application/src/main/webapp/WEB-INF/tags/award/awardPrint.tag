<%--
  ~ Copyright (c) 2014. Boston University
  ~
  ~ Licensed under the Educational Community License, Version 2.0 (the "License"); you may not use this
  ~ file except in compliance with the License. You may obtain a copy of the License at
  ~
  ~ http://www.opensource.org/licenses/ecl1.php
  ~
  ~ Unless required by applicable law or agreed to in writing, software distributed under the License is
  ~ distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND either express or
  ~ implied.
  ~
  ~ See the License for the specific language governing permissions and limitations under the License.
  --%>

<%-- member of AwardActions.jsp --%>

<script language="javascript"
        src="dwr/interface/AwardTransactionLookupService.js"></script>
<style type="text/css">
    .multi-col-list dl {
        clear: both;
        margin: .5em;
        width: 100%;
        min-width: 38em;
    }

    .multi-col-list dl dd {
        width: 32%;
        float: left;
        padding-left: 0px;
        margin: 0;
        margin-bottom: 1em;
        padding-right: .2em;
    }

    .multi-col-list dl dd ul {
        list-style: none;
        padding: 0;
    }

    .multi-col-list dl dd ul li {
        list-style: none;
    }

    table.gridtable {
        font-family: verdana, arial, sans-serif;
        font-size: 11px;
        color: #333333;
        border-width: 1px;
        border-color: #666666;
        border-collapse: collapse;
    }

    table.gridtable th {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #666666;
        background-color: #dedede;
    }

    table.gridtable td {
        text-align: center;
        vertical-align: middle;
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #666666;
        background-color: #ffffff;
    }
</style>
<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp" %>

<c:set var="awardPrintAttributes"
       value="${DataDictionary.AwardPrint.attributes}"/>
<c:set var="awardPrintNoticeAttributes"
       value="${DataDictionary.AwardPrintNotice.attributes}"/>
<c:set var="awardTransactionSelectorAttributes"
       value="${DataDictionary.AwardTransactionSelectorBean.attributes}"/>
<c:set var="awardAmountTransactionAttributes"
       value="${DataDictionary.AwardAmountTransaction.attributes}"/>
<c:set var="award" value="${KualiForm.document.award}"/>

<%-- BUKC-0021: Add BU's Award Notification --%>
<c:set var="timeAndMoneyDocs"
       value="${KualiForm.timeAndMoneyInfoForPrintNotice}"/>
<c:set var="count" value="0" scope="page"/>
<script>
    function clearErrorsBeforePrint() {
        // If an error occurred prevsiously, clear them prior to attempting pdf download
        jQuery(".left-errmsg").empty();
        jQuery("#tab-DataValidation-div").empty();
    }
</script>

<script>
    function checkCheckboxes(id, pID) {
        var checked = jQuery('#' + id).is(':checked');
        jQuery('#' + pID).find(':checkbox').each(function () {
            jQuery(this).attr('checked', checked);
        });
    }
</script>

<%-- kra:section permission="viewAward" --%>
<kul:tab defaultOpen="false" tabTitle="Print"
         tabErrorKey="awardTimeAndMoneyTransactionReport.*">
    <div class="tab-container" align="center">
        <h3>
            <span class="subhead-left">Print</span>
            <!-- <span class="subhead-right"><kul:help businessObjectClassName="org.kuali.kra.award.contacts.AwardUnitContact" altText="help"/></span>-->
        </h3>
        <table id="print-table" cellpadding="0" cellspacing="0"
               summary="Print Options">
            <tr>
                <th scope="row" style="width: 150px; text-align: left;">Award
                    Notice
                </th>
                <td style="padding: 5px;">
                    <div id="awardPrintNoticeItems">
                        <table class="gridtable">
                            <tr>
                                    <%-- BU Customization Starts --%>
                                <td><label> <input type="checkbox"
                                                   id="checkall" value="1"
                                                   onclick="checkCheckboxes(this.id, 'awardPrintNoticeItems');">
                                </label></td>
                                <th>Time & Money Doc #</th>
                                <th>Transaction Type</th>
                                <th>Date</th>
                                <th>Comments</th>
                            </tr>

                            <c:forEach items="${timeAndMoneyDocs}" var="timeAndMoneyDoc">
                                <c:set var="count" value="${count + 1}" scope="page"/>
                                <tr>
                                    <td><html:checkbox
                                            property="awardPrintNotice.timeAndMoney${count}"/>
                                    <td><u> <a
                                            href="${ConfigProperties.application.url}/timeAndMoney.do?methodToCall=docHandler&docId=${timeAndMoneyDoc.documentNumber}&command=displayDocSearchView"
                                            target="_blank">${timeAndMoneyDoc.documentNumber}</a> <html:hidden
                                            property="awardPrintNotice.timeAndMoneyDocNumber${count}"
                                            value="${timeAndMoneyDoc.documentNumber}"/>
                                    </u></td>
                                    <td>
                                            ${timeAndMoneyDoc.awardAmountTransactions[0].awardTransactionType.description}
                                    </td>
                                    <td>${timeAndMoneyDoc.updateTimestamp}</td>
                                    <td>${timeAndMoneyDoc.documentHeader.documentDescription}
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </td>
                <td class="infoline" style="text-align: center;"><html:image
                        property="methodToCall.printNotice"
                        src='${ConfigProperties.kra.externalizable.images.url}tinybutton-print.gif'
                        alt="Print Award Notice" styleClass="tinybutton"
                        onclick="clearErrorsBeforePrint(); excludeSubmitRestriction=true"/></td>
            </tr>
        </table>
    </div>
</kul:tab>
