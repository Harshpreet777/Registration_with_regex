import 'package:flutter/material.dart';
class MyInheritedWidget extends InheritedWidget{
  const MyInheritedWidget({super.key,required this.child,required this.message}):super(child: child);
  final String message;
  @override
  final Widget child;

  static MyInheritedWidget of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.message!= message;
  }

}



















// class TestWidget extends StatelessWidget {
//   const TestWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: MyInheritedWidget(message: 'Hellloooo',child: Builder(builder: (BuildContext innerContext){
//         return Center(
//           child: Text(
//             MyInheritedWidget.of(innerContext).message,
//             style:const  TextStyle(color: Colors.amber),
//           ),
//         );
//       }),),
//     );
//   }
// }

