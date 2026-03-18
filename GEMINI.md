# プロジェクトルール — Gemini CLI / Antigravity

仕様駆動開発（Spec-Driven Development）テンプレート。
詳細なルールは `.antigravity/rules.md` および `spec/workflow.md` を参照すること。

## セッション開始時

各セッションの冒頭で `spec/status.md` を読み、現在フェーズと直近の状況をユーザーに伝えること。セッション終了時には `spec/status.md` の「直近の状況」と「次のアクション」を更新すること。

## 必須事項

1. **フェーズゲート厳守**: 要件定義→設計→計画→実装の順に進行し、各フェーズ間でユーザーの明示的な承認を得ること
2. **spec参照必須**: 実装前に `spec/requirements.md` と `spec/design.md` を必ず読むこと
3. **spec変更はユーザー合意必須**: `spec/` 内のファイルを勝手に変更してはならない
4. **TDD厳守**: 要件からテストを先に書き、RED を確認してから実装する
5. **品質ゲート必須**: `--no-verify` 禁止（初回: `bash scripts/setup-hooks.sh`）
6. **コミットにMDファイルを含める**
7. **コミットメッセージ**: 日本語（例: `機能: ログイン機能を追加`）
8. **PR**: `.github/PULL_REQUEST_TEMPLATE.md` に従う

詳細は `.antigravity/rules.md` および `spec/workflow.md` を確認すること。
