/*
 * @ Author: Flutter Journey 🎯 <flutterjourney.org@gmail.com>
 * @ Created: 2024-12-06 08:14:53
 * @ Message: You look very hardworking 👨‍💻. Keep focusing on your goals. 🌤️
 */

import 'package:flutter/material.dart';

const double scaleFraction = 0.7;
const double fullScale = 1.0;
const double pagerHeight = 190.0;

class Coffee {
  final String image;
  final int price;
  final String title;
  final String description;
  final Color backgroundColor;

  Coffee({
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.backgroundColor,
  });
}

List<Coffee> coffeeList = [
  Coffee(
    title: "Bạc Xỉu",
    image: "assets/Products__BAC_XIU.png",
    price: 35000,
    description:
        "Bạc Xỉu là sự kết hợp tinh tế giữa cà phê phin đậm đà và sữa đặc ngọt ngào. Thức uống này mang đến cảm giác mềm mịn, dễ uống và là lựa chọn tuyệt vời cho những ai yêu thích vị cà phê nhẹ nhàng nhưng đầy hương sắc.",
    backgroundColor: const Color(0xffb71c1c),
  ),
  Coffee(
    title: "Caramel Freeze PhinDi",
    image: "assets/Products__CARAMEL_FREEZE_PHINDI.png",
    price: 49000,
    description:
        "Sự kết hợp hoàn hảo giữa cà phê phin Highlands đậm đà và hương caramel ngọt ngào tạo nên một thức uống mát lạnh, thơm ngon và đầy hấp dẫn. Đây là sự lựa chọn tuyệt vời cho những ai yêu thích vị ngọt nhẹ nhưng không mất đi cái đậm đà đặc trưng của cà phê.",
    backgroundColor: const Color(0xffe65100),
  ),
  Coffee(
    title: "Freeze Trà Xanh",
    image: "assets/Products__FREEZE_TRA_XANH.png",
    price: 45000,
    description:
        "Thức uống mát lạnh với sự kết hợp tuyệt vời giữa trà xanh thanh mát và lớp kem mềm mịn. Đây là lựa chọn lý tưởng cho những ngày hè oi ả, mang đến cảm giác thư giãn và nhẹ nhàng cho cơ thể và tâm trí.",
    backgroundColor: const Color(0xff388e3c),
  ),
  Coffee(
    title: "PhinDi Hạnh Nhân",
    image: "assets/Products__PHINDI_HANH_NHAN.png",
    price: 47000,
    description:
        "PhinDi kết hợp cùng hương hạnh nhân bùi bùi, mang đến một trải nghiệm mới lạ cho những ai yêu thích sự hòa quyện giữa cà phê đậm đà và vị ngọt bùi của hạnh nhân. Thức uống này mang đến sự ấm áp, vừa lạ vừa quen, hoàn hảo cho mọi khoảnh khắc thư giãn.",
    backgroundColor: const Color(0xff8e24aa),
  ),
  Coffee(
    title: "PhinDi Kem Sữa",
    image: "assets/Products__PHINDI_KEM_SUA.png",
    price: 36000,
    description:
        "Phin cà phê đậm đà kết hợp với lớp kem sữa ngọt ngào tạo nên một thức uống hài hòa giữa vị đắng của cà phê và sự béo ngậy của kem. Đây là lựa chọn lý tưởng cho những ai yêu thích sự cân bằng giữa vị đắng và ngọt trong mỗi ngụm cà phê.",
    backgroundColor: const Color(0xff1976d2),
  ),
  Coffee(
    title: "Trà Sen Vàng Củ Năng",
    image: "assets/Products__TRA_SEN_VANG_CU_NANG.png",
    price: 42000,
    description:
        "Trà sen vàng thơm mát kết hợp cùng củ năng giòn sần sật tạo nên một thức uống thanh khiết, nhẹ nhàng nhưng đầy sức sống. Đây là sự lựa chọn lý tưởng cho những ai yêu thích các thức uống thanh mát, dễ uống và không quá ngọt.",
    backgroundColor: const Color(0xff388e3c),
  ),
  Coffee(
    title: "Trà Xanh Đậu Đỏ",
    image: "assets/Products__TRA_XANH_DAU_DO.png",
    price: 39000,
    description:
        "Trà xanh thơm dịu kết hợp cùng đậu đỏ ngọt bùi tạo nên một thức uống không chỉ tốt cho sức khỏe mà còn rất ngon miệng. Lớp topping đậu đỏ giòn giòn, ngọt ngọt làm tăng thêm sự thú vị trong mỗi ngụm trà.",
    backgroundColor: const Color(0xff6a1b9a),
  ),
  Coffee(
    title: "Trà Sen Vàng",
    image: "assets/Products__TSV.png",
    price: 38000,
    description:
        "Trà sen vàng mang đến một hương vị thanh khiết và mát mẻ, giúp bạn thư giãn và giải tỏa căng thẳng. Đây là một lựa chọn tuyệt vời cho những ai yêu thích sự nhẹ nhàng và tươi mới của trà sen.",
    backgroundColor: const Color(0xfffbc02d),
  ),
  Coffee(
    title: "PhinDi Cassia",
    image: "assets/Products_Image1.png",
    price: 45000,
    description:
        "Phin cà phê kết hợp với hương quế ấm áp tạo nên một thức uống vừa đậm đà vừa có chút ngọt ngào, mang lại cảm giác ấm áp và dễ chịu. PhinDi Cassia là lựa chọn tuyệt vời cho những buổi sáng se lạnh hoặc những khoảnh khắc cần sự ấm áp và thoải mái.",
    backgroundColor: const Color(0xff8d6e63),
  ),
];
