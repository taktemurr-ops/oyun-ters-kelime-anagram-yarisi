import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_ters_kelime_anagram_yarisi/oyun_ters_kelime_anagram_yarisi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(anagramYarisiConfig.title.length, 33);
    expect(anagramYarisiConfig.tagline.length, 33);
    for (final s in anagramYarisiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(anagramYarisiConfig.gameId, anagramYarisiId);
    expect(anagramYarisiRules.gameId, anagramYarisiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(anagramYarisiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: anagramYarisiId, optionalMechanics: anagramYarisiRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      anagramYarisiRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(anagramYarisiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
