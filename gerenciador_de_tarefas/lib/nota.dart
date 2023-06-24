import 'dart:convert';

class Nota {
  late int id;
  late String titulo;
  late String conteudo;
  late DateTime dataCriado;
  late DateTime dataLastEdited;
  int isArquivado = 0;

  Nota(this.id, this.titulo, this.conteudo, this.dataCriado,
      this.dataLastEdited);

  Map<String, dynamic> toMap(bool forUpdate) {
    var data = {
      'id': id,
      'titulo': utf8.encode(titulo),
      'conteudo': utf8.encode(conteudo),
      'dataCriado': epochFromDate(dataCriado),
      'dataLastEdited': epochFromDate(dataLastEdited),
      'isArquivado': isArquivado
    };

    if (forUpdate) {
      data["id"] = this.id;
    }

    return data;
  }

  int epochFromDate(DateTime dt) {
    return dt.millisecondsSinceEpoch ~/ 1000;
  }

  void arquiveEstaNota() {
    isArquivado = 1;
  }
}
