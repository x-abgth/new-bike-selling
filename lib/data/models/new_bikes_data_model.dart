import 'dart:convert';

List<NewBikesDataModel> newBikesDataModelFromJson(String str) =>
    List<NewBikesDataModel>.from(
        json.decode(str).map((x) => NewBikesDataModel.fromJson(x)));

String newBikesDataModelToJson(List<NewBikesDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewBikesDataModel {
  NewBikesDataModel({
    this.id,
    this.mName,
    this.mColor,
    this.mCategory,
    this.mMileage,
    this.mDisplacement,
    this.mEngine,
    this.mCylinders,
    this.mPower,
    this.mTorque,
    this.mFuelTank,
    this.mAbs,
    this.mKeyFeatures,
    this.mImageA,
    this.mImageB,
    this.mImageC,
    this.mPrice,
  });

  String id;
  String mName;
  String mColor;
  String mCategory;
  String mMileage;
  String mDisplacement;
  String mEngine;
  String mCylinders;
  String mPower;
  String mTorque;
  String mFuelTank;
  String mAbs;
  String mKeyFeatures;
  String mImageA;
  String mImageB;
  String mImageC;
  String mPrice;

  factory NewBikesDataModel.fromJson(Map<String, dynamic> json) =>
      NewBikesDataModel(
        id: json["id"],
        mName: json["m_name"],
        mColor: json["m_color"],
        mCategory: json["m_category"],
        mMileage: json["m_mileage"],
        mDisplacement: json["m_displacement"],
        mEngine: json["m_engine"],
        mCylinders: json["m_cylinders"],
        mPower: json["m_power"],
        mTorque: json["m_torque"],
        mFuelTank: json["m_fuel_tank"],
        mAbs: json["m_abs"],
        mKeyFeatures: json["m_key_features"],
        mImageA: json["m_image_a"],
        mImageB: json["m_image_b"],
        mImageC: json["m_image_c"],
        mPrice: json["m_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "m_name": mName,
        "m_color": mColor,
        "m_category": mCategory,
        "m_mileage": mMileage,
        "m_displacement": mDisplacement,
        "m_engine": mEngine,
        "m_cylinders": mCylinders,
        "m_power": mPower,
        "m_torque": mTorque,
        "m_fuel_tank": mFuelTank,
        "m_abs": mAbs,
        "m_key_features": mKeyFeatures,
        "m_image_a": mImageA,
        "m_image_b": mImageB,
        "m_image_c": mImageC,
        "m_price": mPrice,
      };
}
