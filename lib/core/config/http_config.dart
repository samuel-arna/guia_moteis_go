import 'dart:io';

class HttpConfig {
  Future<HttpClientRequest> get(String url) async {
    HttpClient client = HttpClient();
    return client.getUrl(Uri.parse(url));
  }
}
