import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key : key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController controllerWeight = TextEditingController();
  TextEditingController controllerHeight = TextEditingController();
  String resultImc = '';

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Calculadora IMC')),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient:  LinearGradient(
                colors: [
                  Color(0xFF3366FF),
                  Color(0xFF00CCFF),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
            child: Column(
              children: <Widget>[
                const Text(
                  'Vamos calcular seu índice de massa corporal?',
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  )
                ),
                const SizedBox(height: 16),
                TextFormField(                  
                  controller: controllerHeight,
                  decoration: const InputDecoration(
                    labelText: 'Informe a sua altura:',
                    hintText: 'Ex: 1.80m',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    )
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controllerWeight,
                  decoration: const InputDecoration(
                    labelText: 'Informe seu peso:',
                    hintText: 'Ex: 70kg',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))
                    )
                  ),
                ),
              const SizedBox(height: 32, ),
              Text(resultImc, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),

              const SizedBox(height: 32, ),
                Container(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        num resultNumber = (num.parse(controllerWeight.text) / 
                        (num.parse(controllerHeight.text) * num.parse(controllerHeight.text)));
                      
                        resultImc = resultNumber.toString();
                      });
                    },
                    child:const Text('Calcular')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}