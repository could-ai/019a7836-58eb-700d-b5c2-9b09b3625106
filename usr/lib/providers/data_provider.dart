import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/song.dart';
import '../models/setlist.dart';
import '../models/event.dart';
import '../models/composition.dart';
import '../models/checklist_item.dart';
import '../models/transaction.dart';

class DataProvider with ChangeNotifier {
  // Mock data storage - will be replaced with Supabase when connected
  final List<Song> _songs = [];
  final List<Setlist> _setlists = [];
  final List<Event> _events = [];
  final List<Composition> _compositions = [];
  final List<ChecklistItem> _checklistItems = [];
  final List<Transaction> _transactions = [];

  final _uuid = const Uuid();

  // Getters
  List<Song> get songs => _songs;
  List<Setlist> get setlists => _setlists;
  List<Event> get events => _events;
  List<Composition> get compositions => _compositions;
  List<ChecklistItem> get checklistItems => _checklistItems;
  List<Transaction> get transactions => _transactions;

  // Songs
  void addSong(Song song) {
    _songs.add(song);
    notifyListeners();
  }

  void updateSong(Song song) {
    final index = _songs.indexWhere((s) => s.id == song.id);
    if (index != -1) {
      _songs[index] = song;
      notifyListeners();
    }
  }

  void deleteSong(String id) {
    _songs.removeWhere((s) => s.id == id);
    notifyListeners();
  }

  Song? getSongById(String id) {
    try {
      return _songs.firstWhere((s) => s.id == id);
    } catch (e) {
      return null;
    }
  }

  // Setlists
  void addSetlist(Setlist setlist) {
    _setlists.add(setlist);
    notifyListeners();
  }

  void updateSetlist(Setlist setlist) {
    final index = _setlists.indexWhere((s) => s.id == setlist.id);
    if (index != -1) {
      _setlists[index] = setlist;
      notifyListeners();
    }
  }

  void deleteSetlist(String id) {
    _setlists.removeWhere((s) => s.id == id);
    notifyListeners();
  }

  Setlist? getSetlistById(String id) {
    try {
      return _setlists.firstWhere((s) => s.id == id);
    } catch (e) {
      return null;
    }
  }

  String generateShareLink(String setlistId) {
    final shareLink = 'https://artistpro.app/setlist/$setlistId';
    final setlist = getSetlistById(setlistId);
    if (setlist != null) {
      updateSetlist(setlist.copyWith(shareLink: shareLink));
    }
    return shareLink;
  }

  // Events
  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }

  void updateEvent(Event event) {
    final index = _events.indexWhere((e) => e.id == event.id);
    if (index != -1) {
      _events[index] = event;
      notifyListeners();
    }
  }

  void deleteEvent(String id) {
    _events.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  // Compositions
  void addComposition(Composition composition) {
    _compositions.add(composition);
    notifyListeners();
  }

  void updateComposition(Composition composition) {
    final index = _compositions.indexWhere((c) => c.id == composition.id);
    if (index != -1) {
      _compositions[index] = composition;
      notifyListeners();
    }
  }

  void deleteComposition(String id) {
    _compositions.removeWhere((c) => c.id == id);
    notifyListeners();
  }

  // Checklist Items
  void addChecklistItem(ChecklistItem item) {
    _checklistItems.add(item);
    notifyListeners();
  }

  void updateChecklistItem(ChecklistItem item) {
    final index = _checklistItems.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      _checklistItems[index] = item;
      notifyListeners();
    }
  }

  void deleteChecklistItem(String id) {
    _checklistItems.removeWhere((i) => i.id == id);
    notifyListeners();
  }

  void toggleChecklistItem(String id) {
    final index = _checklistItems.indexWhere((i) => i.id == id);
    if (index != -1) {
      final item = _checklistItems[index];
      _checklistItems[index] = item.copyWith(completed: !item.completed);
      notifyListeners();
    }
  }

  // Transactions
  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  void updateTransaction(Transaction transaction) {
    final index = _transactions.indexWhere((t) => t.id == transaction.id);
    if (index != -1) {
      _transactions[index] = transaction;
      notifyListeners();
    }
  }

  void deleteTransaction(String id) {
    _transactions.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  // Financial calculations
  double get totalIncome {
    return _transactions
        .where((t) => t.type == TransactionType.income)
        .fold(0, (sum, t) => sum + t.amount);
  }

  double get totalExpenses {
    return _transactions
        .where((t) => t.type == TransactionType.expense)
        .fold(0, (sum, t) => sum + t.amount);
  }

  double get balance => totalIncome - totalExpenses;

  String generateId() => _uuid.v4();
}
