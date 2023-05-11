enum Routes {
  pad('pad'),
  ble('ble');

  const Routes(this._v);

  final String _v;

  get v {
    return '/$_v';
  }
}
