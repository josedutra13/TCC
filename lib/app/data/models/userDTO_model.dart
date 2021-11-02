class UserDTO {
  int? id;
  late String? nome;
  late bool? isPerson;

  UserDTO({this.id, this.nome, this.isPerson});

  UserDTO.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.isPerson = json['isPerson'];
  }

  UserDTO.empty();

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['isPerson'] = this.isPerson;
    return data;
  }
}
