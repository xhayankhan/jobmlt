import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class addImei extends StatefulWidget {
  const addImei({Key? key}) : super(key: key);

  @override
  _addImeiState createState() => _addImeiState();
}

class _addImeiState extends State<addImei> {
  List<TextEditingController> imeis=[];
  //TextEditingController imeis=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(

            height: MediaQuery.of(context).size.height*0.6,
            width: MediaQuery.of(context).size.width*0.7,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
                //shrinkWrap: true,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 5),
                    child: Text('Add Serial Numbers',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),),
                  ),),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,

                  itemBuilder: (context,index) {
                    if(imeis.isEmpty){
                      imeis.add(new TextEditingController());
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: TextFormField(
                            controller: imeis[index],
                          ),
                          width: 100,
                        ),
                        Container(
                          child: IconButton(onPressed: (){
                              imeis;
                            }, icon: Icon(Icons.clear )),
                          width: 100,
                        ),

                      ],
                    );}
                    else{
                      return Text('hiiiiii');
                    }
                  }
                ),


                Expanded(child: Divider(height: 10,)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: InkWell(
                        onTap: (){Get.back();},
                        child: Center(
                          child: Text(
                            'Close',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 20,
                            ),
                          ),
                        ),
                    ),
                      ),
                      Expanded(
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: InkWell(
                            onTap: (){Get.back();},
                            child: Center(
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
//
// final Color darkBlue = Color.fromARGB(255, 18, 32, 47);
//
//
// class ListData extends StatefulWidget {
//   @override
//   _ListDataState createState() => _ListDataState();
// }
//
// class _ListDataState extends State<ListData> {
//   final List<List<String>> dataList = [
//     <String>['Rose', 'SunFlower'],
//     <String>['SUV', 'CityCar', 'Jeep'],
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Data List'),
//       ),
//       body: ListView(
//         children: ListTile.divideTiles(
//           context: context,
//           tiles: dataList.map(
//                 (list) {
//               return ListTile(
//                   leading: CircleAvatar(
//                     child: Text('${list.length}'),
//                   ),
//                   title: Text(list.join(', ')),
//                   onTap: () async {
//                     final editData = await Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Form(data: list),
//                         fullscreenDialog: true,
//                       ),
//                     );
//
//                     if (editData != null) {
//                       final index = dataList.indexOf(list);
//
//                       if (index != -1) {
//                         setState(() {
//                           dataList[index] = editData;
//                         });
//                       }
//                     }
//                   });
//             },
//           ),
//         ).toList(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final newData = await Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => Form(),
//               fullscreenDialog: true,
//             ),
//           );
//
//           if (newData != null) {
//             setState(() {
//               dataList.add(newData);
//             });
//           }
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class Form extends StatefulWidget {
//   final List<String> data;
//
//   Form({List<String>? data}) : data = data ?? <String>[];
//
//   @override
//   _FormState createState() => _FormState();
// }
//
// class _FormState extends State<Form> {
//   List<TextEditingController> controllers=[];
//
//   @override
//   void initState() {
//     super.initState();
//
//     setState(() {
//       if (widget.data.isNotEmpty) {
//         controllers = widget.data.map((s) {
//           return TextEditingController(text: s);
//         }).toList();
//       } else {
//         controllers = [];
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Form'), actions: [
//         IconButton(
//           icon: Icon(Icons.save),
//           onPressed: () {
//             if (controllers.isEmpty) {
//               print('Data is empty, cannot saved');
//               return;
//             }
//
//             final list = controllers.map((c) => c.text).toList();
//             Navigator.pop(context, list);
//           },
//         ),
//       ]),
//       body: controllers == null
//           ? CircularProgressIndicator()
//           : ListView(
//         children: controllers.map((controller) {
//           return Container(
//             padding: const EdgeInsets.all(16),
//             child: TextField(
//               controller: controller,
//               decoration: InputDecoration(
//                 labelText:
//                 'Type data index-${controllers.indexOf(controller) + 1}',
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//       floatingActionButton: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           FloatingActionButton(
//             heroTag: 'min',
//             onPressed: () {
//               setState(() {
//                 controllers.removeLast();
//               });
//             },
//             child: Icon(Icons.remove),
//           ),
//           SizedBox(width: 8),
//           FloatingActionButton(
//             heroTag: 'add',
//             onPressed: () {
//               setState(() {
//                 controllers.add(TextEditingController());
//               });
//             },
//             child: Icon(Icons.add),
//           )
//         ],
//       ),
//     );
//   }
// }