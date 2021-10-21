import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/question_card.dart';
import 'package:saadoptionsystem/constants.dart';
import '../../../../rounded_button.dart';
import 'Financial Page.dart';
import 'question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/question_controller.dart';


class BodyQuiz extends StatelessWidget with NavigationStates{
  const BodyQuiz({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(

      children: [


        SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        SafeArea(
        child: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image:AssetImage(
        "assets/images/SA_Adoption_system.png"),
        fit: BoxFit.cover,
        ),
        ),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Please answer the following questions",
                style: Theme.of(context).textTheme.headline6.copyWith(color: kPrimaryColor),
              ),
              SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Question ${_questionController.questionNumber.value}",
                      style: Theme.of(context).textTheme.headline4.copyWith(color: kPrimaryColor),
                      children: [
                        TextSpan(
                          text: "/${_questionController.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: kPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1.5),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                      question: _questionController.questions[index]),
                ),
              ),


              RoundedButton(
                text: "DONE",
                alignment: Alignment.center,
                side: BorderSide(width:25),
                press: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return FinancialPage();


    },
    )
    );
    },
    ),

    ],

    ),
    ),
        )],


    );

  }

}
