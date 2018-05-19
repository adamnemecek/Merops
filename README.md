# Merops

[English](https://translate.google.com/translate?sl=ja&tl=en&u=https://github.com/sho7noka/)

`Pixar USD`と`libgit`をエディタ内に組み込んだ、次世代型DCCツールの実験プロジェクトです。


## Concept
シンプル、早い、イテレーションの3軸を指針

- ウィジェットを極力少なくゲーム画面に近い, multiple gestures.
- Metal2 ベースの Viewport と Modifier.
- [Pixar USD](https://github.com/PixarAnimationStudios/USD) と [libgit2](https://github.com/libgit2/objective-git) によるイテレーション

### Support
- [x] geometry
- [ ] animation
- [ ] layout/shot

### Not support
- lookDev
- Simulation
- Rendering

### Contribute
[Contribute](../Contribute.md) を一読ください。

## Author
[Sho Sumioka](shosumioka@gmail.com)

### License
[BSD](../License.md) です。


## TODO
他のソフトが気になることは絶対ありますが、同じことをするならMayaを使えば良いという考えの下、
統合ソフトにできない機能を積極的に実装していきます。

### editor
- [x] マウスイベントの回復
- [] style: SpriteKit で 透明 HUD の描画
- [] TextField からオブジェクトの状態を変更
- [] iPadに移植
- [x] libgit2 のコミットが不十分

### engine
- [ ] テッセレーションとリダクション
- [ ]
- [ ] モディファイヤ ml/noise/lattice/edit 
- [ ] USD + Alembic の2枚構成を実現(add json)
- [ ] Model I/O で書き出せないgeometryとマテリアル以外を後変更
- [ ] intelligent shape (Swift for TensorFlow)
