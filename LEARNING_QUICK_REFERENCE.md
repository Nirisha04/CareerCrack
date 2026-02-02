# Learning Module Enhancements - Quick Reference & Examples

## 🚀 Quick Start

### 1. Import the new services and models
```dart
import 'package:yourapp/models/progress_model.dart';
import 'package:yourapp/services/learning_service_enhanced.dart';
```

### 2. Use via LearningController (Already integrated)
```dart
final LearningController learningController = Get.find<LearningController>();
```

---

## 💡 Common Use Cases

### Use Case 1: User completes a learning content
```dart
// When user finishes reading notes
await learningController.updateContentProgress(
  contentId: 'apt_notes_1',
  categoryId: 'aptitude',
  progressPercentage: 100,
  isCompleted: true,
);

// Display completion
Get.snackbar('Completed', 'You have completed this lesson!');

// Move to next content
```

### Use Case 2: Save video progress and resume later
```dart
// While watching video (update every 5 sec)
VideoPlayerController videoController = ...;
videoController.addListener(() async {
  if (videoController.value.isInitialized) {
    await learningController.saveVideoProgress(
      videoId: 'apt_video_1',
      position: videoController.value.position,
      totalDuration: videoController.value.duration,
    );
  }
});

// On next video open - resume from saved position
Duration? savedPosition = await learningController.getVideoProgress('apt_video_1');
await videoController.seekTo(savedPosition ?? Duration.zero);
```

### Use Case 3: Track reading progress in PDF
```dart
// When user navigates pages in PDF viewer
await learningController.savePDFProgress(
  pdfId: 'apt_pdf_1',
  currentPage: pdfViewController.page + 1,
  totalPages: pdfViewController.pagesCount,
);

// Show progress indicator
Obx(() {
  var progress = learningController.contentProgressMap['apt_pdf_1'];
  int percent = progress?.progressPercentage ?? 0;
  return LinearProgressIndicator(value: percent / 100);
});
```

### Use Case 4: Create comprehensive study notes
```dart
// Create note with highlighted concepts
await learningController.saveNote(
  contentId: 'dsa_arrays_notes',
  title: 'Array Data Structure - Key Concepts',
  body: '''
Arrays are the most fundamental data structures.
They store elements in contiguous memory locations.
''',
  keywords: [
    HighlightedKeyword(
      word: 'contiguous memory',
      color: '#FFD700', // Gold
      definition: 'Adjacent memory locations without gaps',
    ),
    HighlightedKeyword(
      word: 'O(1) access',
      color: '#00FF00', // Green
      definition: 'Random access in constant time',
    ),
  ],
  bullets: [
    NoteBullet(text: 'Definition', indentLevel: 0),
    NoteBullet(text: 'Fixed-size collection of elements', indentLevel: 1),
    NoteBullet(text: 'Same data type', indentLevel: 2),
    NoteBullet(text: 'Advantages', indentLevel: 0),
    NoteBullet(text: 'Fast access - O(1)', indentLevel: 1, isChecked: true),
    NoteBullet(text: 'Disadvantages', indentLevel: 0),
    NoteBullet(text: 'Fixed size - cannot resize', indentLevel: 1, isChecked: false),
  ],
);
```

### Use Case 5: Search and filter learning content
```dart
// Simple search by keyword
List<LearningContent> results = 
  await learningController.searchContent('binary search');

// Filter by difficulty
learningController.setDifficultyFilter('Advanced');

// Filter by content type
learningController.setContentTypeFilter('videos');

// Combine search with filters
learningController.updateSearchQuery('recursion');
learningController.setDifficultyFilter('Intermediate');
learningController.setContentTypeFilter('notes');

// Get results
List<LearningContent> filtered = learningController.filteredContents;

// Build UI
ListView.builder(
  itemCount: filtered.length,
  itemBuilder: (context, index) {
    var content = filtered[index];
    return ListTile(
      title: Text(content.title),
      subtitle: Text('${content.difficulty} • ${content.type}'),
      trailing: Text('${content.progress}%'),
    );
  },
)
```

