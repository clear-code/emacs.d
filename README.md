<!-- -*- gfm -*- -->

# Emacsのオススメ設定集

## 使い方

        % git clone https://github.com/clear-code/emacs.d.git ~/.emacs.d

# カスタマイズ

ファイルの読み込み順は以下の通りです。「カスタマイズ用」と書かれたファイルを作成することによりカスタマイズします。

  * ~/.emacs.d/init.el
  * ~/.emacs.d/config/builtins.el
  * ~/.emacs.d/config/builtins/local.el（カスタマイズ用）
  * ~/.emacs.d/config/packages.el
  * ~/.emacs.d/config/el-get/local-recipes/*.rcp（カスタマイズ用）
  * ~/.emacs.d/config/el-get/recipes/*.rcp
  * ~/.emacs.d/config/packages/local.el（カスタマイズ用）
  * ~/.emacs.d/local.el（カスタマイズ用）

## 標準Elisp用設定のカスタマイズ

~/.emacs.d/config/builtins/local.elに設定を書くと自動で読み込まれます。標準Elisp用の設定はここに書いてください。

## パッケージのカスタマイズ

~/.emacs.d/config/packages/local.elに設定を書くと自動で読み込まれます。

### el-getの追加レシピ

パッケージ管理システムにはel-getを使っています。

~/.emacs.d/config/el-get/local-recipes/以下に拡張子がrcpのel-get用レシピファイルを置くと自動で読み込まれます。

## 全体のカスタマイズ

~/.emacs.d/config/local.elに設定を書くと自動で読み込まれます。

