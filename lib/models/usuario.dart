import 'package:free_coin/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usuario.g.dart';

@JsonSerializable()
class Usuario extends BaseModel<Usuario> {
  int id;
  String nome;
  String sobrenome;
  double saldo;

  Usuario(this.id, this.nome, this.sobrenome, this.saldo);

  @override
  Usuario fromJson(Map<String, dynamic> json)=>_$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() =>_$UserToJson(this);

  factory Usuario.create() => new Usuario(0, "", "", 0);

}
