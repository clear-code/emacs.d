<!-- -*- gfm -*- -->

# Emacsのオススメ設定集

## 使い方

```console
% git clone https://github.com/clear-code/emacs.d.git ~/.emacs.d
```

## カスタマイズ

ファイルの読み込み順は以下の通りです。「カスタマイズ用」と書かれたファイルを作成することによりカスタマイズします。

  * ~/.emacs.d/init.el
  * ~/.emacs.d/config/builtins.el
  * ~/.emacs.d/config/builtins/local.el（カスタマイズ用）
  * ~/.emacs.d/config/packages.el
  * ~/.emacs.d/config/el-get/local-recipes/*.rcp（カスタマイズ用）
  * ~/.emacs.d/config/el-get/recipes/*.rcp
  * ~/.emacs.d/config/packages/local.el（カスタマイズ用）
  * ~/.emacs.d/local.el（カスタマイズ用）

### 標準Elisp用設定のカスタマイズ

~/.emacs.d/config/builtins/local.elに設定を書くと自動で読み込まれます。標準Elisp用の設定はここに書いてください。

### パッケージのカスタマイズ

~/.emacs.d/config/packages/local.elに設定を書くと自動で読み込まれます。

#### el-getの追加レシピ

パッケージ管理システムにはel-getを使っています。

~/.emacs.d/config/el-get/local-recipes/以下に拡張子がrcpのel-get用レシピファイルを置くと自動で読み込まれます。

#### gptel

gptelを使うときは、カスタマイズ用のファイルでバックエンドを作る関数を指定してから~/.emacs.d/config/packages/gptel.elを読み込みます。関数の中で`gptel-make-openai`・`gptel-make-ollama`・`gptel-make-anthropic`などを呼んでバックエンドを返してください。この関数はgptelを読み込んだ後に呼ばれます。バックエンドの最初のモデルを使います。

例: llama.cppのサーバーを使う場合

```elisp
(setq local-gptel-make-backend
      (lambda ()
        (gptel-make-openai "llama-cpp"
          :stream t
          :protocol "http"
          :host "localhost:8080"
          :models '(llama-cpp-model))))
(load "config/packages/gptel")
```

例: Ollamaを使う場合

```elisp
(setq local-gptel-make-backend
      (lambda ()
        (gptel-make-ollama "Ollama"
          :stream t
          :host "localhost:11434"
          :models '(gemma3:latest))))
(load "config/packages/gptel")
```

### 全体のカスタマイズ

~/.emacs.d/config/local.elに設定を書くと自動で読み込まれます。

## ライセンス

ライセンスはGPLv3 or laterです。詳細はLICENSE.txtを見てください。

著作権者はそれぞれのファイルを見てください。
