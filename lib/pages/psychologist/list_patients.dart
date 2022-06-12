import 'package:flutter/material.dart';
import 'package:psychohelp_app/utils/http_helper.dart';
import 'package:psychohelp_app/models/patient.dart';

class List_patients extends StatefulWidget {
  static const String routeName = "/list_patients";
  @override
  State<List_patients> createState() => _List_patientsState();
}

class _List_patientsState extends State<List_patients> {
  List patients = [];
  HttpHelper httpHelper = HttpHelper();

  @override
  void initState() {
    patients = [];
    httpHelper = HttpHelper();
    fetchPatients();
    super.initState();
  }

  void fetchPatients() {
    httpHelper.fetchPatientsByPsychologistId(1).then((value) {
      setState(() {
        this.patients = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("List of Patients"),
      ),
      body: new Container(
        child: new ListView.builder(
          itemCount: patients.length,
          itemBuilder: (context, index) {
            return PatientRow(patient: patients[index]);
          },
        ),
      ),
    );
  }
}

class PatientRow extends StatelessWidget {
  final Patient patient;
  const PatientRow({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin:
            EdgeInsetsDirectional.only(top: 20, bottom: 15, start: 75, end: 75),
        child: new InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/logbook_psycho", arguments: patient);
          },
          child: Column(children: <Widget>[
            Container(
                margin: EdgeInsetsDirectional.only(
                    top: 10, bottom: 10, start: 30, end: 30),
                child: Image.network(patient.img)),
            Text(patient.firstName),
            Text(patient.lastName),
          ]),
        ));
  }
}
