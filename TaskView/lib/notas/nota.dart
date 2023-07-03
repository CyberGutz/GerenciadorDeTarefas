class Nota {
  late String titulo;
  String conteudo = "";
  DateTime dataCriado = DateTime.now(); // Data em que a nota foi criada
  DateTime dataLastEdited =
      DateTime.now(); // Data em que a nota foi editada pela última vez
  bool isSelected = false;

  Nota(this.titulo, {conteudo, dataCriado, dataLastEdited});

  // Converte a tarefa para um mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'conteudo': conteudo,
      'dataCriado': dataCriado.toIso8601String(),
      'dataLastEdited': dataLastEdited.toIso8601String(),
    };
  }

  // Cria uma instância de Task a partir de um mapa JSON
  factory Nota.fromJson(Map<String, dynamic> json) {
    return Nota(
      json['titulo'] as String,
      conteudo: json['conteudo'] as String,
      dataCriado: DateTime.parse(json['dataCriado'] as String),
      dataLastEdited: DateTime.parse(json['dataLastEdited'] as String),
    );
  }

  // Setter para o título
  void setTitle(String titulo) {
    this.titulo = titulo;
  }

  // Setter para o conteúdo
  void setConteudo(String conteudo) {
    this.conteudo = conteudo;
  }
}
