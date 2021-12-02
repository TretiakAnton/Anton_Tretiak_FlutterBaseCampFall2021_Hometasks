// @dart=2.12
import 'package:floor/floor.dart';

@entity
class User {
  @primaryKey
  String mail;
  String password;

  User(this.mail, this.password);
}

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> findAllUsers();

  @Query('SELECT * FROM User WHERE mail = :mail')
  Future<User?> findUserByMail(String mail);

  @insert
  Future<void> insertPerson(User user);
}
