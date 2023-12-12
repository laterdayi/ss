enum OpenState {
  open(1),
  close(0);

  final int val;
  const OpenState(this.val);
}

enum TemporaryDirectoryType {
  av(0, 'av'),
  img(1, 'img'),
  file(2, 'file');

  final int val;
  final String name;
  const TemporaryDirectoryType(this.val, this.name);
}
