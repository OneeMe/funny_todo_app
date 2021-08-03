import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'login_test.mocks.dart';

import 'package:todo_list/model/network_client.dart';

@GenerateMocks([http.Client])
void main() {
  test('LoginOperation', () async {
    MockClient client = MockClient();

    when(client.post(
      any,
      body: anyNamed('body'),
      headers: anyNamed('headers'),
    )).thenAnswer(
      (_) async => http.Response(
        '{"error":"","data":{"userId":"1"}}',
        200,
      ),
    );

    NetworkClient.instance().client = client;

    expect(await NetworkClient.instance().login('username', 'password'), '');
  });
}
