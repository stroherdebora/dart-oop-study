// ignore_for_file: public_member_api_docs, sort_constructors_first
void main() {
  String nome = "Laranja";
  double peso = 100.2;
  String cor = "Verde e amarela";
  String sabor = "Doce e cítrica";
  int diasDesdeColheita = 40;
  // bool isMadura;

  Fruta fruta01 = Fruta(nome, peso, cor, sabor, diasDesdeColheita);
  Fruta fruta02 = Fruta("Uva", 40, "roxo", "doce", 40);

  print("Fruta 01: ${fruta01.nome}");
  print("Fruta 01: $fruta01");

  print("Fruta 02: ${fruta02.nome}");
  print("Fruta 02: $fruta02");

  Legumes mandioca1 = Legumes("Mandioca", 1200, "Marrom", true);
  Fruta banana1 = Fruta("Banana", 100, "Amarela", "Doce", 12);
  Nozes nozes1 = Nozes("Nozes", 2, "Marrom", "Doce", 20, 35);
  Citricas limao1 = Citricas("Limão", 50, "Verde", "Azedo", 5, 9);

  mandioca1.printAlimento();
  banana1.printAlimento();
  nozes1.printAlimento();
  limao1.printAlimento();

  mandioca1.cozinhar();
  // limao1.cozinhar(); // não funciona, método cozinhar não pertente a classe Fruta
  limao1.fazerSuco();
  // mandioca1.fazerSuco(); // não funciona, método fazerSuco não pertence a classe Alimento
  banana1.separarIngredientes();
  nozes1.fazerMassa();
}

class Alimento {
  String nome;
  double peso;
  String cor;
  Alimento(
    this.nome,
    this.peso,
    this.cor,
  );

  void printAlimento() {
    print("Nome: $nome");
    print("Peso: $peso");
    print("Cor: $cor\n");
  }
}

class Fruta extends Alimento implements Bolo {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(
      String nome, double peso, String cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura})
      : super(nome, peso, cor);

  void estaMadura(int diasParaMadura) {
    isMadura = diasDesdeColheita >= diasParaMadura;
    print(
        'A sua $nome foi colhida a $diasDesdeColheita dias e precisa de $diasParaMadura dias para poder comer!'
        'Ela está madura? $isMadura');
  }

  void fazerSuco() {
    print('Você fez um ótimo suco de $nome');
  }

  @override
  void separarIngredientes() {
    print('Catar a fruta');
  }

  @override
  void fazerMassa() {
    print('Misturar a fruta com farinha, açũcar, ovos...');
  }

  @override
  void assar() {
    print('Colocar no forno');
  }
}

class Citricas extends Fruta {
  double nivelAzedo;

  Citricas(
    String nome,
    double peso,
    String cor,
    String sabor,
    int diasDesdeColheita,
    this.nivelAzedo,
  ) : super(nome, peso, cor, sabor, diasDesdeColheita);

  void existeRefri(bool existe) {
    if (existe) {
      print('Existe refrigerante de $nome');
    } else {
      print('Não existe refrigerante de $nome');
    }
  }
}

class Legumes extends Alimento implements Bolo {
  bool isPrecisaCozinhar;

  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
      : super(nome, peso, cor);

  void cozinhar() {
    if (isPrecisaCozinhar) {
      print("Pronto, o $nome está cozinhando!");
    } else {
      print("Nem precisa cozinhar!");
    }
  }

  @override
  void assar() {
    // colocar mais tempo
  }

  @override
  void fazerMassa() {
    // fazer uma papa com o legume
  }

  @override
  void separarIngredientes() {
    // ver se o alimento está cozido ou cru
  }
}

class Nozes extends Fruta {
  double porcentagemOleoNatural;

  Nozes(
    String nome,
    double peso,
    String cor,
    String sabor,
    int diasDesdeColheita,
    this.porcentagemOleoNatural,
  ) : super(nome, peso, cor, sabor, diasDesdeColheita);

  @override
  void fazerMassa() {
    print('Tirar a casca');
    super.fazerMassa();
  }
}

abstract class Bolo {
  void separarIngredientes();

  void fazerMassa();

  void assar();
}

// ---> Tipos de Parâmetros
//** Parâmetros "Padrão"
//** Modificador "required"
//** Posicionais Obrigatórios
//** Nomeados Opcionais
mostrarMadura(String nome, int dias, {required String cor}) {
  if (dias >= 30) {
    print("A $nome está madura.");
  } else {
    print("A $nome não  está madura.");
  }

  if (cor != null) {
    print("A $nome é $cor");
  }
}

bool funcEstaMaduro(int dias) {
  if (dias >= 30) {
    return true;
  } else {
    return false;
  }
}
