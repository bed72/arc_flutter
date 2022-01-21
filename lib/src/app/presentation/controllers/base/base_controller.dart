abstract class BaseController<T> {
  Future<void> setLoading(bool value);
  Future<void> setError(String value);
  Future<void> setSuccessful(T value);
}
