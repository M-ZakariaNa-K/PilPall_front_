// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pharmacist_app/Models/basket_item_model.dart';
import 'package:pharmacist_app/controller/basketController.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/widgets/basket_item_lists.dart';

class BasketItem extends StatefulWidget {
  const BasketItem({
    Key? key,
    required this.item,
    required this.i,
    required this.onePiecePrice,
  }) : super(key: key);
  final BasketItemModel item;
  final int i;
  final num onePiecePrice;
  @override
  State<BasketItem> createState() => _BasketItemState();
}

int counter = 1;
final BasketItemsList objList = BasketItemsList();
List<BasketController> controllers = [];

class _BasketItemState extends State<BasketItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //image

              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: 80,
                  height: 80,
                  child: Image.network(
                    widget.item.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 130,
                          child: Text(
                            //NAME
                            widget.item.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Open Sans',
                              color: Color(0xff003A71),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        //price
                        Text(
                          '${widget.item.quantityPrice} SYP',
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Open Sans',
                              color: Color(0xff003A71),
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //button

              Container(
                width: 120,
                height: 40,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xff88BFDD),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff003A71),
                      offset: Offset(1, 2),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: GetBuilder(
                    init: BasketController(),
                    builder: (controller) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onLongPressEnd: (details) {
//store
                              basketItemsPlaceOrderList1[widget.i]
                                  ['quantity'] += 5;
                              // controller.storeQuantityIncreament(
                              //     widget.i, true);
                              setState(() {
//increament
                                widget.item.counter += 5;
//SUM
                                widget.item.quantityPrice +=
                                    (widget.onePiecePrice * 5);
                                sum += (widget.onePiecePrice * 5);
                                controller
                                    .incrementSum(widget.onePiecePrice * 5);
                              });
                            },
                            child: IconButton(
                              onPressed: () {
                                basketItemsPlaceOrderList1[widget.i]
                                    ['quantity'] += 1;
                                print(
                                    'im zakariaList:    $basketItemsPlaceOrderList1');
                                //store
                                // controller.storeQuantityIncreament(widget.i,
                                //     false);
                                //widget.i == id from Medicene Page
                                setState(() {
                                  //  controllers[index].increment();
                                  //    print( controllers[index].printInfo());
//increament
                                  widget.item.counter++;

//IncreamentSUM
                                  widget.item.quantityPrice +=
                                      widget.onePiecePrice;
                                  // sum += widget.onePiecePrice;
                                  controller.incrementSum(widget.onePiecePrice);
                                });
                              },
                              icon: const Icon(
                                size: 18,
                                Icons.add,
                                color: Color(0xff003A71),
                              ),
                            ),
                          ),
                          //Text('${controller.counter}'),

                          Text(
                            '${widget.item.counter}',
                            //'${controllers[index].printInfo()}'
                          ),
                          //controllers[index].counterInt()>1,
                          widget.item.counter > 1
                              ? GestureDetector(
                                  onLongPressEnd: (details) {
                                    widget.item.counter <= 5
                                        ? basketItemsPlaceOrderList1[widget.i]
                                            ['quantity'] -= 1
                                        // controller
                                        //     .storeQuantityDeccreament(
                                        //         widget.i, false)
                                        : basketItemsPlaceOrderList1[widget.i]
                                            ['quantity'] -= 5;
                                    // controller
                                    //     .storeQuantityDeccreament(
                                    //         widget.i, true);

                                    widget.item.quantityPrice -=
                                        widget.item.counter > 5
                                            ? (widget.onePiecePrice * 5)
                                            : widget.onePiecePrice;
                                    //total sum
                                    widget.item.counter > 5
                                        ? controller.decrementSum(
                                            widget.onePiecePrice * 5)
                                        : controller
                                            .decrementSum(widget.onePiecePrice);
                                    setState(() {
                                      widget.item.counter <= 5
                                          ? widget.item.counter--
                                          : widget.item.counter -= 5;
//store

                                      sum -= widget.onePiecePrice * 5;
                                    });
                                  },
                                  child: IconButton(
                                    onPressed: () {
                                      basketItemsPlaceOrderList1[widget.i]
                                          ['quantity'] -= 1;
                                      // controller.storeQuantityDeccreament(
                                      //     widget.i, false);
                                      //----
                                      // controller.decrement(
                                      //   widget.item.counter);
                                      setState(() {
                                        //controllers[index].decrement();//____
                                        widget.item.counter--;
                                        widget.item.quantityPrice -=
                                            widget.onePiecePrice;
                                        // sum -= widget.onePiecePrice;
                                        controller
                                            .decrementSum(widget.onePiecePrice);
                                      });
                                    },
                                    icon: const Icon(
                                      size: 18,
                                      Icons.remove,
                                      color: Color(0xff003A71),
                                    ),
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      controller.isDeleteClicked(widget.i);
                                      controller
                                          .decrementSum(widget.onePiecePrice);
                                      //basketItems.removeAt(widget.i);

                                      controller.delete(widget.i);
                                      controller.update();
                                    });
                                  },
                                  icon: const Icon(
                                    size: 18,
                                    Icons.delete,
                                    color: Color(0xff003A71),
                                  ),
                                ),
                        ],
                      );
                    }),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: const Color(0xff013a71).withOpacity(.2),
            endIndent: 50,
            indent: 50,
          ),
        ],
      ),
    );
  }
}
