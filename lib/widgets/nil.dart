part of 'index.dart';

const nil = Nil();

class Nil extends Widget {
  const Nil({super.key});

  @override
  Element createElement() => _NilElement(this);
}

class _NilElement extends Element {
  _NilElement(Nil super.widget);

  @override
  void mount(Element? parent, dynamic newSlot) {
    assert(parent is! MultiChildRenderObjectElement, """
        你正在 MultiChildRenderObjectElement 下使用 Nil.
        这表明 Nil 可能不需要或使用不当, 你可以在 Row、Column、ListView 等 MultiChildRenderObjectElement 中使用 if 条件和 else 语句.
        """);

    super.mount(parent, newSlot);
  }

  @override
  bool get debugDoingBuild => false;

  @override
  void performRebuild() {
    super.performRebuild();
  }
}
