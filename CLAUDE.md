# プロジェクトルール — Claude Code

仕様駆動開発（Spec-Driven Development）テンプレート。
詳細なワークフロー・ルールは `spec/workflow.md` を参照すること。

## 絶対ルール

1. **フェーズゲート厳守**: 要件定義→設計→計画→実装の順に進行し、各フェーズ間でユーザーの明示的な承認を得ること
2. **spec参照必須**: 実装前に `spec/requirements.md` と `spec/design.md` を必ず読むこと
3. **spec変更はユーザー合意必須**: `spec/` 内のファイルを勝手に変更してはならない
4. **TDD厳守**: 要件からテストを先に書き、RED を確認してから実装する（詳細は `spec/workflow.md` のTDDガイドライン参照）
5. **品質ゲート必須**: `--no-verify` 禁止。品質ゲートの失敗は根本原因を修正する
6. **コミットにMDファイルを含める**: 計画で生成・変更されたMDファイルをコミットから除外しない

## 頻用コマンド

```bash
# 初回セットアップ（クローン後に1回）
bash scripts/setup-hooks.sh

# 品質ゲート（手動事前確認）
bash scripts/quality-gate.sh

# 個別実行
bash scripts/lint.sh    # リント・静的解析
bash scripts/build.sh   # ビルド確認
bash scripts/test.sh    # テスト
```

## コミットメッセージ

日本語で記述。種別: `機能` / `修正` / `改善` / `整理` / `テスト` / `文書` / `設定` / `計画`

```
<種別>: <変更内容の要約>
```

## クロスAIレビュー

各計画セッション終了時に、別のAIで変更箇所のレビューを実施すること（詳細は `spec/workflow.md` のクロスAIレビューセクション参照）。

- **Claude で開発した場合**: Codex（第一優先）でレビューを実施
- **レビュー手順**: `bash scripts/cross-review.sh` → レビューAIに差分サマリーを渡す

```bash
# レビュー差分サマリー生成
bash scripts/cross-review.sh

# Codex にレビュー依頼
codex "$(cat .cross-review-summary.md) 上記の変更をレビューしてください。"
```

## プロジェクト構造

- `spec/` — 要件・設計・計画・ワークフロー定義
- `scripts/` — リント・ビルド・テスト・品質ゲート（プロジェクト固有のコマンドはTODOを書き換え）
- `hooks/` — pre-commitフック（品質ゲート自動実行）
- `.github/` — PRテンプレート・CI・Copilot設定

## 技術スタック

デフォルトの技術選定は `spec/workflow.md` の技術スタックセクションを参照。
プロジェクト固有の変更は `spec/design.md` の技術選定に理由とともに記録すること。
