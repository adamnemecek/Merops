# KARAS
Next Generation DCC  for Mac and iOS.
[DownLoad](http://github.com)

## 課題
Metal に向き合う
移植できる
応用で作れる

他のソフトが気になることは絶対ある
シンプル、早い、イテレーションの3軸を絶対の指針にする
他のソフトと同じことをするならMayaを使えば良い

ml
noise
lattice
edit

#### editor
- style: SpriteKit で HUD の描画
- core: usd + abc の2枚構成を実現する(add json)
- USD Export で Model I/O で書き出せない(geometryとマテリアル以外)ものを後変更したい

#### engine
- Metal engine
- triangleStrip vertex を共有する
- 2D座標に変換して、その座標感にプリミティブなオブジェクトが存在するかどうか


## Concept
- simple: widgetless, HUD like game, multiple gestures.
- iterable: [Pixar USD](https://github.com/PixarAnimationStudios/USD) and [libgit2](https://github.com/libgit2/objective-git).
- fastest: `Metal2` based Viewport and Modifier.

### support
- [x] geometry
- [ ] animation
- [ ] layout/shot


### Not surport
- lookDev
- Simulation
- Rendering


## Contribute
Please Read [Contribute](../Contribute.md) guide.

## Author
[Sho Sumioka](shosumioka@gmail.com)

## License
[MIT](../License.md) License.
