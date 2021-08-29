import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';
import '../../../constants.dart';
import 'FeedDataModel.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/src/material/colors.dart';

class NewsFeedScreen extends StatelessWidget with NavigationStates {
  @override
  int _selectedIndex = 0;
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: buildAppBar(context),
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context,data){
            if(data.hasError){
              return Center(child: Text("${data.error}"));
            }else if(data.hasData){
              var items =data.data as List<FeedDataModel>;
              return ListView.builder(
                  itemCount: items == null? 0: items.length,
                  itemBuilder: (context,index){
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                      child: Container(
                        color: Colors.orangeAccent,
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 70,
                              height: 100,
                              child: Image(image: NetworkImage(items[index].imageURL.toString()),fit: BoxFit.fill,),
                            ),
                            Expanded(child: Container(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].name.toString(),style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),),),
                                  Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text(items[index].description.toString()),)
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  }
              );
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),

        bottomNavigationBar: BottomNavigationBar(
    items: [
    BottomNavigationBarItem(label: 'Feed', icon: Icon(Icons.refresh)),
    BottomNavigationBarItem(label: 'Chat', icon: Icon(Icons.chat)),
    ],
    )
    );
  }

  Future<List<FeedDataModel>>ReadJsonData() async{
    final jsondata = await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => FeedDataModel.fromJson(e)).toList();
  }
  AppBar buildAppBar(BuildContext context) {
    return  AppBar(
      title: Text("NewsFeed to keep you Updated"),
      centerTitle: true,
    );
  }

}
