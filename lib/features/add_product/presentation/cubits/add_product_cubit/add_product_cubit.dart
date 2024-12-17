import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_dashboard/features/add_product/domain/entitis/product_entity.dart';
import 'package:fruits_dashboard/features/add_product/domain/repos/product_repo.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.productRepo}) : super(AddProductInitial());

  final ProductRepo productRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price;
  late int expirationMonths;
  late int numberOfCalories, unitWeight;
  bool isFeatired = false, isOrganic = false;
  File? selectedImage;
  int numberOfRating = 0;
  num avgRating = 0;
  String? imageUrl;

  Future<void> addProduct() async {
    emit(
      AddProductLoading(),
    );
    var resulte = await productRepo.uploadFile(file: selectedImage!);
    resulte.fold(
      (failure) {
        emit(
          AddProductFailure(errMessage: failure.errMessage),
        );
      },
      (fileUrl) async {
        imageUrl = fileUrl;
        var resulte = await productRepo.addProduct(
          product: ProductEntity(
            imageUrl: imageUrl,
            name: name,
            code: code,
            price: price,
            description: description,
            expirationMonths: expirationMonths,
            isOrganic: isOrganic,
            numberOfCalories: numberOfCalories,
            unitWeight: unitWeight,
            isFeatured: isFeatired,
            avgRating: avgRating,
            numberOfRating: numberOfRating,
            reviews: null,
          ),
        );
        resulte.fold(
          (failure) {
            emit(
              AddProductFailure(errMessage: failure.errMessage),
            );
          },
          (r) {
            emit(
              AddProductSuccess(),
            );
          },
        );
      },
    );
  }
}
