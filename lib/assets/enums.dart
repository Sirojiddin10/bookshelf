enum RequestMethodEnum { get, post, put, delete, patch }

enum FormStatus { pure, loading, success, error }

extension FormStatusExtension on FormStatus {
  bool get isPure => this == FormStatus.pure;

  bool get isLoading => this == FormStatus.loading;

  bool get isSuccess => this == FormStatus.success;

  bool get isError => this == FormStatus.error;
}
