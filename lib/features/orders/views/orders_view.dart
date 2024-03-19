import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vyapaarify/core/assets.dart';
import 'package:vyapaarify/core/theme.dart';

import '../data/orders_data.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

int status = 0;
List<OrderModel> orders = [];
int orderNumber = 420;

class _OrderViewState extends State<OrderView> {
  @override
  void initState() {
    orders = OrderData.getPendingOrders();
    super.initState();
  }

  void refreshData(int status) {
    orders.clear();
    if (status == 0) {
      orders = OrderData.getPendingOrders();
    } else if (status == 1) {
      orders = OrderData.getCompletedOrders();
    }
  }

  void _refreshPage() {
    setState(() {
      OrderData.orders.add(OrderModel(
        id: orderNumber,
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
        ],
      ));
      refreshData(0); // Update state to trigger a rebuild
    });
  }

  void _showDialog() {
    orderNumber++;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Order Confirmation'),
          content: Text('New Order Received! \n Order Number: $orderNumber'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel Order'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _refreshPage(); // Call the refresh function after closing
              },
              child: const Text('Accept order'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,
              hintText: "Enter your business email address",
              isDense: true,
              hintStyle:
                  TextStyle(color: const Color(0xff222222).withOpacity(0.5)),
              fillColor: const Color(0xff222222).withOpacity(0.05),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: const Color(0xff222222).withOpacity(0.25)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color(0xffF2BC18),
                        ),
                        color: (status == 0) ? const Color(0xffF2BC18) : null),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        "Pending (3)",
                        style: TextStyle(
                          color: (status == 0)
                              ? AppTheme.whiteColor
                              : const Color(0xffF2BC18),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    status = 0;
                    refreshData(0);
                    setState(() {});
                  }),
              InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.green,
                        ),
                        color: (status == 1) ? Colors.green : null),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        "Completed (24)",
                        style: TextStyle(
                          color: (status == 1)
                              ? AppTheme.whiteColor
                              : Colors.green,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    status = 1;
                    refreshData(1);
                    setState(() {});
                  }),
              GestureDetector(
                onTap: _showDialog,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.red,
                      ),
                      color: (status == 2) ? Colors.red : null),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      "Cancelled (3)",
                      style: TextStyle(
                        color: (status == 2) ? AppTheme.whiteColor : Colors.red,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: AppTheme.black.withOpacity(0.10),
                        ),
                      ),
                      color: AppTheme.whiteColor,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order ID: ${orders[index].id}",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              "8:03 PM",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: const Color(0xffF2BC18),
                                ),
                                color:
                                    const Color(0xffF2BC18).withOpacity(0.10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                child: Text(
                                  "Pending",
                                  style: TextStyle(
                                    color: Color(0xffF2BC18),
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              "Order placed 38 mins ago",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Divider(
                          thickness: 1,
                          color: AppTheme.black.withOpacity(0.10),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, inx) {
                            double price = orders[index].orders[inx].quantity *
                                orders[index].orders[inx].price;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      Assets.orderBullet,
                                      width: 16,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${orders[index].orders[inx].quantity} x ${orders[index].orders[inx].name}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Text('₹ $price')
                              ],
                            );
                          },
                          itemCount: orders[index].orders.length,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Divider(
                          thickness: 1,
                          color: AppTheme.black.withOpacity(0.10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total bill',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            Text('₹ ${orders[index].totalPrice()}'),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(14.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Trip Distance: 4.6 km',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(Icons.keyboard_arrow_down),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 14.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.alarm,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    Text("${orders[index].eta}mins away"),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 49,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                          ),
                                          border: Border(
                                              top: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.5)))),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            color: AppTheme.primaryColor,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Call",
                                            style: AppTheme
                                                .primaryHeadingTextMedium,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 49,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                          ),
                                          border: Border(
                                            top: BorderSide(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                            ),
                                          ),
                                          color: AppTheme.primaryColor),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.location_pin,
                                            color: AppTheme.whiteColor,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Map",
                                            style: AppTheme
                                                .primaryHeadingTextMedium
                                                .copyWith(
                                                    color: AppTheme.whiteColor),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        (status == 0)
                            ? InkWell(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Accept Order",
                                      style: AppTheme.primaryHeadingTextMedium
                                          .copyWith(
                                        color: AppTheme.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  orders[index].setCompleted();
                                  refreshData(0);
                                  setState(() {});
                                },
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                );
              },
              itemCount: orders.length,
            ),
          )
        ],
      ),
    );
  }
}
