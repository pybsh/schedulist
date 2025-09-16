import 'package:http/http.dart' as http;
import 'dart:convert';

var url = Uri.parse(
    'https://py2m0delq4.execute-api.ap-northeast-2.amazonaws.com/default/schedulist_lambda');

Future<List> fetchBedrock(String prompt) async {
  var response = await http.post(url, body: '''
    {
      "question": "$prompt, Now: ${DateTime.now().millisecondsSinceEpoch}"
    }
  ''');

  Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
  Map<String, dynamic> answer = jsonDecode(json['answer']);
  List result = [answer['description'], answer['deadline']];
  print(result);
  return result;
}
