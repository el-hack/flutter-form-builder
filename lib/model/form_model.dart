// To parse this JSON data, do
//
//     final getUserStatResponse = getUserStatResponseFromJson(jsonString);

import 'dart:convert';

GetInputFormResponse getInputFormResponseFromJson(String str) =>
    GetInputFormResponse.fromJson(json.decode(str));

String getInputFormResponseToJson(GetInputFormResponse data) =>
    json.encode(data.toJson());

class GetInputFormResponse {
  List<FormInputModel> data;

  GetInputFormResponse({
    required this.data,
  });

  factory GetInputFormResponse.fromJson(Map<String, dynamic> json) =>
      GetInputFormResponse(
        data: List<FormInputModel>.from(
            json["data"].map((x) => FormInputModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}

class FormInputModel {
  String? label;
  String typeField;
  List<Map<String, dynamic>>? selectItem;
  bool? isRequired;

  FormInputModel({
    required this.typeField,
    this.label,
    this.selectItem,
    this.isRequired,
  });

  factory FormInputModel.fromJson(Map<String, dynamic> json) => FormInputModel(
        label: json["label"],
        selectItem: json["selectItem"]!=null? List<Map<String,dynamic>>.from(
            json["selectItem"].map((x) => x)) :null,
        typeField: json["type"],
        isRequired: json["isRequired"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "selectItem": selectItem,
        "type": typeField,
        "isRequired": isRequired,
      };
}
