import 'dart:async';

class Validate {
  final emailValidate =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@') && email.contains('.')) {
      sink.add(email);
    } else {
      sink.addError('invalid');
    }
  });
  final passValidate =
      StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
    if (pass.length > 4) {
      sink.add(pass);
    } else {
      sink.addError('invalid');
    }
  });
}
