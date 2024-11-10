// ignore_for_file: constant_identifier_names

class MidiConstants {
  static const int NOTE_OFF = 0x80;
  static const int NOTE_ON = 0x90;
  static const int POLYPHONIC_KEY_PRESSURE = 0xA0;
  static const int CONTROL_CHANGE = 0xB0;
  static const int PROGRAM_CHANGE = 0xC0;
  static const int CHANNEL_PRESSURE = 0xD0;
  static const int PITCH_BEND_CHANGE = 0xE0;
  static const int SYSTEM_EXCLUSIVE_START = 0xF0;
  static const int TIME_CODE_QUARTER_FRAME = 0xF1;
  static const int SONG_POSITION_POINTER = 0xF2;
  static const int SONG_SELECT = 0xF3;
  static const int TUNE_REQUEST = 0xF6;
  static const int SYSTEM_EXCLUSIVE_END = 0xF7;
  static const int TIMING_CLOCK = 0xF8;
  static const int START = 0xFA;
  static const int CONTINUE = 0xFB;
  static const int STOP = 0xFC;
  static const int ACTIVE_SENSING = 0xFE;
  static const int SYSTEM_RESET = 0xFF;
}
