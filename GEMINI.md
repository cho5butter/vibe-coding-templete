# プロジェクトルール — Gemini CLI / Antigravity

このファイルは Gemini CLI および Google Antigravity IDE 向けのグローバルコンテキストである。
詳細なルールは `.antigravity/rules.md` を参照すること。

## 必須事項

1. コード変更後、コミット前に `bash scripts/quality-gate.sh` を必ず実行
2. TDD: テストを先に書いてから実装
3. コミットメッセージは日本語（例: `機能: ログイン機能を追加`）
4. 品質ゲート（リント→ビルド→テスト）をすべてパスしないとコミット禁止
5. PRは `.github/PULL_REQUEST_TEMPLATE.md` のテンプレートに従う

詳細は `.antigravity/rules.md` を確認すること。
