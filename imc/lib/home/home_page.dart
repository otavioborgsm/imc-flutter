import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key : key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController controllerWeight = TextEditingController();
  TextEditingController controllerHeight = TextEditingController();
  num resultImc = 0;
  String optionsResultImc = '';

  void selectedOptionResultImc() {
    if(resultImc >= 5 && resultImc <= 16.9){
      optionsResultImc = 'Muito abaixo do peso.'; 
    } else if ( resultImc >= 17 && resultImc <= 18.4){
      optionsResultImc = 'Abaixo do peso.';
    } else if ( resultImc >= 18.5 && resultImc <= 24.9){
      optionsResultImc = 'Peso normal.';
    } else if ( resultImc >= 25 && resultImc <= 29.9){
      optionsResultImc = 'Acima do peso.';
    } else if ( resultImc >= 30 && resultImc <= 34.9){
      optionsResultImc = 'Obesidade grau I';
    } else if ( resultImc >= 35 && resultImc <= 40){
      optionsResultImc = 'Obesidade grau II';
    } else if ( resultImc > 40){
      optionsResultImc = 'Obesidade grau III';
    }
  }

  void calculatorImc() {
    num resultNumber = (num.parse(controllerWeight.text) / 
      (num.parse(controllerHeight.text) * num.parse(controllerHeight.text)));
  
    resultImc = resultNumber;  
  }

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
                    fontSize: 20,
                  )
                ),
                const SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(),                  
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
                  keyboardType: TextInputType.numberWithOptions(),              
                  controller: controllerWeight,
                  decoration: const InputDecoration(
                    labelText: 'Informe seu peso:',
                    hintText: 'Ex: 70kg',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))
                    )
                  ),
                ),
              const SizedBox(height: 24, ),
              Text(resultImc.toStringAsFixed(1), style: const TextStyle(fontSize: 16,),),
              const SizedBox(height: 24, ),
              Text(optionsResultImc, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),

              const SizedBox(height: 32, ),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                    colors: [
                      Color(0xFF3366FF),
                      Color(0xFF00CCFF),
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 400,
                  child: ElevatedButton(
                    style: ButtonStyle(                      
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      setState(() {
                        calculatorImc();
                        selectedOptionResultImc();         
                      });
                    },
                    child:const Text('CALCULAR')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}