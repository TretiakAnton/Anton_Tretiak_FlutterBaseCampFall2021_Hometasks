import 'package:campnotes/widgets/auth_firebase.dart';
import 'package:test/test.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  test('Empty Email Test', () {
    var result = ;
    expect(result, 'Enter Email!');
  });

  test('Invalid Email Test', () {
    var email = 'mail'; var pass ='pass';
    var result = context.read<AuthenticationService>().signUp(
        email: email,
        password:pass);
    expect(result, 'Enter Valid Email!');
  });

  test('Valid Email Test', () {
    var result = FieldValidator.validateEmail('ajay.kumar@nonstopio.com');
    expect(result, null);
  });
}
