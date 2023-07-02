class Nota {
  late String titulo;
  String conteudo = "teste0";
  DateTime dataCriado = DateTime.now();
  DateTime dataLastEdited = DateTime.now();

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
      dataLastEdited: DateTime.parse(json['dataLastEdited']),
    );
  }

  void setTitle(String titulo) {
    this.titulo = titulo;
  }

  void setConteudo(String conteudo) {
    this.conteudo = conteudo;
  }
}
