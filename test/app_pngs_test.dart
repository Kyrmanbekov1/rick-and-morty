import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/resources/resources.dart';

void main() {
  test('app_pngs assets test', () {
    expect(File(AppPngs.rectangle63).existsSync(), isTrue);
    expect(File(AppPngs.backgroundsplash).existsSync(), isTrue);
    expect(File(AppPngs.character).existsSync(), isTrue);
    expect(File(AppPngs.episodes).existsSync(), isTrue);
    expect(File(AppPngs.errorcharacter).existsSync(), isTrue);
    expect(File(AppPngs.filter).existsSync(), isTrue);
    expect(File(AppPngs.grid).existsSync(), isTrue);
    expect(File(AppPngs.list).existsSync(), isTrue);
    expect(File(AppPngs.location).existsSync(), isTrue);
    expect(File(AppPngs.settings).existsSync(), isTrue);
    expect(File(AppPngs.startpage).existsSync(), isTrue);
  });
}
