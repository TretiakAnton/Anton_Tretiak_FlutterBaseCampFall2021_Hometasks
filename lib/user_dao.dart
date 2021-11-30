import 'package:floor/floor.dart';

class User {
  @primaryKey
  final String mail;
  final String password;

  User(this.mail, this.password);
}

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> findAllUsers();

  @Query('SELECT * FROM User WHERE mail = :mail')
  Stream<User> findUserByMail(String mail);

  @insert
  Future<void> insertPerson(User user);
}

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
