package pl.ksw_stats.user;


public interface UserService {

    User findByUserName(String name);
    User findByUserNameEnable(String name);
    void saveUser(User user);

}
