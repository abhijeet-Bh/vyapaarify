enum OrderStatus { PENDING, COMPLETED, CANCELLED }

class OrderModel {
  int id;
  DateTime dateTime;
  OrderStatus status;
  double distance;
  double eta;
  List<OrderItem> orders;

  OrderModel({
    required this.id,
    required this.dateTime,
    required this.status,
    required this.distance,
    required this.eta,
    required this.orders,
  });

  double totalPrice() {
    double total = 0;
    for (var x in orders) {
      total = total + (x.price * x.quantity);
    }

    return total;
  }

  void setCompleted() {
    status = OrderStatus.COMPLETED;
  }
}

class OrderItem {
  int quantity;
  String name;
  double price;

  OrderItem({required this.name, required this.price, required this.quantity});
}

class OrderData {
  static List<OrderModel> orders = [
    OrderModel(
      id: 321,
      dateTime: DateTime.now(),
      status: OrderStatus.COMPLETED,
      distance: 4.6,
      eta: 15,
      orders: [
        OrderItem(
          name: "Chicken Boneless (1Kg)",
          price: 150,
          quantity: 2,
        ),
        OrderItem(
          name: "Masala Salami (250gm)",
          price: 150,
          quantity: 2,
        ),
      ],
    ),
    OrderModel(
      id: 420,
      dateTime: DateTime.now(),
      status: OrderStatus.PENDING,
      distance: 4.6,
      eta: 15,
      orders: [
        OrderItem(
          name: "Chicken Boneless (1Kg)",
          price: 150,
          quantity: 2,
        ),
        OrderItem(
          name: "Masala Salami (250gm)",
          price: 150,
          quantity: 2,
        ),
        OrderItem(
          name: "Minced Mutton (500gm)",
          price: 170,
          quantity: 1,
        ),
      ],
    ),
  ];

  static List<OrderModel> getPendingOrders() {
    List<OrderModel> penOrders = [];
    for (var x in orders) {
      if (x.status == OrderStatus.PENDING) {
        penOrders.add(x);
      }
    }

    return penOrders;
  }

  static List<OrderModel> getCompletedOrders() {
    List<OrderModel> penOrders = [];
    for (var x in orders) {
      if (x.status == OrderStatus.COMPLETED) {
        penOrders.add(x);
      }
    }

    return penOrders;
  }
}
