<?xml version="1.0" encoding="UTF-8"?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="message" uri="http://icts.uiowa.edu/message"%>
<%@ taglib prefix="federation" uri="http://icts.uiowa.edu/FederationTagLib"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="lucene" uri="http://icts.uiowa.edu/lucene"%>
<%@ page contentType="text/xml" %>
<c:set var="ip_address"><util:requestingHost/></c:set>
<federation:inboundQuery>
	<federation:inboundQueryQueryString queryString="${param.query}"/>
	<federation:inboundQueryQueryDateToNow/>
	<federation:inboundQueryIpAddress ipAddress="${ip_address}"/>
</federation:inboundQuery>
<c:if test="${not empty param.query}">
	<lucene:search lucenePath="/home/loki/LokiLuceneIndex" label="content" queryString="${param.query}">
<aggregation-result>
	<count><lucene:count/></count>
	<population-type>faculty,staff,students</population-type>
	<c:set var="previewURL"><util:applicationPath/>/federation/searchPreview.jsp</c:set>
	<c:url var="preview" value="${previewURL}">
		<c:param name="query" value="${param.query}"/>
	</c:url><preview-URL><c:out value="${preview}"/></preview-URL>
	<c:set var="resultURL"><util:applicationPath/>/federation/search.jsp</c:set>
	<c:url var="searchResult" value="${resultURL}">
		<c:param name="query" value="${param.query}"/>
	</c:url><search-results-URL><c:out value="${searchResult}"/></search-results-URL>
</aggregation-result>
	</lucene:search>
</c:if>
