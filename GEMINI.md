# プロジェクトルール — Gemini CLI / Antigravity

このファイルは Gemini CLI および Google Antigravity IDE 向けのグローバルコンテキストである。
詳細なルールは `.antigravity/rules.md` を参照すること。

## 必須事項

1. **spec管理**: `spec/` フォルダの要件・設計・計画を参照して作業すること
   - `spec/requirements.md` — 要件定義
   - `spec/design.md` — 設計
   - `spec/plan.md` — 実装計画（1セッション＝1計画）
2. **計画実行後は必ずコミット**（MDファイルも含めること）
3. **spec変更はユーザー合意必須**（勝手に変更しない）
4. コード変更後、コミット前に `bash scripts/quality-gate.sh` を必ず実行
5. TDD: テストを先に書いてから実装
6. コミットメッセージは日本語（例: `機能: ログイン機能を追加`）
7. 品質ゲート（リント→ビルド→テスト）をすべてパスしないとコミット禁止
8. PRは `.github/PULL_REQUEST_TEMPLATE.md` のテンプレートに従う

詳細は `.antigravity/rules.md` を確認すること。
