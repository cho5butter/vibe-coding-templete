# プロジェクトルール — Google Antigravity

仕様駆動開発（Spec-Driven Development）テンプレート。
詳細なワークフロー・ルールは `spec/workflow.md` を参照すること。

## セッション開始時

各セッションの冒頭で `spec/status.md` を読み、現在フェーズと直近の状況をユーザーに伝えること。セッション終了時には `spec/status.md` の「直近の状況」と「次のアクション」を更新すること。

## 絶対ルール

1. **フェーズゲート厳守**: 要件定義→設計→計画→実装の順に進行し、各フェーズ間でユーザーの明示的な承認を得ること
2. **spec参照必須**: 実装前に `spec/requirements.md` と `spec/design.md` を必ず読むこと
3. **spec変更はユーザー合意必須**: `spec/` 内のファイルを勝手に変更してはならない
4. **TDD厳守**: 要件からテストを先に書き、RED を確認してから実装する（詳細は `spec/workflow.md` のTDDガイドライン参照）
5. **品質ゲート必須**: `--no-verify` 禁止。品質ゲートの失敗は根本原因を修正する
6. **コミットにMDファイルを含める**: 計画で生成・変更されたMDファイルをコミットから除外しない

## 頻用コマンド

```bash
bash scripts/setup-hooks.sh    # 初回セットアップ
bash scripts/quality-gate.sh   # 品質ゲート（手動事前確認）
bash scripts/lint.sh           # リント・静的解析
bash scripts/build.sh          # ビルド確認
bash scripts/test.sh           # テスト
```

## コミットメッセージ

日本語で記述。種別: `機能` / `修正` / `改善` / `整理` / `テスト` / `文書` / `設定` / `計画`

```
<種別>: <変更内容の要約>
```
