import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uts_mobile_programing_220010006/main.dart';
import 'package:uts_mobile_programing_220010006/models/animal.dart';

void main() {
  final mockAnimalData = [
    Animal(
      id: '1',
      speciesName: 'Megalodon',
      localName: 'hiu',
      description: 'hiu adalah hewan yang sangat buas di air, namun hiu sering diburu untuk dicari minyakknya .',
      imageUrl: 'https://www.independent.com/wp-content/uploads/2024/09/Carcharodon-carcharias-feeding-on-Mirounga-2024-08-30-SB-Channel-West-179-Large.jpeg?w=1200',
    ),
  ];

  testWidgets('HomePage renders correctly', (WidgetTester tester) async {

  
    expect(find.text('Animal Data'), findsOneWidget);

   
    expect(find.byType(ListView), findsOneWidget);

   
    expect(find.text(mockAnimalData[0].localName), findsOneWidget);
  });

  testWidgets('Navigates to DetailPage when a list item is tapped', (WidgetTester tester) async {
  


    await tester.tap(find.text(mockAnimalData[0].localName));
    await tester.pumpAndSettle();

   
    expect(find.text(mockAnimalData[0].speciesName), findsOneWidget);
    expect(find.text(mockAnimalData[0].description), findsOneWidget);
  });
}
