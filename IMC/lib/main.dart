import 'package:imc/imc.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

main() => runApp(
  MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.green,
    ),
    home: home(),
  ),
);

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var altura = TextEditingController();
  var peso = TextEditingController();
  Imc meuImc = new Imc();
  
  double resultado = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),

      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Material(
                elevation: 20,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 10,
                      color: Color.fromARGB(255, 204, 202, 202)
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  width: 400,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  [
                        Container(
                          width: 100,
                          child: TextField(
                          controller: altura,
                          onSubmitted:(value) => {},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Altura',
              
                          ),
                      ),
                        ),
                       SizedBox(
                        width: 20,
                       ),
                       Container(
                        width: 100,
                         child: TextField(
                          controller: peso,
                          onSubmitted:(value) => {},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Peso',
              
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: 100,
                            child: ElevatedButton(onPressed: () {
                              setState(() {
                                 meuImc.altura = double.parse(altura.text);
                                 meuImc.peso = double.parse(peso.text);
                               resultado = meuImc.obterResultado(double.parse(altura.text), double.parse(peso.text));
                               print(resultado);
                              });
                            },
                            child: Text('calcular'),
                            ),
                          ),
                        )
                      ]
                    ),
                  ),
                ),
              ),
            ),
           Material(
            elevation: 5,
             child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 112, 173, 112),
                border: Border.all(
                  width: 5,
                  color: Color.fromARGB(255, 26, 218, 52),
                ),
              ),
              height: 30,
              width: 110,
              child: Text(resultado.toString())
             ),
           ),
           Container(
            height: 300,
            child: Lottie.network(
              "https://assets10.lottiefiles.com/packages/lf20_18vkvya1.json"
              ),
           ),
          ],
        ),
      ),
    );
  }
}