
import 'package:get/get.dart';

class Languages extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US' : {
      'message': 'What is your name',
      'name': 'Dilip'
    },
    'hi_IN' : {
      'message': 'आपका नाम क्या  है',
      'name': 'दिलीप'
    },

  };
}