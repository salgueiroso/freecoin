import 'package:free_coin/models/usuario.dart';
import 'package:free_coin/services/remoto/rest_api.dart';

class UsuarioService {
  final httpClient = new RestApi();

  Future<Usuario> obterUsuario() async {
    return await httpClient.get("usuario/", Usuario.create());
  }
}
