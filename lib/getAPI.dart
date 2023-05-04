import 'package:http/http.dart' as http;

class getAPI {

  void myFunction() async{

    var url = Uri.parse('http://localhost:3018');
    print('Before');
    var response = await http.get(url);
    print('After');
    if (response.statusCode == 200) {
      print('Success... for now');
    }else{
      print('Some error bro!');
    }
  }
}
