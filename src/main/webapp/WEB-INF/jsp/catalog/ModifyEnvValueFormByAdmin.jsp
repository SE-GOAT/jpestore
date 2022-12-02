<%--
  Created by IntelliJ IDEA.
  User: simjonghan
  Date: 2022/12/02
  Time: 11:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../common/IncludeTop.jsp"%>
<jsp:useBean id="catalog"
             class="org.mybatis.jpetstore.web.actions.CatalogActionBean"/>
<c:choose>
  <c:when test="${sessionScope.accountBean.account.admin}">
    <div id="Catalog"
         beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean">
      <h2 style="text-align: center">${actionBean.product.name}</h2>
      <h3 style="text-align: center">${actionBean.envColumnName}</h3>
      <p style="text-align: center; color: deeppink">Enter values to modify</p>
      <stripes:form name="test" beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean">
        <table>
          <tr>
            <c:forEach var="productEnvValueList"
                       items="${actionBean.productEnvValueList}">
              <th style="text-align: center">
                  ${productEnvValueList.envValue}
              </th>
            </c:forEach>
          </tr>
          <tr>
            <c:forEach var="productEnvValueList"
                       items="${actionBean.productEnvValueList}">
              <td><stripes:text name="productEnvValueList.envValue" /></td>
            </c:forEach>
          </tr>
        </table>
        <stripes:submit name="modifyEnvValuesByAdmin" value="Submit" />
      </stripes:form>
    </div>
  </c:when>
  <c:otherwise>
    <%@ include file="../common/AccessRestriction.jsp"%>
  </c:otherwise>
</c:choose>
<%@ include file="../common/IncludeBottom.jsp"%>
