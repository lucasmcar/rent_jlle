import 'package:imovel_direto/utils/config_util.dart';

abstract class UriUtil {
  /// Método que retorna uma url
  Future<Uri> getUri(String url, String endpoint) async {
    String baseUrl = "http:/${Config.HOST}:${Config.PORT}/$url/$endpoint";

    Uri returnUri = Uri.parse(baseUrl);
    return returnUri;
  }
}
