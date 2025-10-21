import 'package:flutter_test_types_implements/unit_test_folder/moc_dependencies.dart/fech_album.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'fetch_album_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("fetch album test", () {
    late MockClient mockClient;

    //this callback is called before every test
    // is to pass new object to mocClient at every test
    //this function called when there is sharing code between test functions
    setUp(() {
      mockClient = MockClient();
    });

    //callback is called after every test
    tearDown(() {});

    test("called get method on client once", () {
      when(
        mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).thenAnswer((_) async {
        return http.Response('{"userId": 1,"id": 1,"title": "Mock"}', 200);
      });

      fetchAlbum(mockClient);

      //times of call in this method
      verify(
        mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).callCount;
      // order of calling the methods
      // verifyInOrder();
      // method not called
      // verifyNever();
    });

    test('returns an album if the http call completes successfully', () async {
      when(
        mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).thenAnswer((_) async {
        return http.Response('{"userId": 1,"id": 1,"title": "Mock"}', 200);
      });

      expect(
        await fetchAlbum(mockClient),
        //type matcher
        isA<Album>()
            //type and value should be the same
            .having((album) => album.id, "id", 1)
            .having((album) => album.userId, "userId", 1)
            .having((album) => album.title, "title", "Mock"),
      );
    });

    test('throws an exception if the http call completes with an error', () {
      when(
        mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).thenAnswer((_) async {
        return http.Response('{"message error":"page not found"}', 404);
      });

      expect(fetchAlbum(mockClient), throwsException);
    });
  });
}
