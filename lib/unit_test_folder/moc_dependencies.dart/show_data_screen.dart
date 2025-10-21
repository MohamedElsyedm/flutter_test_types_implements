import 'package:flutter/material.dart';
import 'package:flutter_test_types_implements/unit_test_folder/moc_dependencies.dart/fech_album.dart';
import 'package:http/http.dart' as http;

class ShowDataScreen extends StatelessWidget {
  const ShowDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: FutureBuilder<Album>(
            future: fetchAlbum(http.Client()),
            builder: (context, snapShot) {
              if (snapShot.hasData && snapShot.data != null) {
                Album album = snapShot.data!;
                return Card(
                  child: ListTile(
                    title: Text(album.title),
                    subtitle: Text('User Id : ${album.userId}'),
                    leading: Text("${album.id}"),
                  ),
                );
              } else if (snapShot.hasError) {
                return Text("${snapShot.error}");
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
