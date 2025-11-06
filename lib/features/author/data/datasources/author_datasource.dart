import 'package:bookshelf/core/services/request_handler_service.dart';
import 'package:bookshelf/features/author/data/models/author_detail_model.dart';
import 'package:bookshelf/features/author/data/models/author_model.dart';
import 'package:bookshelf/features/author/data/models/author_work_model.dart';
import 'package:bookshelf/features/author/data/models/generic_pagination_model.dart';

abstract class AuthorDatasource {
  Future<({double resultCount, List<AuthorModel> results})> getAuthors(String query);

  Future<AuthorDetailModel> getAuthorDetail(String authorId);

  Future<GenericPagination<AuthorWorkModel>> getAuthorWorks(String authorId, [String? next]);
}

class AuthorDatasourceImpl implements AuthorDatasource {
  final RequestHandlerService requestHandlerService;

  AuthorDatasourceImpl({required this.requestHandlerService});

  @override
  Future<({double resultCount, List<AuthorModel> results})> getAuthors(String query) {
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

  @override
  Future<AuthorDetailModel> getAuthorDetail(String authorId) {
    return requestHandlerService.handleRequest<AuthorDetailModel>(
      fromJson: (response) async {
        if (response.data is! Map<String, dynamic>) {
          throw Exception('No data found in response');
        }
        return AuthorDetailModel.fromJson(response.data);
      },

      path: 'authors/$authorId.json',
    );
  }

  @override
  Future<GenericPagination<AuthorWorkModel>> getAuthorWorks(String authorId, [String? next]) {
    return requestHandlerService.handleRequest<GenericPagination<AuthorWorkModel>>(
      fromJson: (response) async {
        if (response.data is! Map<String, dynamic>) {
          throw Exception('No data found in response');
        }
        return GenericPagination<AuthorWorkModel>.fromJson(
          response.data,
          (p0) => AuthorWorkModel.fromJson(p0 as Map<String, dynamic>),
        );
      },

      path: next ?? 'authors/$authorId/works.json',
    );
  }
}
