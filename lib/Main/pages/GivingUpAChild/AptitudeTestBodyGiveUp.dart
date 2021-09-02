import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../rounded_button.dart';
import 'Financial PageGiveUp.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/background2.dart';
import 'package:link/link.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:flutter/src/material/colors.dart';


class AptitudeTestBodyGiveUp extends StatelessWidget with NavigationStates {

  @override
  Widget build(BuildContext context) {
    return Background(

      child: Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
            child: Column(
          children: [
            Text(
              "PARENT AND GUARDIAN QUESTIONS AND INSTRUCTIONS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              " ",
            ),
            Text(
              "Children's Act [No. 38 of 2005]",
              style: TextStyle(fontWeight: FontWeight.bold),

            ),
            Text(
              " ",
            ),
            Text(
              "TThe Children's Act is there to protect you and to make sure that you are taken care of, no matter who you are, where you live and who takes care of you.” The Act is there to help keep families together and make sure a child is cared for by family or parents, or is placed in alternative care when there is no family.",
            ),
            Text(
              " ",
            ),
            Text(
              "If you are a parent or guardian of the child, complete Form 61, consent must be given by the parent or guardian to the adoption of a child.If you are a child that is 10 years of age or older, complete Form 62.",
            ),
            Text(
              " ",
            ),

            Link(
              child: Text('Click here to download Childrens Act Document ',
                style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
              ),
              url: 'https://www.westerncape.gov.za/service/giving-child-adoption',
            ),
            Text(
              " ",
            ),
            Text(
              " Consent ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Both the mother and the father must consent to allow the adoption by a specific person or persons. If the child is 10 years and older, the child must also consent to the adoption. ",
            ),
            Text(
              " ",
            ),
            Text(
              "Consent is given in the following way:",
              style: TextStyle(fontWeight: FontWeight.bold),

            ),

            Text(
              " ",
            ),
            Text(
              "If you are a parent or guardian of the child, complete Form 61, consent must be given by the parent or guardian to the adoption of a child.If you are a child that is 10 years of age or older, complete Form 62.",
             ),
            Text(
              " ",
            ),


            Link(
              child: Text('Click here to download Form 61 and 62',
                  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
              ),
              url: 'https://www.justice.gov.za/forms/form_cj.html',
            ),
            /*PDF.assets(
              "assets/ChildrensCourtRules AnnexureC Forms.pdf",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              placeHolder: Image.asset("assets/images/img.png",
                  height: 0.5, width: 0.5),
            ),*/
            Text(
              " ",
            ), Text(
              " ",
            ),
            Text(
              "",
            ),

            Text(
              "On the next page you will be required to upload required documents. ",
              style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),
            ),
            Text(
              "",
            ),
            Text(
              "",
            ),

            RoundedButton(
              text: "NEXT ",
              press: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return FinancialPageGiveUp();
                  },


                ));
              },
            ),


          ],
        )),
      ),
    );
  }
}
