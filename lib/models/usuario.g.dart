// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UserFromJson(Map<String, dynamic> json) {
  return Usuario(json['id'] as int, json['nome'] as String,
      json['sobrenome'] as String, (json['saldo'] as num)?.toDouble());
}

Map<String, dynamic> _$UserToJson(Usuario instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'saldo': instance.saldo
    };
