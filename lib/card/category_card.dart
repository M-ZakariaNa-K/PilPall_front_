import 'package:flutter/material.dart';
import 'package:pharmacist_app/Models/get_categories_models.dart';
import 'package:pharmacist_app/views/medicines_categories_page.dart';
import 'package:pharmacist_app/views/medicine_page.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, required this.category});
  CategoriesModels category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return CategoryMedicinePage(
              category_id: category.id,
            );
          }),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 100,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Padding(
                padding: const EdgeInsets.all(22),
                child: Image(
                  image: NetworkImage(
                      //medicine.image
                      'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Text(
                  category.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0XFF013A71),
                    fontSize: 27,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
