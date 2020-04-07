import 'package:timosh_app/abstractions/IRepository.dart';

class Repository<T> implements IRepository<T> {
  List<T> repositoryContext;

  Repository() {
    repositoryContext = List<T>();
  }

  Repository.fromCollection(List<T> repositoryContext) {
    this.repositoryContext = repositoryContext;
  }

  @override
  void add(T entity) {
    repositoryContext.add(entity);
  }

  @override
  void addRange(List<T> range) {
    repositoryContext.addAll(range);
  }

  @override
  void edit(T entity) {
    throw UnimplementedError();
  }

  @override
  List<T> getAll() {
    return repositoryContext;
  }

  @override
  void remove(T entity) {
    repositoryContext.remove(entity);
  }
}