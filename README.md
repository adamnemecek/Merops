# KARAS
Next Generation DCC  for Mac and iOS. [DownLoad](http://github.com)


## editor
- style: SpriteKit で HUD の描画
- core: usd + abc の2枚構成を実現する(add json)
- USD Export で Model I/O で書き出せない(geometryとマテリアル以外)ものを後変更したい

## engine
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


## TODO
- [x] basic api
- [ ] github.io
- [ ] unreal
do Metal
移植できる
応用で作れる

HUDを透明なものに変える

他のソフトが気になることは絶対ある
シンプル、早い、イテレーションの3軸を絶対の指針にする
他のソフトと同じことをするならMayaを使えば良い

Swift for TensorFlow

ml
noise
lattice
edit

## Contribute
Please Read [Contribute](../Contribute.md) guide.

## Author
[Sho Sumioka](shosumioka@gmail.com)

## License
[MIT](../License.md) License.
