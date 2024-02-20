import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacist_app/Models/get_medicine_model.dart';

import 'package:pharmacist_app/views/medicine_details_page.dart';


/*
varaibels between card and details
 */
bool isFaClickedPublic = false;
bool isBaClickedPublic = false;
/*
varaibels between card and details
 */
bool activeFa = false;
bool activeBa = false;

// ignore: must_be_immutable
class MedicineCard extends StatefulWidget {
  MedicineCard({
    super.key,
    required this.medicine,
    required this.ifFaclicked,
    required this.ifBaclicked,
    required this.indexOfCard,

  });

  final MedicineModel medicine;
  bool ifBaclicked;
  bool ifFaclicked;
  final int indexOfCard;
  @override
  State<MedicineCard> createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.only(bottom: 15),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF88BFDD),
              Color(0xFFDCEFFD),
              Color(0xFF003A71),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(0)),
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset(
                  'assets/images/syringe.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                widget.medicine.commercialName,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xff003A71),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                MedicineId = widget.medicine.id;
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const MedicineDetailsPage();
                  }),
                );
              },
              child: Container(
                // See The Details ...

                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: const Color(0XFF88BFDD),
                  borderRadius: BorderRadius.circular(20),
                ),
                child:  Center(
                  child: Text(
                    "seeDetailes".tr,
                    style: const TextStyle(
                      color: Color(0XFF013A71),
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Container(
      //   height: 200,
      //   width: 90,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 11),
      //     child: Column(
      //       children: [
      //         const SizedBox(
      //           height: 16,
      //         ),
      //         Text(
      //           widget.medicine.commercialName,
      //           textAlign: TextAlign.center,
      //           style: const TextStyle(
      //             color: Color(0XFF013A71),
      //             fontSize: 24,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //         // SizedBox(
      //         //   height: 7,
      //         // ),
      //         // Divider(
      //         //   endIndent: 10,
      //         //   color: Color(0XFFDCEFFD),
      //         //   thickness: 5,
      //         // ),
      //         // SizedBox(
      //         //   height: 16,
      //         // ),
      //         GestureDetector(
      //           onTap: () {
      //             MedicineId = widget.medicine.id;
      //             Navigator.of(context).push(
      //               MaterialPageRoute(builder: (context) {
      //                 return MedicineDetailsPage();
      //               }),
      //             );
      //           },
      //           child: Container(
      //             // See The Details ...
      //             height: 40,
      //             width: 200,
      //             decoration: BoxDecoration(
      //               color: const Color(0XFF88BFDD),
      //               borderRadius: BorderRadius.circular(20),
      //             ),
      //             child: const Center(
      //               child: Text(
      //                 "See The Details...",
      //                 style: TextStyle(
      //                   color: Color(0XFF013A71),
      //                   fontSize: 19,
      //                   decoration: TextDecoration.underline,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 16,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
