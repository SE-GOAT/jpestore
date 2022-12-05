<%--
       Copyright 2010-2022 the original author or authors.
       Licensed under the Apache License, Version 2.0 (the "License");
       you may not use this file except in compliance with the License.
       You may obtain a copy of the License at
          https://www.apache.org/licenses/LICENSE-2.0
       Unless required by applicable law or agreed to in writing, software
       distributed under the License is distributed on an "AS IS" BASIS,
       WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
       See the License for the specific language governing permissions and
       limitations under the License.
--%>
<%@ include file="../common/IncludeTop.jsp"%>

<jsp:useBean id="catalog"
             class="org.mybatis.jpetstore.web.actions.AccountActionBean"/>
<div id="BackLink"><stripes:link
        beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
        event="viewProductListByAdmin">
    <stripes:param name="username" value="${sessionScope.accountBean.username}" />
    Return Back
</stripes:link></div>
<br>
<br>
<h1 style="text-align: center">
    USER REQUEST
</h1>
<c:choose>
    <c:when test="${sessionScope.accountBean.account.admin}">
        <div id="Catalog">
            <table>
                <thead>
                <tr>
                    <th>Writer</th>
                    <th>Title</th>
                    <th>Parent Category</th>
                    <th>SubCategory</th>
                    <th>Writing Date</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="request" items="${actionBean.userRequests}">
                <tr>
                    <td>
                            ${request.username}
                    </td>
                    <td>
                        <stripes:link
                                beanclass="org.mybatis.jpetstore.web.actions.AccountActionBean"
                                event="viewUserRequestContentByAdmin">
                            <stripes:param name="account.writingDate" value="${request.writingDate}" />
                            <stripes:param name="account.title" value="${request.title}" />
                            <stripes:param name="username" value="${request.username}" />
                            <stripes:param name="account.parentCategory" value="${request.parentCategory}" />
                            <stripes:param name="account.content" value="${request.content}" />
                            <stripes:param name="account.subCategory" value="${request.subCategory}" />
                            ${request.title}
                        </stripes:link>
                    </td>
                    <td>
                            ${request.parentCategory}
                    </td>
                    <td>
                            ${request.subCategory}
                    </td>
                    <td>
                            ${request.writingDate}
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:when>
    <c:otherwise>
        <%@ include file="../common/AccessRestriction.jsp"%>
    </c:otherwise>
</c:choose>


<%@ include file="../common/IncludeBottom.jsp"%>
