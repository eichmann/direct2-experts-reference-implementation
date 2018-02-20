<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="federation" uri="http://icts.uiowa.edu/FederationTagLib"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang='en'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search for Investigators at Multiple Institutions</title>
<style type="text/css" media="all">
@import "../resources/layout.css";
</style>
</head>
<body>
<div id="content"><jsp:include page="../header.jsp" flush="true" /> <jsp:include page="../primarynav.jsp" flush="true" /> <jsp:include page="../menu.jsp" flush="true">
	<jsp:param name="caller" value="research" />
</jsp:include>
<div id="centerCol"><a id="main-content"></a>
<h1>Search for Investigators at Multiple Institutions</h1>
<form method='POST' action='federatedSearch.jsp'><input name="query" value="${param.query}" size=50> <input type=submit name=submitButton value=Search></form>

<c:if test="${not empty param.query}">
	<br/>
	<hr>
	<br/>
	<h3>Search Results:</h3>
	<p><federation:outboundQuery>
		<federation:outboundQueryQueryString queryString="${param.query}" />
		<federation:outboundQueryQueryDateToNow />
		<federation:FederatedSearch />
		<table>
			<tr>
				<th>Institution</th>
				<th>Population Type</th>
				<th>Person Count</th>
				<th>Institution Preview</th>
			</tr>
			<federation:foreachResponse var="x" sortCriteria="response_date">
				<federation:response>
					<c:if test="${federation:responseHitCountValue() > 0}">
						<federation:site sid="${federation:responseSidValue()}">
							<tr>
								<td><a href="clickThrough.jsp?sid=<federation:responseSid />&qid=<federation:responseQid />"><federation:siteName /></a></td>
								<td width="30%"><a href="clickThrough.jsp?sid=<federation:responseSid />&qid=<federation:responseQid />"><federation:responsePopulationType /></a></td>
								<td><a href="clickThrough.jsp?sid=<federation:responseSid />&qid=<federation:responseQid />"><federation:responseHitCount /></a></td>
								<td><iframe src="<federation:responsePreviewUrl/>" width="100%" height="150">
								<p>Your browser does not support iframes.</p>
								</iframe></td>
							</tr>
						</federation:site>
					</c:if>
				</federation:response>
			</federation:foreachResponse>
		</table>
	</federation:outboundQuery>
</c:if> <br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<jsp:include page="../footer.jsp" flush="true" /></div>
</div>
</body>
</html>
