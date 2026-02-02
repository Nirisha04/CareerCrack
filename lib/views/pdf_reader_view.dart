import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PdfReaderView extends StatefulWidget {
  const PdfReaderView({super.key});

  @override
  State<PdfReaderView> createState() => _PdfReaderViewState();
}

class _PdfReaderViewState extends State<PdfReaderView> {
  PdfController? _pdfController;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    final pdf = Get.arguments;
    final pdfUrl = pdf['url'] ?? '';

    try {
      // Fetch PDF bytes from network
      final response = await http.get(Uri.parse(pdfUrl));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        _pdfController = PdfController(document: PdfDocument.openData(bytes));
        setState(() {
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'Failed to load PDF: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error loading PDF: $e';
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _pdfController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pdf = Get.arguments;
    final pdfTitle = pdf['title'] ?? 'PDF Reader';

    return Scaffold(
      appBar: AppBar(title: Text(pdfTitle)),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(child: Text(_error!))
          : PdfView(
              controller: _pdfController!,
              scrollDirection: Axis.vertical,
              // renderer: PdfViewRenderer.flutter,
            ),
    );
  }
}
