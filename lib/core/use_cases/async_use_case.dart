abstract class AsyncUseCase<Type, Params> {

  const AsyncUseCase();

  Future<Type> execute(Params param);
}