import 'package:firstapp/widgets/mybutton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
   HomePage({super.key});
final List<String> listofdata=[
  'C','DEC','%','/',
  '9','8','7','+',
  '6','5','4','-',
  '3','2','1','*',
  '0','.','ANS','='
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
              )),
          Expanded(
            flex: 2,
            child:GridView.builder(
              itemCount: listofdata.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemBuilder: (context, index) {
                if(index==0){
                  return  Container(
                    child: Center(
                        child: MyButton(
                            color:isOperator(listofdata[index])? Colors.deepPurple:Colors.deepPurple[50],
                            textcolor:isOperator(listofdata[index])? Colors.white:Colors.deepPurple[20],
                            text:listofdata[index] )),
                  );

                }
                else if(index==1){

                }
                else{
                  return  Container(
                    child: Center(
                        child: MyButton(
                            color:isOperator(listofdata[index])? Colors.deepPurple:Colors.deepPurple[50],
                            textcolor:isOperator(listofdata[index])? Colors.white:Colors.deepPurple[20],
                            text:listofdata[index] )),
                  );

                }

                },)
          )
        ],
      ),
    );
  }
  bool isOperator(String st){
    if(st=='+'||st=='-'||st=='%'||st=='='||st=='*'||st=='/') {
      return true;
    } else {
      return false;
    }
  }
}
