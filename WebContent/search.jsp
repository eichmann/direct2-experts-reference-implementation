<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="federation" uri="http://icts.uiowa.edu/FederationTagLib"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<c:set var="ip_address"><util:requestingHost/></c:set>
<federation:inboundSearch>
	<federation:inboundSearchSearchString searchString="${param.query}"/>
	<federation:inboundSearchSearchDateToNow/>
	<federation:inboundSearchIpAddress ipAddress="${ip_address}"/>
</federation:inboundSearch>
<c:redirect url="../research/searchResearch.jsp">
	<c:param name="query" value="${param.query}"/>
</c:redirect>