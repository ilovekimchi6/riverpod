part of 'provider.dart';

abstract class Provider1<First, Res>
    extends BaseProvider1<First, ProviderValue<Res>> implements Provider<Res> {
  factory Provider1(
    BaseProvider<First> firstProvider,
    Create1<First, Res, ProviderState> create,
  ) = _Provider1<First, Res>;
}

class _Provider1<First, Res> extends BaseProvider1<First, ProviderValue<Res>>
    implements Provider1<First, Res> {
  _Provider1(
    BaseProvider<First> firstProvider,
    this.create,
  ) : super(firstProvider);

  final Create1<First, Res, ProviderState> create;

  @override
  _Provider1State<First, Res> createState() {
    return _Provider1State<First, Res>();
  }

  @override
  Res call() {
    // ignore: invalid_use_of_visible_for_testing_member
    return BaseProvider.use(this)._value;
  }
}

class _Provider1State<First, Res> extends BaseProvider1State<First,
    ProviderValue<Res>, _Provider1<First, Res>> {
  @override
  ProviderValue<Res> initState() {
    return ProviderValue(provider.create(this, firstDependencyState));
  }
}