### Use Case 6: Track category progress
```dart
// Get overall progress for a category
int categoryProgress = learningController.getCategoryCompletionPercentage('dsa');
// Example: 75 (means 75% of DSA content completed)

// Display progress card
Card(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Data Structures & Algorithms', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Obx(() {
          int progress = learningController.getCategoryCompletionPercentage('dsa');
          return Column(
            children: [
              LinearProgressIndicator(value: progress / 100),
              SizedBox(height: 8),
              Text('$progress% complete', textAlign: TextAlign.right),
            ],
          );
        }),
      ],
    ),
  ),
)
```

### Use Case 7: Offline content access
```dart
// Cache content before going offline
await learningController.cacheContentForOffline(content);

// Later, on any device (even offline)
LearningContent? offlineContent = 
  await learningController.getOfflineContent('apt_pdf_1');

if (offlineContent != null) {
  // Display cached content
  showContent(offlineContent);
} else {
  // Show offline message
  showDialog(title: 'Offline', message: 'Content not available offline');
}

// When back online, sync changes
if (await isConnectedToInternet()) {
  await learningController.syncOfflineChanges();
}
```

---

## 🎨 UI Components Examples

### Progress Tracker Widget
```dart
class CategoryProgressCard extends StatelessWidget {
  final String categoryId;
  final String categoryName;
  final LearningController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int completion = controller.getCategoryCompletionPercentage(categoryId);
      return Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(categoryName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('$completion%', style: TextStyle(color: Colors.blue)),
                ],
              ),
              SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: completion / 100,
                  minHeight: 8,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
```

### Note Editor Widget
```dart
class NoteEditorDialog extends StatefulWidget {
  final String contentId;

  @override
  State<NoteEditorDialog> createState() => _NoteEditorDialogState();
}

class _NoteEditorDialogState extends State<NoteEditorDialog> {
  final LearningController controller = Get.find();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final List<HighlightedKeyword> keywords = [];
  final List<NoteBullet> bullets = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create Note'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: 'Note Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: bodyController,
              maxLines: 5,
              decoration: InputDecoration(hintText: 'Note Content'),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.highlight),
              label: Text('Add Highlighted Keyword'),
              onPressed: _addKeywordDialog,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: Navigator.of(context).pop, child: Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            controller.saveNote(
              contentId: widget.contentId,
              title: titleController.text,
              body: bodyController.text,
              keywords: keywords,
              bullets: bullets,
            );
            Navigator.of(context).pop();
          },
          child: Text('Save Note'),
        ),
      ],
    );
  }

  void _addKeywordDialog() {
    // Implementation to add keyword dialog
  }
}
```

### Search & Filter Panel
```dart
class SearchFilterPanel extends StatelessWidget {
  final LearningController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar
        TextField(
          onChanged: controller.updateSearchQuery,
          decoration: InputDecoration(
            hintText: 'Search topics...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        SizedBox(height: 16),
        
        // Difficulty filter
        Wrap(
          spacing: 8,
          children: ['Beginner', 'Intermediate', 'Advanced'].map((level) {
            return Obx(() {
              bool isSelected = controller.selectedDifficulty.value == level;
              return FilterChip(
                label: Text(level),
                selected: isSelected,
                onSelected: (selected) {
                  controller.setDifficultyFilter(selected ? level : null);
                },
              );
            });
          }).toList(),
        ),
        SizedBox(height: 16),
        
        // Content type filter
        Obx(() {
          return DropdownButton<String>(
            value: controller.selectedContentType.value,
            items: [
              DropdownMenuItem(child: Text('All Types'), value: null),
              DropdownMenuItem(child: Text('Notes'), value: 'notes'),
              DropdownMenuItem(child: Text('Videos'), value: 'videos'),
              DropdownMenuItem(child: Text('PDFs'), value: 'pdfs'),
              DropdownMenuItem(child: Text('Quiz'), value: 'quiz'),
            ],
            onChanged: (value) => controller.setContentTypeFilter(value),
          );
        }),
        SizedBox(height: 16),
        
        // Results preview
        Obx(() {
          return Text(
            '${controller.filteredContents.length} results found',
            style: TextStyle(color: Colors.grey),
          );
        }),
      ],
    );
  }
}
```

---

## 📊 Data Flow Diagrams

