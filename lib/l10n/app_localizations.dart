import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Syria Discover'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @assistant.
  ///
  /// In en, this message translates to:
  /// **'Assistant'**
  String get assistant;

  /// No description provided for @planner.
  ///
  /// In en, this message translates to:
  /// **'Planner'**
  String get planner;

  /// No description provided for @parking.
  ///
  /// In en, this message translates to:
  /// **'Parking'**
  String get parking;

  /// No description provided for @reservations.
  ///
  /// In en, this message translates to:
  /// **'Reservations'**
  String get reservations;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editProfile;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @currencyUsd.
  ///
  /// In en, this message translates to:
  /// **'Currency: USD (\$)'**
  String get currencyUsd;

  /// No description provided for @currencySettingsNotImplemented.
  ///
  /// In en, this message translates to:
  /// **'Currency settings are not implemented yet.'**
  String get currencySettingsNotImplemented;

  /// No description provided for @settingsNotImplemented.
  ///
  /// In en, this message translates to:
  /// **'Settings are not implemented yet.'**
  String get settingsNotImplemented;

  /// No description provided for @authenticationNotConnected.
  ///
  /// In en, this message translates to:
  /// **'Authentication is not connected yet.'**
  String get authenticationNotConnected;

  /// No description provided for @profileUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully.'**
  String get profileUpdated;

  /// No description provided for @defaultUserName.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get defaultUserName;

  /// No description provided for @defaultEmail.
  ///
  /// In en, this message translates to:
  /// **'user@email.com'**
  String get defaultEmail;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name.'**
  String get enterYourName;

  /// No description provided for @enterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address.'**
  String get enterValidEmail;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @askAiAboutSyria.
  ///
  /// In en, this message translates to:
  /// **'Ask AI about Syria...'**
  String get askAiAboutSyria;

  /// No description provided for @discoverSyria.
  ///
  /// In en, this message translates to:
  /// **'Discover Syria'**
  String get discoverSyria;

  /// No description provided for @exploreHistory.
  ///
  /// In en, this message translates to:
  /// **'Explore history, culture & hidden gems.'**
  String get exploreHistory;

  /// No description provided for @planTrip.
  ///
  /// In en, this message translates to:
  /// **'Plan a trip'**
  String get planTrip;

  /// No description provided for @exploreServices.
  ///
  /// In en, this message translates to:
  /// **'Explore Services'**
  String get exploreServices;

  /// No description provided for @aiAssistant.
  ///
  /// In en, this message translates to:
  /// **'AI Assistant'**
  String get aiAssistant;

  /// No description provided for @aiPlanner.
  ///
  /// In en, this message translates to:
  /// **'AI Planner'**
  String get aiPlanner;

  /// No description provided for @featuredDestinations.
  ///
  /// In en, this message translates to:
  /// **'Featured Destinations'**
  String get featuredDestinations;

  /// No description provided for @damascus.
  ///
  /// In en, this message translates to:
  /// **'Damascus'**
  String get damascus;

  /// No description provided for @damascusDescription.
  ///
  /// In en, this message translates to:
  /// **'The oldest capital'**
  String get damascusDescription;

  /// No description provided for @palmyra.
  ///
  /// In en, this message translates to:
  /// **'Palmyra'**
  String get palmyra;

  /// No description provided for @palmyraDescription.
  ///
  /// In en, this message translates to:
  /// **'Ancient city'**
  String get palmyraDescription;

  /// No description provided for @assistantTitle.
  ///
  /// In en, this message translates to:
  /// **'Syria AI Assistant'**
  String get assistantTitle;

  /// No description provided for @assistantSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Ask about places, hotels, food and parking'**
  String get assistantSubtitle;

  /// No description provided for @assistantWelcome.
  ///
  /// In en, this message translates to:
  /// **'How can I help you?'**
  String get assistantWelcome;

  /// No description provided for @assistantDescription.
  ///
  /// In en, this message translates to:
  /// **'I can suggest attractions, hotels, restaurants\nand parking. Answers are illustrative for now.'**
  String get assistantDescription;

  /// No description provided for @suggestionDamascus.
  ///
  /// In en, this message translates to:
  /// **'Best places to visit in Damascus'**
  String get suggestionDamascus;

  /// No description provided for @suggestionHotel.
  ///
  /// In en, this message translates to:
  /// **'Find a hotel within my budget'**
  String get suggestionHotel;

  /// No description provided for @suggestionParking.
  ///
  /// In en, this message translates to:
  /// **'Where can I park near this attraction?'**
  String get suggestionParking;

  /// No description provided for @sampleAssistantResponse.
  ///
  /// In en, this message translates to:
  /// **'Here are three places to start (sample recommendations):'**
  String get sampleAssistantResponse;

  /// No description provided for @umayyadMosque.
  ///
  /// In en, this message translates to:
  /// **'Umayyad Mosque'**
  String get umayyadMosque;

  /// No description provided for @historicSite.
  ///
  /// In en, this message translates to:
  /// **'Historic site'**
  String get historicSite;

  /// No description provided for @azmPalace.
  ///
  /// In en, this message translates to:
  /// **'Azm Palace'**
  String get azmPalace;

  /// No description provided for @museum.
  ///
  /// In en, this message translates to:
  /// **'Museum'**
  String get museum;

  /// No description provided for @hamidiyyaSouq.
  ///
  /// In en, this message translates to:
  /// **'Al-Hamidiyya Souq'**
  String get hamidiyyaSouq;

  /// No description provided for @traditionalMarket.
  ///
  /// In en, this message translates to:
  /// **'Traditional market'**
  String get traditionalMarket;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @destinationDetailsLater.
  ///
  /// In en, this message translates to:
  /// **'Destination details will be connected later.'**
  String get destinationDetailsLater;

  /// No description provided for @sampleConversationNotice.
  ///
  /// In en, this message translates to:
  /// **'Sample conversation. No live AI yet.'**
  String get sampleConversationNotice;

  /// No description provided for @askAboutSyria.
  ///
  /// In en, this message translates to:
  /// **'Ask about Syria...'**
  String get askAboutSyria;

  /// No description provided for @plannerTitle.
  ///
  /// In en, this message translates to:
  /// **'AI TRIP PLANNER'**
  String get plannerTitle;

  /// No description provided for @plannerHeroTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Syrian journey starts here'**
  String get plannerHeroTitle;

  /// No description provided for @plannerHeroDescription.
  ///
  /// In en, this message translates to:
  /// **'Tell us what you enjoy and your budget. We will help organize your trip.'**
  String get plannerHeroDescription;

  /// No description provided for @whereToGo.
  ///
  /// In en, this message translates to:
  /// **'Where do you want to go?'**
  String get whereToGo;

  /// No description provided for @chooseDestination.
  ///
  /// In en, this message translates to:
  /// **'Choose a destination area'**
  String get chooseDestination;

  /// No description provided for @tripDuration.
  ///
  /// In en, this message translates to:
  /// **'How long is your trip?'**
  String get tripDuration;

  /// No description provided for @tripBudget.
  ///
  /// In en, this message translates to:
  /// **'What is your budget?'**
  String get tripBudget;

  /// No description provided for @tripInterests.
  ///
  /// In en, this message translates to:
  /// **'What are you interested in?'**
  String get tripInterests;

  /// No description provided for @generateTrip.
  ///
  /// In en, this message translates to:
  /// **'Generate My Trip'**
  String get generateTrip;

  /// No description provided for @completeSelections.
  ///
  /// In en, this message translates to:
  /// **'Please complete all selections first.'**
  String get completeSelections;

  /// No description provided for @areaDamascus.
  ///
  /// In en, this message translates to:
  /// **'Damascus'**
  String get areaDamascus;

  /// No description provided for @areaPalmyra.
  ///
  /// In en, this message translates to:
  /// **'Palmyra'**
  String get areaPalmyra;

  /// No description provided for @areaAleppo.
  ///
  /// In en, this message translates to:
  /// **'Aleppo'**
  String get areaAleppo;

  /// No description provided for @areaLatakia.
  ///
  /// In en, this message translates to:
  /// **'Latakia'**
  String get areaLatakia;

  /// No description provided for @areaHoms.
  ///
  /// In en, this message translates to:
  /// **'Homs'**
  String get areaHoms;

  /// No description provided for @areaHama.
  ///
  /// In en, this message translates to:
  /// **'Hama'**
  String get areaHama;

  /// No description provided for @areaBosra.
  ///
  /// In en, this message translates to:
  /// **'Bosra'**
  String get areaBosra;

  /// No description provided for @areaCrac.
  ///
  /// In en, this message translates to:
  /// **'Crac des Chevaliers'**
  String get areaCrac;

  /// No description provided for @durationOneDay.
  ///
  /// In en, this message translates to:
  /// **'1 day'**
  String get durationOneDay;

  /// No description provided for @durationTwoThreeDays.
  ///
  /// In en, this message translates to:
  /// **'2–3 days'**
  String get durationTwoThreeDays;

  /// No description provided for @durationFourFiveDays.
  ///
  /// In en, this message translates to:
  /// **'4–5 days'**
  String get durationFourFiveDays;

  /// No description provided for @durationOneWeek.
  ///
  /// In en, this message translates to:
  /// **'1 week'**
  String get durationOneWeek;

  /// No description provided for @budgetOption.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get budgetOption;

  /// No description provided for @moderateOption.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get moderateOption;

  /// No description provided for @luxuryOption.
  ///
  /// In en, this message translates to:
  /// **'Luxury'**
  String get luxuryOption;

  /// No description provided for @interestHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get interestHistory;

  /// No description provided for @interestArchitecture.
  ///
  /// In en, this message translates to:
  /// **'Architecture'**
  String get interestArchitecture;

  /// No description provided for @interestNature.
  ///
  /// In en, this message translates to:
  /// **'Nature'**
  String get interestNature;

  /// No description provided for @interestFood.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get interestFood;

  /// No description provided for @interestCulture.
  ///
  /// In en, this message translates to:
  /// **'Culture'**
  String get interestCulture;

  /// No description provided for @interestAdventure.
  ///
  /// In en, this message translates to:
  /// **'Adventure'**
  String get interestAdventure;

  /// No description provided for @yourTripPlan.
  ///
  /// In en, this message translates to:
  /// **'YOUR TRIP PLAN'**
  String get yourTripPlan;

  /// No description provided for @yourAdventure.
  ///
  /// In en, this message translates to:
  /// **'Your {area} adventure'**
  String yourAdventure(String area);

  /// No description provided for @destinationLabel.
  ///
  /// In en, this message translates to:
  /// **'Destination'**
  String get destinationLabel;

  /// No description provided for @durationLabel.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get durationLabel;

  /// No description provided for @budgetLabel.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get budgetLabel;

  /// No description provided for @interestsLabel.
  ///
  /// In en, this message translates to:
  /// **'Interests'**
  String get interestsLabel;

  /// No description provided for @sampleItinerary.
  ///
  /// In en, this message translates to:
  /// **'Sample itinerary'**
  String get sampleItinerary;

  /// No description provided for @itineraryPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Your personalized itinerary will appear here once the AI planning service is connected.'**
  String get itineraryPlaceholder;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
