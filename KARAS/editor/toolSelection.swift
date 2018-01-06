//
//  SelectionTool.swift
//  KARAS
//
//  Created by sumioka-air on 2017/12/27.
//  Copyright © 2017年 sho sumioka. All rights reserved.
//

import Metal
import MetalKit

/*
 セレクションバッファ設定
 sel = glSelectBuffer(バッファの個数)
 セレクションモードに入る
 glRenderMode(GL_SELECT)
 セレクションバッファの初期化
 glInitNames()
 glPushName(0)
 ビューポートの初期化
 glMatrixMode(GL_PROJECTION)
 glPushMatrix()
 glLoadIdentity()
 選択範囲の指定
 gluPickMatrix(選択範囲中心X座標, 選択範囲中心Y座標, 選択範囲横幅, 選択範囲縦幅, ビュー情報)
 この後、現在と同じ設定でビューの設定を行います。
 ポリゴンに番号を付けながら描画
 番号を変えながら、以下の1,2を繰り返します。
 glLoadName(番号)
 ポリゴンを１つ描画
 ビューの行列を元に戻す
 glMatrixMode(GL_PROJECTION)
 glPopMatrix()
 選択されたポリゴンを得る
 hits = glRenderMode(GL_RENDER)
 リストhitsに選択されたポリゴンの情報が入っています。
 */
class MTLPicker {

}
