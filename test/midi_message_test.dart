import 'package:midi_message/midi_message.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      final bytes = [0xF0, 0x01, 0x02, 0x03, 0xF7];
      final message = MidiParser.parse(bytes);
      expect(message, isA<MIDISysExMessage>());
    });
  });
}