### Progress Update Flow
```
User Action (completes content)
        ↓
updateContentProgress() called
        ↓
Local cache updated (SharedPreferences)
        ↓
Firestore updated
        ↓
Category progress aggregated
        ↓
UI updates via Obx
```

### Offline Sync Flow
```
Offline Mode
        ↓
Changes saved locally
        ↓
isSyncedToCloud = false
        ↓
Connection restored
        ↓
syncOfflineChanges() called
        ↓
All local changes → Firestore
        ↓
isSyncedToCloud = true
        ↓
UI confirms sync
```

### Search & Filter Flow
```
User types search query
        ↓
updateSearchQuery() called
        ↓
Reactive listener triggered
        ↓
_applyFilters() executed
        ↓
Firestore query with search + filters
        ↓
filteredContents updated
        ↓
ListView rebuilds with results
```

---

## 🧠 Best Practices

1. **Always check user auth** before updating progress:
   ```dart
   if (_auth.currentUser != null) {
     // Proceed with update
   }
   ```

2. **Debounce search queries** to avoid excessive Firestore reads:
   ```dart
   // Already handled in _applyFilters()
   ```

3. **Cache frequently accessed content** offline:
   ```dart
   // Call when content is first viewed
   await learningController.cacheContentForOffline(content);
   ```

4. **Update video/PDF progress periodically**, not on every frame:
   ```dart
   Timer.periodic(Duration(seconds: 5), (_) {
     saveVideoProgress(...);
   });
   ```

5. **Combine filters instead of sequential filtering** for better performance:
   ```dart
   // Good: One query with all filters
   // Bad: Query → filter by difficulty → filter by type
   ```

---

## ❌ Common Pitfalls to Avoid

1. ❌ **Not checking internet before syncing**
   ```dart
   // Don't do this
   await learningController.syncOfflineChanges();
   
   // Do this
   if (await hasInternetConnection()) {
     await learningController.syncOfflineChanges();
   }
   ```

2. ❌ **Updating progress on every UI rebuild**
   ```dart
   // Don't do this (in build method)
   await learningController.updateContentProgress(...);
   
   // Do this (on user action)
   ElevatedButton(
     onPressed: () async {
       await learningController.updateContentProgress(...);
     },
   )
   ```

3. ❌ **Not initializing LearningService**
   ```dart
   // Don't forget
   await _learningService.initialize();
   ```

4. ❌ **Ignoring sync status**
   ```dart
   // Check if synced
   if (note.isSyncedToCloud) {
     // Safe to delete locally
   } else {
     // Still uploading, don't delete
   }
   ```

---

## 📱 Integration with Existing Views

### Learning Category View
```dart
// In learning_category_view.dart
@override
Widget build(BuildContext context) {
  return Obx(() {
    return ListView.builder(
      itemCount: controller.filteredContents.length,
      itemBuilder: (context, index) {
        var content = controller.filteredContents[index];
        var progress = controller.getContentProgress(content.id);
        var isCompleted = controller.isContentCompleted(content.id);
        
        return ListTile(
          title: Text(content.title),
          subtitle: Text(content.difficulty ?? 'All'),
          trailing: isCompleted ? Icon(Icons.check_circle) : Text('$progress%'),
          onTap: () {
            // Navigate to content detail with progress tracking
          },
        );
      },
    );
  });
}
```

### Learning Content View
```dart
// In learning_content_view.dart
@override
Widget build(BuildContext context) {
  return Column(
    children: [
      // Progress bar
      Obx(() {
        int progress = controller.getContentProgress(widget.contentId);
        return LinearProgressIndicator(value: progress / 100);
      }),
      
      // Content based on type
      if (widget.content.type == 'notes') {
        NotesView(content: widget.content)
      } else if (widget.content.type == 'videos') {
        VideoPlayerWithProgress(videoId: widget.content.id)
      } else if (widget.content.type == 'pdfs') {
        PDFViewerWithProgress(pdfId: widget.content.id)
      },
      
      // Note editor button
      FloatingActionButton(
        onPressed: () => showNoteEditorDialog(widget.contentId),
        child: Icon(Icons.note_add),
      ),
    ],
  );
}
```

---

**For more details, see**: [LEARNING_MODULE_ENHANCEMENTS.md](LEARNING_MODULE_ENHANCEMENTS.md)

