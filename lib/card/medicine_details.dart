import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/Models/basket_item_model.dart';
import 'package:pharmacist_app/Models/get_medicine_details_model.dart';
import 'package:pharmacist_app/card/medicine_card.dart';
import 'package:pharmacist_app/controller/medicineController.dart';
import 'package:pharmacist_app/helper/varibles.dart';
import 'package:pharmacist_app/services/favorites/DeleteFavoriteService.dart';
import 'package:pharmacist_app/services/favorites/PostAddFavorite.dart';

num priceForCard = 0;
String imageForCard = '';
int indexOfMedicineCard = 0;

// ignore: must_be_immutable
class MedicineDetailsCard extends StatefulWidget {
  MedicineDetailsCard({
    super.key,
    required this.medicine,
    required this.indexOfMedicine,
    required this.activeBaDetails,
    required this.activeFaDetails,
  });
  final MedicineDetailsModel medicine;
  final int indexOfMedicine;
  bool activeBaDetails;
  bool activeFaDetails;

  @override
  State<MedicineDetailsCard> createState() => _MedicineDetailsCardState();
}

class _MedicineDetailsCardState extends State<MedicineDetailsCard> {
  @override
  Widget build(BuildContext context) {
    indexOfMedicineCard = widget.indexOfMedicine;
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const CircleAvatar(
          radius: 120,
          backgroundColor: Color(0XFF88BFDD),
          child: CircleAvatar(
            radius: 115,
            backgroundImage: NetworkImage(
                //medicine.image
                'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: GetBuilder(
                  init: MedicineController(),
                  builder: (controller) {
                    //=========================Change The color of Icon=========================
                    var elementToCheck = {
                      'quantity': 1,
                      'medicine_id': widget.medicine.id,
                    };
                    bool isContained = basketItemsPlaceOrderList1.any(
                      (item) =>
                          item['quantity'] == elementToCheck['quantity'] &&
                          item['medicine_id'] == elementToCheck['medicine_id'],
                    );

                    // Set color based on the isContained condition
                    Color buttonColor = isContained
                        ? const Color(0XFF88BFDD)
                        : const Color(0XFF88BFDD);
                    //=========================Change The color of Icon=========================

                    return IconButton(
                        onPressed: () {
                          imageForCard =
                              'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
                          //widget.medicine.image;
                          priceForCard = widget.medicine.price;

//if exist in list of POST request don't do any thing
                          //------------------------------------------------------
                          setState(() {
                            var elementToCheck = {
                              'quantity': 1,
                              'medicine_id': widget.medicine.id,
                            };
                            //The any method is used to check if any element in the list satisfies a given condition.
                            //it's instead of FOR loop
                            bool isContained = basketItemsPlaceOrderList1.any(
                                (item) =>
                                    item['quantity'] ==
                                        elementToCheck['quantity'] &&
                                    item['medicine_id'] ==
                                        elementToCheck['medicine_id']);

                            if (isContained) {
                              basketItemsPlaceOrderList1.removeWhere((item) =>
                                  item['quantity'] ==
                                      elementToCheck['quantity'] &&
                                  item['medicine_id'] ==
                                      elementToCheck['medicine_id']);
                              print('Item is contained, removing...');
                              isBaClickedPublic = false;
                            } else {
                              basketItemsPlaceOrderList1.add(elementToCheck);
                              print('Item is not contained, adding...');
                              isBaClickedPublic = true;
                            }
                            print('Basket Items: $basketItemsPlaceOrderList1');
                            // for (var item in basketItemsPlaceOrderList1) {
                            //   if (item['quantity'] ==
                            //           elementToCheck['quantity'] &&
                            //       item['medicine_id'] ==
                            //           elementToCheck['medicine_id']) {
                            //     isContained = true;
                            //     break;
                            //   }
                            // }

                            //------------------------------------------------------
//if exist in list of UI don't do any thing
                            //add to cart
                            //-----------------------------------------------------
                            var elementToCheck2 = BasketItemModel(
                              name: widget.medicine.commercialName,
                              quantityPrice: widget.medicine.price,
                              image:
                                  'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                              counter: 1,
                            );
                            bool isContained2 =
                                basketItems.contains(elementToCheck2);
                            if (isContained2) {
                              print(
                                  'Item is contained in basketItems, removing...');
                              basketItems.remove(elementToCheck2);
                            } else {
                              print(
                                  'Item is not contained in basketItems, adding...');
                              basketItems.add(elementToCheck2);
                            }
                            print(
                                'Basket Items Place Order List: $basketItemsPlaceOrderList1');
                            print('Basket Items: $basketItems');
                            //----------------------------------------------------

                            //====================Change color====================
                            // Set the color dynamically based on the isContained condition
                            buttonColor = isContained
                                ? const Color(0XFF88BFDD)
                                : buttonColor;
                          });
                        },
                        //color of button
                        icon: Icon(
                          isBaClickedPublic == true
                              ? Icons.shopping_basket
                              : Icons.shopping_basket_outlined,
                          color: buttonColor,
                          size: 55,
                        ));
                  }),
            ),
            //==========================================FAVORITE=====================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: IconButton(
                onPressed: () {
                  // Toggle between adding and removing from favorites
                  if (isFaClickedPublic) {
                    DeleteFavoriteService().deleteFavoriteService(
                      medicineId: widget.medicine.id,
                      token: tokenVar!,
                    );
                    //update the state
                    setState(() {
                      isFaClickedPublic = false;
                      widget.activeFaDetails = false;
                    });
                  } else {
                    // Perform POST request to add to favorites
                    PostAddFavoriteService().postAddFavoriteService(
                      str: strVar,
                      token: tokenVar!,
                      medicineId: widget.medicine.id,
                    );
                    //update the state
                    setState(() {
                      isFaClickedPublic = true;
                      widget.activeFaDetails = true;
                    });
                  }
                },
                icon: Icon(
                  isFaClickedPublic
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: const Color(0XFF88BFDD),
                  size: 55,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Text(
                "scientificName".tr,
                style: const TextStyle(
                    color: Color(0XFF88BFDD),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                widget.medicine.scientificName,
                style: const TextStyle(
                  color: Color(0XFF013A71),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0XFF88BFDD),
          thickness: 2,
          endIndent: 30,
          indent: 30,
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Text(
                "commercialName".tr,
                style: const TextStyle(
                    color: Color(0XFF88BFDD),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                widget.medicine.commercialName,
                style: const TextStyle(
                  color: Color(0XFF013A71),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0XFF88BFDD),
          thickness: 2,
          endIndent: 30,
          indent: 30,
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Text(
                "category1".tr,
                style: const TextStyle(
                    color: Color(0XFF88BFDD),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${widget.medicine.category[0].name}',
                style: const TextStyle(
                  color: Color(0XFF013A71),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0XFF88BFDD),
          thickness: 2,
          endIndent: 30,
          indent: 30,
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Text(
                "manufactureCompany".tr,
                style: const TextStyle(
                    color: Color(0XFF88BFDD),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${widget.medicine.company.name}',
                style: const TextStyle(
                  color: Color(0XFF013A71),
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0XFF88BFDD),
          thickness: 2,
          endIndent: 30,
          indent: 30,
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Text(
                "quantityAvaliable".tr,
                style: const TextStyle(
                    color: Color(0XFF88BFDD),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${widget.medicine.quantity}',
                style: const TextStyle(
                  color: Color(0XFF013A71),
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0XFF88BFDD),
          thickness: 2,
          endIndent: 30,
          indent: 30,
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Text(
                "expirationDate".tr,
                style: const TextStyle(
                    color: Color(0XFF88BFDD),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                widget.medicine.expirationDate,
                style: const TextStyle(
                    color: Color(0XFF013A71),
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0XFF88BFDD),
          thickness: 2,
          endIndent: 30,
          indent: 30,
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Text(
                "medicinePrice".tr,
                style: const TextStyle(
                    color: Color(0XFF88BFDD),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${widget.medicine.price}',
                style: const TextStyle(
                  color: Color(0XFF013A71),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
