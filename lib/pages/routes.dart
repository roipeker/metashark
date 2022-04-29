import 'package:metashark/commons.dart';

const _kLoginRoutes = [
  '/login',
  '/login-confirmation',
  '/registration',
  '/registration/confirmation',
  '/recovery',
  '/recovery-confirmation',
  '/invalid-form',
  '/link-profile',
  '/link-profile/confirmation',
  '/edit-profile',
];

bool _isLoginRoute(GoRouterState state) {
  return _kLoginRoutes.contains(state.subloc);
}

Widget fadeTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}

GoRouterState? routerLastState;
final router = GoRouter(
  // urlPathStrategy: UrlPathStrategy.hash,
  urlPathStrategy: UrlPathStrategy.path,
  initialLocation: '/',
  redirect: (state) {
    /// mock up user!
    final userId = state.queryParams['user'];
    if (userId != null) {
      appData.login(userId);
    }

    // var fields = [
    //   state.location,
    //   '|',
    //   state.path,
    //   '|',
    //   state.fullpath,
    //   '|',
    //   state.subloc,
    //   '|',
    //   state.name,
    //   '|',
    //   state.params,
    //   '|',
    //   state.queryParams,
    // ];
    // trace(
    //   "State:",
    //     fields
    // );
    if (state.subloc == '/') {
      if (!appData.isLogged) {
        return state.namedLocation(LoginPage.name);
      } else {
        return state.namedLocation(HomePage.url);
      }
    }

    if (_isLoginRoute(state)) {
      if (appData.isLogged) {
        // query param in URL. Go to dashboard!
        return state.namedLocation(HomePage.url);
      }
    } else {
      if (!appData.isLogged) {
        // query param in URL. Go to dashboard!
        return state.namedLocation(LoginPage.name);
      }
    }

    /// otherwise... regular path, and logged out?

    // if (!appData.isUserLogged) {
    //   return state.namedLocation(LoginPage.name);
    // }
    return null;
  },
  navigatorBuilder: (context, state, child) {
    routerLastState = state;
    if (!_isLoginRoute(state)) {
      child = RootMenu(child: child);
    }
    return child;
  },
  routes: [
    // GoRoute(
    //   path: '/',
    //   redirect: (state) => state.namedLocation(LoginPage.name),
    // ),
    GoRoute(
      path: '/coming-soon',
      name: ComingSoonPage.url,
      builder: (_, state) {
        var title = state.queryParams['from'] ?? 'MetaShark';
        return ComingSoonPage(title: title);
      },
      // pageBuilder: (_, state) {
      //   var title = state.queryParams['from'] ?? 'MetaShark';
      //   return CustomTransitionPage(
      //     child: ComingSoonPage(title: title),
      //     transitionsBuilder: fadeTransition,
      //   );
      // },
    ),
    GoRoute(
      path: '/login',
      name: LoginPage.name,
      builder: (_, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/login-confirmation',
      name: LoginConfirmationPage.name,
      builder: (_, state) => const LoginConfirmationPage(),
    ),
    GoRoute(
      path: '/registration',
      name: RegistrationPage.name,
      builder: (_, state) => const RegistrationPage(),
    ),
    GoRoute(
      path: '/registration/confirmation',
      name: RegistrationConfirmationPage.name,
      builder: (_, state) => const RegistrationConfirmationPage(),
    ),
    GoRoute(
      path: '/recovery',
      name: PasswordRecoveryPage.name,
      builder: (_, state) => const PasswordRecoveryPage(),
    ),
    GoRoute(
      path: '/recovery-confirmation',
      name: PasswordRecoveryConfirmationPage.name,
      builder: (_, state) => const PasswordRecoveryConfirmationPage(),
    ),
    GoRoute(
      path: '/invalid-form',
      name: InvalidFormPage.name,
      builder: (_, state) => const InvalidFormPage(),
    ),
    GoRoute(
      path: '/link-profile',
      name: LinkProfilePage.name,
      builder: (_, state) => const LinkProfilePage(),
    ),
    GoRoute(
      path: '/link-profile/confirmation',
      name: LinkProfileConfirmationPage.name,
      builder: (_, state) => const LinkProfileConfirmationPage(),
    ),
    GoRoute(
      path: '/edit-profile',
      name: EditProfilePage.name,
      builder: (_, state) => const EditProfilePage(),
    ),

    /// ROOT stuffs.
    GoRoute(
      path: '/dashboard',
      name: HomePage.url,
      // builder: (_, state) => const HomePage(),
      redirect: _redirectComingSoon,
    ),

    /// --- SETTINGS ---
    GoRoute(
      path: '/settings',
      name: SettingsPage.url,
      builder: (_, state) => const SettingsPage(),
      // pageBuilder: (_, state) {
      //   return CustomTransitionPage(
      //     key: state.pageKey,
      //     child: const SettingsPage(),
      //     transitionsBuilder: fadeTransition,
      //     transitionDuration: 0.14.seconds,
      //   );
      // },
      // pageBuilder: (_, state) {
      //   return CustomTransitionPage<void>(
      //     key: state.pageKey,
      //     child: SettingsPage(),
      //     transitionsBuilder:
      //         (context, animation, secondaryAnimation, child) =>
      //             FadeTransition(opacity: animation, child: child),
      //   );
      // }),
    ),
    GoRoute(
      path: '/settings/profile',
      name: SettingsProfilePage.url,
      builder: (_, state) => const SettingsProfilePage(),
      // pageBuilder: (_, state) => NoTransitionPage(
      //   key: state.pageKey,
      //   child: SettingsProfilePage(),
      // ),
    ),
    GoRoute(
      path: '/settings/google-auth',
      name: GoogleAuthPage.url,
      builder: (_, state) => const GoogleAuthPage(),
    ),
    GoRoute(
      path: '/settings/google-auth/key',
      name: GoogleAuthKeyPage.url,
      builder: (_, state) => const GoogleAuthKeyPage(),
    ),
    GoRoute(
      path: '/settings/google-auth/key/confirmation',
      name: GoogleAuthKeyConfirmationPage.url,
      builder: (_, state) => const GoogleAuthKeyConfirmationPage(),
    ),
    GoRoute(
      path: '/settings/google-auth/cancel',
      name: GoogleAuthCancellationPage.url,
      builder: (_, state) => const GoogleAuthCancellationPage(),
    ),
    // change pass
    GoRoute(
      path: '/settings/change-pass',
      name: ChangePasswordPage.url,
      builder: (_, state) => const ChangePasswordPage(),
    ),
    GoRoute(
      path: '/settings/change-email',
      name: ChangeEmailPage.url,
      builder: (_, state) => const ChangeEmailPage(),
    ),
    GoRoute(
      path: '/settings/change-email/confirmation',
      name: ChangeEmailConfirmationPage.url,
      builder: (_, state) => const ChangeEmailConfirmationPage(),
    ),

    GoRoute(
      path: '/settings/sessions',
      name: SessionsPage.url,
      builder: (_, state) => const SessionsPage(),
    ),
    GoRoute(
      path: '/settings/confirmations',
      name: SettingsConfirmationsPage.url,
      builder: (_, state) => const SettingsConfirmationsPage(),
    ),

    /// --- FINANCE ---

    GoRoute(
      path: '/finance',
      name: FinancePage.url,
      builder: (_, state) => const FinancePage(),
    ),
    // todo: add ID to wallet.
    GoRoute(
      path: '/finance/wallet',
      name: WalletPage.url,
      builder: (_, state) => const WalletPage(),
    ),
    GoRoute(
      path: '/finance/wallet/deposit',
      name: WalletDepositPage.url,
      builder: (_, state) => const WalletDepositPage(),
    ),
    GoRoute(
      path: '/finance/wallet/withdraw',
      name: WalletWithdrawPage.url,
      builder: (_, state) => const WalletWithdrawPage(),
    ),
    GoRoute(
      path: '/finance/wallet/withdraw/confirmation',
      name: WithdrawConfirmationPage.url,
      builder: (_, state) => const WithdrawConfirmationPage(),
    ),

    /// binary
    // GoRoute(
    //   path: '/binary',
    //   name: BinaryPage.url,
    //   // redirect: (_) => '/binary/statistics',
    //   builder: (_, state) => const BinaryPage(),
    // ),
    GoRoute(
      path: '/binary',
      name: BinaryPage.url,
      redirect: (_) => '/binary/statistics',
    ),
    GoRoute(
      path: '/binary/:id',
      builder: (_, state) {
        var id = state.params['id']!;
        var tab = BinaryPage.getUrlIdAsTabIndex(id);
        if (tab < 0) {
          throw Exception("binary tab not found: $id");
        }
        // statistics,structure
        return BinaryPage(key: state.pageKey, currentTab: tab);
      },
    ),

    /// temporal routes.
    GoRoute(
      path: '/myteam',
      name: MyTeamPage.url,
      // redirect: _redirectComingSoon,
      builder: (_, state) {
        return MyTeamPage(key: state.pageKey);
      },
    ),

    GoRoute(
      path: '/myteam/partners',
      name: MyRegisteredPartnersPage.url,
      builder: (_, state) {
        return MyRegisteredPartnersPage(key: state.pageKey);
      },
    ),

    GoRoute(
      path: '/store',
      name: StorePage.url,
      redirect: _redirectComingSoon,
    ),
    GoRoute(
      path: '/steaking',
      name: SteakingPage.url,
      redirect: _redirectComingSoon,
    ),
    GoRoute(
      path: '/quest',
      name: QuestPage.url,
      // redirect: _redirectComingSoon,
      builder: (_, state) {
        return QuestPage(key: state.pageKey);
      },
    ),
    GoRoute(
      path: '/roulette',
      name: RoulettePage.url,
      builder: (_, state) {
        return RoulettePage(key: state.pageKey);
      },
      // redirect: _redirectComingSoon,
    ),
    GoRoute(
      path: '/plans',
      name: PlansPage.url,
      builder: (_, state) {
        return PlansPage(key: state.pageKey);
      },
      // redirect: _redirectComingSoon,
    ),
    GoRoute(
      path: '/portfolio',
      name: PortfolioPage.url,
      redirect: _redirectComingSoon,
    ),

    GoRoute(
      path: '/vouchers',
      name: VouchersPage.url,
      redirect: (_) => '/vouchers/tab/operating',
      // redirect: (_) => '/vouchers/logs',
      builder: (_, state) {
        return VouchersPage(key: state.pageKey);
      },
    ),
    // GoRoute(
    //   path: '/vouchers/create',
    //   name: CreateVoucherPage.url,
    //   redirect: (_) => '/vouchers/create',
    // ),

    GoRoute(
      path: '/vouchers/tab/:id',
      // redirect: _redirectComingSoon,
      builder: (_, state) {
        var id = state.params['id']!;
        // if (id == 'create') {
        //   return CreateVoucherPage(key: state.pageKey);
        // }
        var tab = VouchersPage.getUrlIdAsTabIndex(id);
        if (tab < 0) {
          throw Exception("Voucher tab not found: $id");
        }
        return VouchersPage(key: state.pageKey, currentTab: tab);
      },
    ),

    GoRoute(
      path: '/vouchers/create',
      name: CreateVoucherPage.url,
      builder: (_, state) {
        return CreateVoucherPage(key: state.pageKey);
      },
    ),
    GoRoute(
      path: '/vouchers/create/objects',
      name: VoucherObjectsPage.url,
      builder: (_, state) {
        return VoucherObjectsPage(key: state.pageKey);
      },
    ),
    GoRoute(
      path: '/vouchers/create/objects/present',
      name: ObjectPresentPage.url,
      builder: (_, state) => ObjectPresentPage(key: state.pageKey),
    ),
    GoRoute(
      path: '/vouchers/create/objects/nft',
      name: ObjectNftPage.url,
      builder: (_, state) => ObjectNftPage(key: state.pageKey),
    ),
    GoRoute(
      path: '/vouchers/create/objects/network-ticket',
      name: ObjectNetworkPage.url,
      builder: (_, state) => ObjectNetworkPage(key: state.pageKey),
    ),
    GoRoute(
      path: '/vouchers/create/objects/cinema-ticket',
      name: ObjectCinemaPage.url,
      builder: (_, state) => ObjectCinemaPage(key: state.pageKey),
    ),
    GoRoute(
      path: '/vouchers/create/objects/cash',
      name: ObjectCashPage.url,
      builder: (_, state) => ObjectCashPage(key: state.pageKey),
    ),
    GoRoute(
      path: '/vouchers/create/objects/infinity-token',
      name: ObjectInfinityTokenPage.url,
      builder: (_, state) => ObjectInfinityTokenPage(key: state.pageKey),
    ),



    GoRoute(
      path: '/vouchers/create/recipients',
      name: VoucherRecipientsPage.url,
      builder: (_, state) {
        return VoucherRecipientsPage(key: state.pageKey);
      },
    ),

    // ---

    GoRoute(
      path: '/career',
      name: CareerPage.url,
      // redirect: _redirectComingSoon,
      // redirect: (state) => '/career/my-partners',
      builder: (_, state) {
        return CareerPage(key: state.pageKey);
      },
    ),
    GoRoute(
      path: '/career/my-partners',
      name: MyPartnersPage.url,
      builder: (_, state) {
        return MyPartnersPage(key: state.pageKey);
      },
    ),
  ],
);

String? _redirectComingSoon(GoRouterState state) {
  return '/coming-soon?from=${state.name}';
}
