# direct2experts-reference-implementation
A JSP reference implementation for the direct2experts federated search protocol

While there are a number of implementation alternatives, I'll use XML to present representations here for human readability.

# Site Discovery

Based upon the discussion at the August 6, 2010 meeting, I am assuming that each site with share with other participating sites a bootstrap target URL that will provide the metadata characterizing that target site.  My assumption here is that we wish to minimize the complexity of information sharing by humans that is necessary and that we can accommodate evolution of the metadata characterizing a target site by periodically refreshing results from the bootstrap URL.  I propose this URL just be something along the lines of

```
<bootstrap-URL-prefix>/FS.xml
```

in the spirit of the robots.txt standard, without the requirement that the target file be at the root of the server space.  As an example, the U Iowa boostrap URL might be

> http://www.icts.uiowa.edu/Loki/FS.xml

Note that I'm not proposing that the bootstrap URL need necessarily be static, or necessarily XML, but all consuming sites must be able to process the results.
# Site Description
The response to a bootstrap URL request will be a characterization of the target site that the source site can use to both describe and interrogate the target site.  Hence we need at minimum
* A name for the target institution (text)
* An aggregate query URL to use to submit queries (text)

I'm proposing an additional, optional element of

* A URL referencing a thumbnail logo for the target institution (text)

purely for the sake of being able to pretty-up the interface.  Also note that return types are noted in italics for each element here and in subsequent material.

The institution name is clearly just an alpha-numeric string (need to worry about Unicode?).  The aggregate query URL should be comprised of two components

> <aggregate-query-URL-prefix><query-string>

Note that requiring the query string to be the last component avoids the need to deal with how to specify the syntax of the replacement variable if it were to occur at an arbitrary point in the URL.  This way, we can just concatenate the escaped query string to the end of the prefix string.

An example for U Iowa might be

> <site-description>
>    <name>University of Iowa</name>
>    <aggregate-query>http://www.icts.uiowa.edu/Loki/federation/aggregateQuery.jsp?query=</aggregate-query>
> </site-description>

Note that I'm assuming the location of the query string...
# Result Description
The response to an aggregate query URL request will be a characterization of the matching population at the target site and a link to further explore that matching population.  Hence we need
* The aggregate count (integer)
* A characterization of the matching population (e.g., faculty only, faculty and fellows, ...) (text)
* A preview construct that helps a search user assess the response - I'm proposing that this be a URL resulting in content suitable for inclusion in an i-frame element. (text)
* A search results URL which can be used to elaborate upon the nature of the aggregation response (text)

An example for U Iowa might be

> <aggregation-result>
>    <count>42</count>
>    <population-type>faculty,staff,students</population-type>
>    <preview-URL>http://www.icts.uiowa.edu/Loki/federation/searchPreview.jsp?query=<query-string></preview-URL>
>    <search-results-URL>http://www.icts.uiowa.edu/Loki/federation/search.jsp?query=<query-string></search-results-URL>
> </aggregation-result>

Note that I'm assuming here that we're encoding the initial aggregation query string into the preview and search results URLs.
