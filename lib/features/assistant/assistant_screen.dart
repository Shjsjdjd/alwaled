
import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class AssistantScreen extends StatefulWidget {
  const AssistantScreen({super.key});

  @override
  State<AssistantScreen> createState() => _AssistantScreenState();
}

class _AssistantScreenState extends State<AssistantScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _inputFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _messages = [];

  bool get _hasConversation => _messages.isNotEmpty;

  final List<String> _suggestions = [
    'Best places to visit in Damascus',
    'Find a hotel within my budget',
    'Where can I park near this attraction?',
  ];

  void _sendMessage([String? suggestion]) {
    final text = (suggestion ?? _controller.text).trim();

    if (text.isEmpty) return;

    setState(() {
      _messages.add({
        'text': text,
        'isUser': true,
      });

      _controller.clear();

      // Temporary sample response.
      _messages.add({
        'text': 'Here are three places to start '
            '(sample recommendations):',
        'isUser': false,
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
_inputFocusNode.dispose();
_scrollController.dispose();
super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ivory,
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Syria AI Assistant',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryGreen,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 32,
                    height: 2,
                    color: AppTheme.gold,
                  ),
                  if (!_hasConversation) ...[
                    const SizedBox(height: 12),
                    const Text(
                      'Ask about places, hotels, food and parking',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppTheme.textMuted,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // CHAT CONTENT
            Expanded(
              child: _hasConversation
                  ? _buildConversation()
                  : _buildWelcome(),
            ),

            // MESSAGE INPUT
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcome() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 85),

          Container(
            width: 92,
            height: 92,
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: CircleAvatar(
                radius: 30,
                backgroundColor: AppTheme.primaryGreen,
                child: Icon(
                  Icons.auto_awesome,
                  color: AppTheme.gold,
                  size: 30,
                ),
              ),
            ),
          ),

          const SizedBox(height: 35),

          const Text(
            'How can I help you?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryGreen,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'I can suggest attractions, hotels, restaurants\n'
            'and parking. Answers are illustrative for now.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              color: AppTheme.textMuted,
            ),
          ),

          const SizedBox(height: 32),

          ..._suggestions.map(
            (suggestion) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => _sendMessage(suggestion),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppTheme.textDark.withValues(alpha: 0.12),
                      ),
                    ),
                    child: Text(
                      suggestion,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppTheme.textDark,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConversation() {
    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      children: [
        ..._messages.map((message) {
          if (message['isUser'] == true) {
            return Align(
              alignment: Alignment.centerRight,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 280),
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.primaryGreen,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  message['text'],
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: AppTheme.primaryGreen,
                    child: Icon(
                      Icons.auto_awesome,
                      color: AppTheme.gold,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: AppTheme.border),
                      ),
                      child: Text(
                        message['text'],
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppTheme.textDark,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              _recommendationCard(
                'Umayyad Mosque',
                'Historic site',
                Icons.mosque_outlined,
              ),

              _recommendationCard(
                'Azm Palace',
                'Museum',
                Icons.account_balance_outlined,
              ),

              _recommendationCard(
                'Al-Hamidiyya Souq',
                'Traditional market',
                Icons.storefront_outlined,
              ),

              const SizedBox(height: 20),

              const Center(
                child: Text(
                  'Sample conversation. No live AI yet.',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppTheme.textMuted,
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  Widget _recommendationCard(
    String name,
    String category,
    IconData icon,
  ) {
    return Container(
      height: 74,
      margin: const EdgeInsets.only(left: 40, bottom: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppTheme.primaryGreen,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppTheme.textMuted,
                  ),
                ),
              ],
            ),
          ),

          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Destination details will be connected later.'),
                ),
              );
            },
            child: const Text('View'),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 16),
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: AppTheme.textDark.withValues(alpha: 0.07),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
  controller: _controller,
  focusNode: _inputFocusNode,
  autofocus: false,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendMessage(),
              decoration: const InputDecoration(
                hintText: 'Ask about Syria...',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: AppTheme.textMuted,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 24),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: IconButton(
              onPressed: _sendMessage,
              style: IconButton.styleFrom(
                backgroundColor: AppTheme.primaryGreen,
                foregroundColor: Colors.white,
                fixedSize: const Size(36, 36),
              ),
              icon: const Icon(
                Icons.arrow_forward,
                size: 19,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

