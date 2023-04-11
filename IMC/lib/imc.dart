class Imc{
  double _altura = 0;
  double _peso = 0;
 

  obterResultado(altura, peso){ 
    return altura / peso;
  }


  set altura (double altura){
    this._altura = altura;
  }
  set peso(double peso){
     this._peso = peso;
  }

}