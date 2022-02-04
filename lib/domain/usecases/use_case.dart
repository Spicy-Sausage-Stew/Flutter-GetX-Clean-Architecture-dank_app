abstract class UseCase<Input, Output> {
  Future<Output> call();
}
