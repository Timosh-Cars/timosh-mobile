abstract class IRepository<T> {
  List<T> getAll();
  void add(T entity);
  void addRange(List<T> range);
  void remove(T entity);
  void edit(T entity);
}