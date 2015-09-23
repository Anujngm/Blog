import com.Role
import com.User
import com.UserRole

class BootStrap {

    def init = {

        User user1=new User()
        user1.username="author1"
        user1.password="pass1"
        user1.save(flush:true)
        User user2=new User()
        user2.username="author2"
        user2.password="pass2"
        user2.save(flushs:true)
        User user3=new User()
        user3.username="max"
        user3.password="max"
        user3.save(flush:true)

        Role roleAuthor=new Role(authority: "ROLE_AUTHOR").save(flush:true )
        Role roleAdmin=new Role(authority: "ROLE_ADMIN").save(flush:true )

        UserRole.create(user1,roleAuthor,false).save(flush: true)
        UserRole.create(user2,roleAuthor,false).save(flush: true)
        UserRole.create(user3,roleAdmin,false).save(flush: true)


    }
    def destroy = {
    }
}
