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

  /// No description provided for @findParking.
  ///
  /// In en, this message translates to:
  /// **'Find Parking'**
  String get findParking;

  /// No description provided for @searchParking.
  ///
  /// In en, this message translates to:
  /// **'Search parking near attractions...'**
  String get searchParking;

  /// No description provided for @parkingNearDamascus.
  ///
  /// In en, this message translates to:
  /// **'Near: Damascus Old City'**
  String get parkingNearDamascus;

  /// No description provided for @listView.
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get listView;

  /// No description provided for @mapView.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get mapView;

  /// No description provided for @noParkingFound.
  ///
  /// In en, this message translates to:
  /// **'No parking locations found.'**
  String get noParkingFound;

  /// No description provided for @oldCityParking.
  ///
  /// In en, this message translates to:
  /// **'Old City Parking A'**
  String get oldCityParking;

  /// No description provided for @citadelParking.
  ///
  /// In en, this message translates to:
  /// **'Citadel Parking B'**
  String get citadelParking;

  /// No description provided for @distanceUmayyad.
  ///
  /// In en, this message translates to:
  /// **'350 m from Umayyad Mosque'**
  String get distanceUmayyad;

  /// No description provided for @distanceCitadel.
  ///
  /// In en, this message translates to:
  /// **'600 m from Citadel'**
  String get distanceCitadel;

  /// No description provided for @parkingPriceOldCity.
  ///
  /// In en, this message translates to:
  /// **'SYP 2,000 / hour (sample)'**
  String get parkingPriceOldCity;

  /// No description provided for @parkingPriceCitadel.
  ///
  /// In en, this message translates to:
  /// **'SYP 1,500 / hour (sample)'**
  String get parkingPriceCitadel;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @limitedAvailability.
  ///
  /// In en, this message translates to:
  /// **'Limited'**
  String get limitedAvailability;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View details'**
  String get viewDetails;

  /// No description provided for @illustrativeMapNotice.
  ///
  /// In en, this message translates to:
  /// **'Illustrative map, not live data'**
  String get illustrativeMapNotice;

  /// No description provided for @parkingDetails.
  ///
  /// In en, this message translates to:
  /// **'Parking Details'**
  String get parkingDetails;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// No description provided for @availableTimeSlots.
  ///
  /// In en, this message translates to:
  /// **'Available Time Slots'**
  String get availableTimeSlots;

  /// No description provided for @parkingSummary.
  ///
  /// In en, this message translates to:
  /// **'Parking Summary'**
  String get parkingSummary;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @statusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get statusLabel;

  /// No description provided for @parkingLocationLabel.
  ///
  /// In en, this message translates to:
  /// **'Parking location'**
  String get parkingLocationLabel;

  /// No description provided for @dateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get dateLabel;

  /// No description provided for @timeLabel.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get timeLabel;

  /// No description provided for @priceLabel.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get priceLabel;

  /// No description provided for @notSelected.
  ///
  /// In en, this message translates to:
  /// **'Not selected'**
  String get notSelected;

  /// No description provided for @reservationDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reservation Details'**
  String get reservationDetailsTitle;

  /// No description provided for @reviewYourBooking.
  ///
  /// In en, this message translates to:
  /// **'Review Your Booking'**
  String get reviewYourBooking;

  /// No description provided for @reviewBookingDescription.
  ///
  /// In en, this message translates to:
  /// **'Check your parking reservation details before proceeding.'**
  String get reviewBookingDescription;

  /// No description provided for @locationLabel.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get locationLabel;

  /// No description provided for @bookingNotConfirmedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your booking is not confirmed yet. Continue to the payment step to complete the reservation.'**
  String get bookingNotConfirmedMessage;

  /// No description provided for @continueToPayment.
  ///
  /// In en, this message translates to:
  /// **'Continue to Payment'**
  String get continueToPayment;

  /// No description provided for @paymentTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get paymentTitle;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @choosePaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose your payment method to complete the reservation.'**
  String get choosePaymentMethod;

  /// No description provided for @creditDebitCard.
  ///
  /// In en, this message translates to:
  /// **'Credit / Debit Card'**
  String get creditDebitCard;

  /// No description provided for @supportedCards.
  ///
  /// In en, this message translates to:
  /// **'Visa, Mastercard and other cards'**
  String get supportedCards;

  /// No description provided for @bookingSummary.
  ///
  /// In en, this message translates to:
  /// **'Booking Summary'**
  String get bookingSummary;

  /// No description provided for @parkingLabel.
  ///
  /// In en, this message translates to:
  /// **'Parking'**
  String get parkingLabel;

  /// No description provided for @totalLabel.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get totalLabel;

  /// No description provided for @demoPaymentNotice.
  ///
  /// In en, this message translates to:
  /// **'Demonstration payment only. No real money will be charged.'**
  String get demoPaymentNotice;

  /// No description provided for @continueToCardDetails.
  ///
  /// In en, this message translates to:
  /// **'Continue to Card Details'**
  String get continueToCardDetails;

  /// No description provided for @cardDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Card Details'**
  String get cardDetailsTitle;

  /// No description provided for @enterCardInformation.
  ///
  /// In en, this message translates to:
  /// **'Enter Card Information'**
  String get enterCardInformation;

  /// No description provided for @enterDemoCardDetails.
  ///
  /// In en, this message translates to:
  /// **'Enter demonstration card details to complete your booking.'**
  String get enterDemoCardDetails;

  /// No description provided for @demoCard.
  ///
  /// In en, this message translates to:
  /// **'DEMO CARD'**
  String get demoCard;

  /// No description provided for @cardholderName.
  ///
  /// In en, this message translates to:
  /// **'Cardholder Name'**
  String get cardholderName;

  /// No description provided for @nameOnCard.
  ///
  /// In en, this message translates to:
  /// **'Name on card'**
  String get nameOnCard;

  /// No description provided for @invalidCardholderName.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid cardholder name'**
  String get invalidCardholderName;

  /// No description provided for @cardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get cardNumber;

  /// No description provided for @invalidCardNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a 16-digit test card number'**
  String get invalidCardNumber;

  /// No description provided for @expiryDate.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get expiryDate;

  /// No description provided for @invalidExpiry.
  ///
  /// In en, this message translates to:
  /// **'Invalid expiry'**
  String get invalidExpiry;

  /// No description provided for @cardExpired.
  ///
  /// In en, this message translates to:
  /// **'Card has expired'**
  String get cardExpired;

  /// No description provided for @invalidCvv.
  ///
  /// In en, this message translates to:
  /// **'Enter 3 digits'**
  String get invalidCvv;

  /// No description provided for @demoCardNotice.
  ///
  /// In en, this message translates to:
  /// **'DEMO MODE: Use fictional test details only. This form does not connect to a bank, process real payments, or transmit or store card information.'**
  String get demoCardNotice;

  /// No description provided for @totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get totalAmount;

  /// No description provided for @payNow.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get payNow;

  /// No description provided for @bookingFailed.
  ///
  /// In en, this message translates to:
  /// **'Booking failed'**
  String get bookingFailed;

  /// No description provided for @bookingConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Booking Confirmation'**
  String get bookingConfirmation;

  /// No description provided for @bookingConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Booking Confirmed!'**
  String get bookingConfirmed;

  /// No description provided for @bookingSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your parking reservation was completed successfully.'**
  String get bookingSuccessMessage;

  /// No description provided for @parkingQrCode.
  ///
  /// In en, this message translates to:
  /// **'Your Parking QR Code'**
  String get parkingQrCode;

  /// No description provided for @showQrCodeMessage.
  ///
  /// In en, this message translates to:
  /// **'Show this QR code when you arrive.'**
  String get showQrCodeMessage;

  /// No description provided for @bookingReference.
  ///
  /// In en, this message translates to:
  /// **'Booking Reference'**
  String get bookingReference;

  /// No description provided for @parkingLocation.
  ///
  /// In en, this message translates to:
  /// **'Parking Location'**
  String get parkingLocation;

  /// No description provided for @priceUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Price unavailable'**
  String get priceUnavailable;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @myReservations.
  ///
  /// In en, this message translates to:
  /// **'My Reservations'**
  String get myReservations;

  /// No description provided for @unableToLoadReservations.
  ///
  /// In en, this message translates to:
  /// **'Unable to load reservations.'**
  String get unableToLoadReservations;

  /// No description provided for @noReservationsYet.
  ///
  /// In en, this message translates to:
  /// **'No Reservations Yet'**
  String get noReservationsYet;

  /// No description provided for @reservationsWillAppearHere.
  ///
  /// In en, this message translates to:
  /// **'Your parking reservations will appear here.'**
  String get reservationsWillAppearHere;

  /// No description provided for @cancelReservationTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel Reservation?'**
  String get cancelReservationTitle;

  /// No description provided for @cancelReservationMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel this parking reservation? This demonstration will simulate a successful refund.'**
  String get cancelReservationMessage;

  /// No description provided for @keepReservation.
  ///
  /// In en, this message translates to:
  /// **'Keep Reservation'**
  String get keepReservation;

  /// No description provided for @confirmCancellation.
  ///
  /// In en, this message translates to:
  /// **'Confirm Cancellation'**
  String get confirmCancellation;

  /// No description provided for @cancellationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Reservation cancelled. Demo refund processed.'**
  String get cancellationSuccess;

  /// No description provided for @cancellationFailed.
  ///
  /// In en, this message translates to:
  /// **'Cancellation failed'**
  String get cancellationFailed;

  /// No description provided for @confirmedStatus.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get confirmedStatus;

  /// No description provided for @cancelledStatus.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelledStatus;

  /// No description provided for @refundLabel.
  ///
  /// In en, this message translates to:
  /// **'Refund'**
  String get refundLabel;

  /// No description provided for @demoRefundProcessed.
  ///
  /// In en, this message translates to:
  /// **'Refund Processed (Demo)'**
  String get demoRefundProcessed;

  /// No description provided for @cancelReservation.
  ///
  /// In en, this message translates to:
  /// **'Cancel Reservation'**
  String get cancelReservation;

  /// No description provided for @reservationCancelledNotice.
  ///
  /// In en, this message translates to:
  /// **'This reservation has been cancelled.'**
  String get reservationCancelledNotice;

  /// No description provided for @selectCurrency.
  ///
  /// In en, this message translates to:
  /// **'Select Currency'**
  String get selectCurrency;

  /// No description provided for @currencyUsdName.
  ///
  /// In en, this message translates to:
  /// **'US Dollar (USD)'**
  String get currencyUsdName;

  /// No description provided for @currencySypName.
  ///
  /// In en, this message translates to:
  /// **'Syrian Pound (SYP)'**
  String get currencySypName;

  /// No description provided for @currencyEurName.
  ///
  /// In en, this message translates to:
  /// **'Euro (EUR)'**
  String get currencyEurName;
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
