package blogger

import com.Role
import com.User
import com.UserRole
//import grails.converters.JSON
//import org.apache.http.auth.Credentials
//
//import org.apache.http.auth.Credentials
import org.springframework.security.access.annotation.Secured
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.core.AuthenticationException
import org.springframework.security.core.context.SecurityContext
import org.springframework.security.core.context.SecurityContextHolder

//import javax.security.auth.login.CredentialException
import javax.servlet.http.HttpSession
import java.security.Principal

class ArticlesController{
    def springSecurityService
    def passwordEncoder
    @Secured('permitAll')
    def index() { }


    @Secured('permitAll')
    def showArticle(){
        Articles articles=Articles.findById(params.articleId)
        Long id=params.articleId as long
     def commentsList=Comments.findAllByArticleId(id)
        println(commentsList.toString())
        [articleToDispaly:articles,commentToDisplay:commentsList]
    }


    @Secured(['ROLE_ADMIN','ROLE_AUTHOR'])
    def editPage()
    {def id=params.id
//        println("adit page action")
       Articles article=Articles.findById(params.id)
        [articleToshow:article,articleId:params.id]
    }

    @Secured('permitAll')
    def checkFbAccount()
    {String username=params.username
        //println("checking")
        User user2=User.findByUsername(username)
        if(user2)
        {
            springSecurityService.reauthenticate(user2.username,user2.password)
           // println("logged in")
            User user=springSecurityService.currentUser as User
//            println(user.getAuthorities())
        }
//        println("inside action")
//        println(user2)
        String str
        if(user2==null)
        str="success"
        else
            str="fail"
        render "${str}"
    }

    @Secured('permitAll')
    def saveComment()
    {  // articleId:${articleToDispaly.id},commentPersonName:$scope.personName,comment:$scope.comment}
        println("inside controller")
        println(params.articleId)
        println(params.commentPersonName)
        println(params.comment)
        Comments comments=new Comments()
        comments.articleId=params.articleId as long
        comments.commentPersonName=params.commentPersonName
        comments.comment=params.comment
        comments.save(flush: true)
        String str
            str="success"
        render "${str}"
    }

    @Secured(['ROLE_ADMIN','ROLE_AUTHOR'])
    def saveEditPage()
    {
        String tempTitleToSave=params.article_title
        String articleToSave= params.article
        String c=tempTitleToSave[0]
        tempTitleToSave=tempTitleToSave.replaceFirst(c,c.toUpperCase())
        Articles articles=Articles.findById(params.id)
        articles.articleTitle="${tempTitleToSave}"
        articles.article="${articleToSave}"
        articles.save(flush: true)
        redirect(uri: "/articles/listPage")
    }
    @Secured('permitAll')
    def saveAndLogingFb()
    {
String username=params.username
String password=params.password
        User new_user=new User()
        if(new_user)
        {   new_user.username=username
            new_user.password=password
            new_user.save(flush:true)
            Role roleAuthor=Role.findByAuthority("ROLE_AUTHOR")
            UserRole.create(new_user,roleAuthor,true)
            springSecurityService.reauthenticate(new_user.username.trim(),new_user.password.trim())
        }
        render new_user
      }

    @Secured(['ROLE_ADMIN','ROLE_AUTHOR'])
    def listPage()
    {
        User user=springSecurityService.currentUser as User
        println("list page action")
        def data = Articles.createCriteria()
        def dataToSend = data.list {}
       [articlesInfo:dataToSend,userId:user.getId()]
    }
    @Secured('permitAll')
    def deleteRecordByAjax(Long id)
   {
       Articles articles=Articles.findById(id)
       articles.delete(flush: true)
       render "${id}"

   }

    @Secured('permitAll')
    def deleteRecord()
    {
        Articles articles=Articles.findById(params.id)
        articles.delete(flush: true)
        redirect(uri: "/articles/listPage")
    }
    @Secured('permitAll')
    def home()
    {
        redirect(uri: "/")
    }

    @Secured(['ROLE_ADMIN','ROLE_AUTHOR'])
    def createPage()
{
}
    def date
    @Secured(['ROLE_ADMIN','ROLE_AUTHOR'])
    def saveArticle()
{   String tempTitleToSave=params.article_title
    String articleToSave= params.article
    String c=tempTitleToSave[0]
    tempTitleToSave=tempTitleToSave.replaceFirst(c,c.toUpperCase())
    User user=springSecurityService.currentUser as User
    Articles articles=new Articles()
    articles.articleTitle="${tempTitleToSave}"
    articles.article="${articleToSave}"
    articles.articleAuthorName="${user.getUsername()}"
    articles.articleAuthorId=user.getId()
    if(articles.validate()){
        articles.save(flush: true)
    }
    else {
        articles.errors.each {
        println(it)
        }
    }
    redirect(uri: "/")
    println("saving article")
}

}
