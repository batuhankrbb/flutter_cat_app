class URLService {
  final String _baseUrl = "api.thecatapi.com";
  final String _apiKey = "30ad0562-66c2-4263-9963-01efc36335ef";
  final String _breedList = "/v1/breeds/";

  String get breedListUrl {
    return "$_baseUrl$_breedList";
  }
}
