import 'package:bookshelf/core/services/dio_service.dart';
import 'package:bookshelf/core/services/request_handler_service.dart';
import 'package:bookshelf/features/author/data/datasources/author_datasource.dart';
import 'package:bookshelf/features/author/data/repositories/author_repository_impl.dart';
import 'package:bookshelf/features/author/domain/repositories/author_repository.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void setUpLocator() {
  serviceLocator.registerLazySingleton<DioService>(() => DioService());
  serviceLocator.registerLazySingleton(() => RequestHandlerService(serviceLocator<DioService>().dio));
  serviceLocator.registerLazySingleton<AuthorDatasource>(
    () => AuthorDatasourceImpl(requestHandlerService: serviceLocator<RequestHandlerService>()),
  );
  serviceLocator.registerLazySingleton<AuthorRepository>(
    () => AuthorRepositoryImpl(serviceLocator<RequestHandlerService>(), serviceLocator<AuthorDatasource>()),
  );
}
