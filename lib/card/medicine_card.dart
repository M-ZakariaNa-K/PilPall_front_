import 'package:flutter/material.dart';
import 'package:pharmacist_app/Models/get_medicine_model.dart';
import 'package:pharmacist_app/card/medicine_details.dart';
import 'package:pharmacist_app/views/medicine_details_page.dart';

bool activeFa = false;
bool activeBa = false;

class MedicineCard extends StatefulWidget {
  MedicineCard({required this.medicine});

  @override
  final MedicineModel medicine;

  @override
  State<MedicineCard> createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 200,
        width: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 11),
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                widget.medicine.commercialName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF013A71),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Divider(
                endIndent: 10,
                color: Color(0XFFDCEFFD),
                thickness: 5,
              ),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  MedicineId= widget.medicine.id;
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return MedicineDetailsPage();
                    }),
                  );
                },
                child: Container(
                  // See The Details ...
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color(0XFF88BFDD),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "See The Details...",
                      style: TextStyle(
                        color: Color(0XFF013A71),
                        fontSize: 19,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          clickNumber++;
                          if (clickNumber % 2 == 0) {
                            activeBa = true;
                          } else {
                            activeBa = false;
                          }
                        });
                      },
                      icon: Icon(
                        activeBa == true
                            ? Icons.shopping_basket
                            : Icons.shopping_basket_outlined,
                        color: const Color(0XFF013A71),
                        size: 40,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            print(clickNumberFa);
                            clickNumberFa++;

                            if (clickNumberFa % 2 == 0) {
                              activeFa = true;
                            } else {
                              activeFa = false;
                            }
                          });
                        },
                        icon: Icon(
                          activeFa == true
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: const Color(0XFF013A71),
                          size: 40,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
