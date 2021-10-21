import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/Resultspage/screens/results.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/quiz_screen.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/widget/button_widget.dart';

import '../../../../rounded_button.dart';


import 'api/firebase_api.dart';



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp();
  runApp(FinancialPage());
}


class FinancialPage extends StatelessWidget {
  static final String title = 'Document Upload';


  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.green),
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  UploadTask task;
  File file;

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file.path) : 'No File Selected';


    return Scaffold(
      appBar: AppBar(
        title: Text(FinancialPage.title),
        centerTitle: true,

      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/SA_Adoption_system.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "FINANCIAL DOCUMENTS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 48),
              ButtonWidget(
                text: 'Select File',
                icon: Icons.attach_file,
                onClicked: selectFile,
              ),
              SizedBox(height: 8),
              Text(
                fileName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 48),
              ButtonWidget(
                text: 'Upload File',
                icon: Icons.cloud_upload_outlined,
                onClicked: uploadFile,
              ),
              SizedBox(height: 20),
              task != null ? buildUploadStatus(task) : Container(),

              SizedBox(height: 20),
              RoundedButton(
                text: "SUBMIT",
                color: Colors.green,
                press: () {mail();
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file);
    setState(() {});

    if (task == null) return;

    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) =>
      StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );

  mail() async {
    String username = 'masegopreciousmmotlana@gmail.com';
    String password = 'Masego@0746461009';

    final smtpServer = gmail(username, password);


    // Create message.
    final message = Message()
      ..from = Address(username, 'Catholic womans league adoption agency')
      ..recipients.add('masegopreciousmmotlana@gmail.com')
      ..ccRecipients.addAll([
        'masegopreciousmmotlana@gmail.com',
        'masegopreciousmmotlana@gmail.com'
      ])
      ..bccRecipients.add(Address('masegopreciousmmotlana@gmail.com'))
      ..subject = 'APPLICANT:  ${DateTime.now()}'
      ..text = 'An applicant has answered and uploaded the required documents'
      ..html = "<h1>Good Day</h1>\n<p>An applicant has answered and uploaded the required documents.Login the dashboard to see more details.\n Kind regards,\n SA Adoption System</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
