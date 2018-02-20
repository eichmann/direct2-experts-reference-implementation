<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="lucene" uri="http://icts.uiowa.edu/lucene"%>
<%@ taglib prefix="loki" uri="http://icts.uiowa.edu/loki"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang='en'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Loki</title>
</head>
<body>
<jsp:include page="header.jsp" flush="true" />
<c:if test="${not empty param.query}">
	<lucene:search lucenePath="/home/loki/LokiLuceneIndex" label="content" queryString="${param.query}">
		<c:set var="hitCount">
			<lucene:count />
		</c:set>
		<c:choose>
			<c:when test="${hitCount == 0}">
				<p>Sorry, no matches.</p>
			</c:when>
			<c:otherwise>
				<h3>Top 10 Search Results:</h3>
				<ul>
					<lucene:searchIterator limitCriteria="10">
						<c:set var="hitUID">
							<lucene:hit label="uid" />
						</c:set>
						<loki:investigator ID="${hitUID}">
							<li><loki:investigatorFirstName /> <loki:investigatorLastName /> (<fmt:formatNumber type="number" pattern="#.###">
								<lucene:hit label="score"></lucene:hit>
							</fmt:formatNumber>)</li>
						</loki:investigator>
					</lucene:searchIterator>
				</ul>
			</c:otherwise>
		</c:choose>
	</lucene:search>
</c:if>
</body>
</html>
