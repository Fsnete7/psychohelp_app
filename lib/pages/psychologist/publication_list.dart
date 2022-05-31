import 'package:flutter/material.dart';
import 'package:psychohelp_app/models/publication.dart';
import 'package:psychohelp_app/utils/http_helper.dart';

class PublicationList extends StatefulWidget {
  @override
  State<PublicationList> createState() => _PublicationListState();
}

class _PublicationListState extends State<PublicationList> {
  List publications = [];
  HttpHelper httpHelper = HttpHelper();

  @override
  void initState() {
    publications = [];
    httpHelper = HttpHelper();
    fetchPublications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: publications.length,
      itemBuilder: (context, index) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Center(
                child: Column(
              children: [
                PublicationRow(publication: publications[index]),
              ],
            )));
      },
    );
  }

  void fetchPublications() {
    httpHelper.fetchPublications().then((value) {
      setState(() {
        this.publications = value;
      });
    });
  }
}

class PublicationRow extends StatelessWidget {
  final Publication publication;
  const PublicationRow({Key? key, required this.publication}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        child: Column(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            child: Image.network(
              publication.photoUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 5),
          Text(publication.title,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          // Padding(
          //     padding: const EdgeInsets.all(8.8),
          //     child: Text(publication.title)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(publication.description, textAlign: TextAlign.justify),
          ),
        ]),
      ),
    );
  }
}
