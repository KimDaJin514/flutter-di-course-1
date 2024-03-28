sealed class OrderType<T> {
  const factory OrderType.ascending() = Ascending;
  const factory OrderType.descending() = Descending;
}

class Ascending<T> implements OrderType<T> {
  const Ascending();
}

class Descending<T> implements OrderType<T> {
  const Descending();
}