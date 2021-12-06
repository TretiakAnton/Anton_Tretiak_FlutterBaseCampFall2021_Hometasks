import 'package:campnotes/widgets/auth_firebase.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
    // do something before test start
  });

  setUpAll(() {
    // do something once before all test start
  });

  tearDown(() {
    // do something after test finish
  });

  tearDownAll(() {
    // do something after all test finish
  });

  test('Short Email Test', () {
    var result =
        AuthenticationWrapper().checkUser(email: 'mail', password: 'passsword');
    expect(result, 'too short email');
  });

  test('Empty Data Test', () {
    var result = AuthenticationWrapper().checkUser(email: '', password: '');
    expect(result, 'please enter your data again');
  });

  test('Good Data Test', () {
    var result = AuthenticationWrapper()
        .checkUser(email: 'myEmail123', password: 'myGoodPassword');
    expect(result, 'all good');
  });
}
