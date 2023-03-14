import 'package:flutter/material.dart';
import 'Data.dart';


void main() {
 runApp(const MyApp());
}


class MyApp extends StatefulWidget {
 const MyApp({Key? key}) : super(key: key);
 @override
 MyAppState createState() {
   return MyAppState();
 }
}


class MyAppState extends State<MyApp> {
  // Dropdown
  String pilihanStatus = "Active Turn Over";
  String pilihanStatusOut = "";
  String pilihanWaktu = "1D";
  String pilihanWaktuOut = "";

  // ListView
  List<Data> dataD = [];
  @override
  void initState() {
    super.initState();
    // isi data listview
    dataD = [
      Data("A1", "BRI", "123M", "123B", "4820", "+80", "+2.00%"),
      Data("A2", "BNI", "123M", "123B", "4820", "+80", "+2.00%"),
    ];
  }
  
  @override
  Widget build(BuildContext context) {

    List<DropdownMenuItem<String>> status = [];
    status = <String>['Active Turn Over', 'Active Volume'].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();

    List<DropdownMenuItem<String>> waktu = [];
    waktu = <String>['1D', '1W'].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();

    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: Text('Quiz Flutter'),
            actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(             
                  child: 
                    Container(  
                      child : DropdownButton(
                        value: pilihanStatus,
                        items: status,
                        onChanged: (String? newValue) {
                          setState(() {
                            if (newValue != null) {
                              pilihanStatus = newValue;
                            }
                           }
                          );
                        },
                      ),
                    ),
                ),

                Container (
                  child : DropdownButton(
                    value: pilihanWaktu,
                    items: waktu,
                    onChanged: (String? newValue) {
                      setState(() {
                        if (newValue != null) {
                          pilihanWaktu = newValue;
                        }
                       }
                      );
                    },
                  ),
                ),
              ],
            ),
            
            // listView ============================================
            Expanded(
              child:

              
                
                ListView.builder(
                  itemCount: dataD.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(border: Border(
                        top: BorderSide(),
                        bottom: BorderSide(),
                      )),
                      padding: const EdgeInsets.all(15),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Container(
                            child: Column(
                              children: [
                                Text(dataD[index].kode,
                                  style: TextStyle(
                                    fontSize: 25, fontWeight: 
                                    FontWeight.bold, 
                                  ),
                                ),
                                Text('Volume'),
                                Text('Turn Over'),
                              ]
                            ), 
                          ),

                          Container(
                            child: Column(
                              children: [
                                Text(dataD[index].nama,
                                  style: TextStyle(
                                    fontSize: 20, 
                                    fontWeight: FontWeight.bold, 
                                  ),
                                ),
                                Text(dataD[index].vol),
                                Text(dataD[index].turnOver),
                              ]
                            ), 
                          ),
                          
                          Container(
                            child: Text(dataD[index].harga,
                              style: TextStyle(
                                  fontSize: 20, 
                                  fontWeight: FontWeight.bold, 
                                  color: Colors.green, 
                              ),
                            ), 
                          ),
                          
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green[700],
                              border: Border.all(),

                            ),
                            padding: EdgeInsets.all(14),
                            child: Column(
                              children: [
                                Text(dataD[index].naikTurun,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10, 
                                    fontWeight: FontWeight.bold, 
                                  ),
                                ),
                                Text(dataD[index].pctNaikTurun,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10, 
                                    fontWeight: FontWeight.bold, 
                                  ),
                                ),
                              ]
                            ),
                          ),
                          
                        ],
                      ),
                    );
                  },
                ),

            ),
          ]
        ),
      ),
    );
  }
}


class ButtonNamaKelompok extends StatelessWidget {
 const ButtonNamaKelompok({Key? key}) : super(key: key);


 @override
 Widget build(BuildContext context) {
   return IconButton(
     icon: Icon(Icons.account_circle_rounded),
     onPressed: () {
       // icon account di tap
       showDialog<String>(
         context: context,
         builder: (BuildContext context) => AlertDialog(
           title: const Text('Kelompok 13'),
           content: const Text('Apri Anggara Yudha (anggarayudha585@upi.edu) ; Virza Raihan Kurniawan (virza_rk@upi.edu)'),
           actions: <Widget>[
             TextButton(
               onPressed: () => Navigator.pop(context, 'OK'),
               child: const Text('OK'),
             ),
           ],
         ),
       );
     },
   );
 }
}


class ButtonPerjanjian extends StatelessWidget {
 const ButtonPerjanjian({Key? key}) : super(key: key);


 @override
 Widget build(BuildContext context) {
   return IconButton(
     icon: Icon(Icons.access_alarm_rounded),
     onPressed: () {
       // icon setting ditap
       const snackBar = SnackBar(
         duration: Duration(seconds: 20),
         content: Text('Kami berjanji tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
       );
       ScaffoldMessenger.of(context).showSnackBar(snackBar);
     },
   );
 }
}

