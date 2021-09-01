
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var textControlerM = TextEditingController();
  var textControlerKG = TextEditingController();
  bool genderselector = false;
  double IMC = 0.0;

 

   IMCCalculation(){
    var altura = double.parse(textControlerM.text??"0");
    var peso = double.parse(textControlerKG.text??"0");
    IMC = peso / (altura * altura);
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calcular IMC'),
        ),
        body: ListView(
          children: [
            SizedBox(height: 14,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Ingrese sus datos para calcular el IMC")),
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                    genderselector = ! genderselector;
                    setState(() {
                      
                    });
                }, icon: Icon(Icons.female, color:  genderselector ? Colors.grey : Colors.red,)),
                IconButton(onPressed: (){
                  genderselector = ! genderselector;
                  setState(() {
                    
                  });
                }, icon: Icon(Icons.male, color:  genderselector ? Colors.blue : Colors.grey,)),
              ],
            ),
            
            //Lista radio buttons
           
            ListTile(
              leading: Icon(Icons.square_foot),
              title: TextField(
                controller: textControlerM,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Ingresa altura (Metros)",
                  fillColor: Colors.green,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.monitor_weight),
              title: TextField(
                controller: textControlerKG,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Ingresar peso (KG)"
                ),
              ),
            ),      
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: MaterialButton(onPressed: (){
                IMCCalculation();
                if(genderselector){
                  _showMyDialogMale(IMC);
                }else{
                  _showMyDialogFemale(IMC);
                }


                setState(() {
                  
                });
              }, 
              child: Text("Calculate", style: TextStyle(
                color: Colors.grey[200],

              ),),
              color: Colors.green,
              ),
            ),
            
            
          ],
        ),
      );
  }
  Future<void> _showMyDialogFemale(IMC) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Tu IMC: ${IMC.toStringAsFixed(2)}'),
        content: SingleChildScrollView(
          child: ListBody(
            children:  <Widget>[
              Text('Tabla del IMC para Mujeres'),
              Text("Edad      IMC ideal "),
              Text("16-17     19-24"),
              Text("16-17     19-24"),
              Text("18-18       19-24"),
              Text("19-24     19-24 "),
              Text("25-34     20-25 "),
              Text("35-44     21-26 "),
              Text("45-54     22-27 "),
              Text("55-64     23-28 "),
              Text("65-90     25-30")


            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child:  Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _showMyDialogMale(IMC) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Tu IMC: ${IMC.toStringAsFixed(2)}'),
        content: SingleChildScrollView(
          child: ListBody(
            children:  <Widget>[
              Text('Tabla del IMC para Hombres'),
              Text("Edad      IMC ideal "),
              Text("16-16       19-24 "),
              Text("17-17       20-25 "),
              Text("18-18       20-25 "),
              Text("19-24     21-26 "),
              Text("25-34     22-27  "),
              Text("35-54     23-38 "),
              Text("55-64     24-29  "),
              Text("65-90     25-30 "),


            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child:  Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

}

