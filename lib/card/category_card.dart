
import 'package:flutter/material.dart';
import 'package:pharmacist_app/Models/get_categories_models.dart';
import 'package:pharmacist_app/views/medicine_page.dart';


class CategoryCard extends StatelessWidget {
   CategoryCard({super.key ,required this.category});
   CategoriesModels category ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return MedicinePage();
        }),);
      },
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
                    height:100,
                    width: 350 ,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(22),
                            child: Image(
                            image: AssetImage(category.image),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(left:11),
                            child: Text(category.name,
                            textAlign: TextAlign.center,
                             style:const  TextStyle(
                              color: Color(0XFF013A71),
                              fontSize:27,),
                             ),
                          ),
                        ],
                      ),
                    ),
                    
    ),
    );
  }
}