import 'package:bookshelf/core/services/request_handler_service.dart';
import 'package:bookshelf/features/author/data/models/author_model.dart';

abstract class AuthorDatasource {
  Future<({double resultCount, List<AuthorModel> results})> fetchAuthors(String query);
}

class AuthorDatasourceImpl implements AuthorDatasource {
  final RequestHandlerService requestHandlerService;

  AuthorDatasourceImpl({required this.requestHandlerService});

  @override
  Future<({double resultCount, List<AuthorModel> results})> fetchAuthors(String query) {
    return requestHandlerService.handleRequest<({double resultCount, List<AuthorModel> results})>(
      fromJson: (response) async {
        if (response.data is! Map<String, dynamic>) {
          throw Exception('No data found in response');
        }
        final data = response.data as Map<String, dynamic>;
        final count = (data['numFound'] as num).toDouble();
        final resultsList = (data['docs'] as List<dynamic>)
            .map((e) => AuthorModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return (resultCount: count, results: resultsList);
      },
      queryParameters: {'q': query},
      path: 'search/authors.json',
    );
  }
}
