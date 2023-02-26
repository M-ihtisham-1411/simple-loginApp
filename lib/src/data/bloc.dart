import 'package:rxdart/rxdart.dart';
import 'package:simpleloginapp/src/data/validator.dart';

class Bloc extends Object with Validate {
  final _email = BehaviorSubject<String>();
  final _pass = BehaviorSubject<String>();
  Stream<String> get eemail => _email.stream.transform(emailValidate);
  Stream<String> get password => _pass.stream.transform(passValidate);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(eemail, password, (e, p) => true);
  Function(String) get emailOn => _email.sink.add;
  Function(String) get passsOn => _pass.sink.add;
  submit() {
    final emailV = _email.value;
    final passV = _pass.value;
    print('your email is $emailV');
    print('Your pass is $passV');
  }

  dispose() {
    _email.close();
    _pass.close();
  }
}

final bloc = Bloc();
