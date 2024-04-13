import 'package:api/model.dart';
import 'package:api/people.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Album>> futureAlbum;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum = AlbumService().getData();
  }

  @override
  Widget build(BuildContext context) {
    List items = List.generate(51, (index) => index);

    openPage() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const People()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<Album>>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('dfvv');
            } else if (snapshot.hasError) {
              return Text('ERROR ${snapshot.hasError}');
            } else {
              return const CircularProgressIndicator();
            }
          },
          future: futureAlbum,
        ),
      ),
      // ListView.builder(
      //   itemBuilder: (context, index) {
      //     var item = items[index];
      //     return Card(
      //       child: ListTile(
      //         title: Text('Item $item'),
      //         subtitle: const Text('Subtitle'),
      //         trailing: const Icon(Icons.arrow_forward_sharp),
      //         onTap: openPage,
      //       ),
      //     );
      //   },
      //   itemCount: items.length,
      //   padding: const EdgeInsets.all(10.0),
      // ),
    );
  }
}
