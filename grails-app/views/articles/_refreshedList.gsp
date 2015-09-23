<g:each in="${articlesInfo}" var="article">
    <tr id="article_${article?.id}">
        <td id="td_${article?.id}">${article.id}</td>
        <td id="td2">${article.dateCreated.getDateString()}</td>
        <td id="td3">${article.articleAuthorName}</td>
        <td id="td4">${article.articleTitle}</td>
        <sec:ifAnyGranted roles="ROLE_AUTHOR">
            <g:if test="${userId == article.articleAuthorId}">
                <td><a id="edit_author"  style="color: green" href="${createLink(controller: "articles", action: "editPage", params: [id: article.id])}">Edit</a>
               &nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" class="delete" onclick="deleteByAjax('${article.id}')" style="color: green">Delete</a>
            </g:if>
            <g:else>

                <td><a id="edit_author_other" style="color: red" href="javascript:void(0);">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="delete" style="color: red" href="javascript:void(0);">Delete</a></td>
            </g:else>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles="ROLE_ADMIN">
            <td>
            <td><a id="edit_admin" style="color: green"
                   href="${createLink(controller:"articles", action: "editPage", params: [id:article.id])}">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:void(0)" class="delete" onclick="deleteByAjax('${article.id}')" style="color: green">Delete</a></td>
        </sec:ifAnyGranted>
    </tr>
</g:each>