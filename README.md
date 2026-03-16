# vibe-coding-templete

使用駆動開発（Usage-Driven Development）のためのAIエージェント設定テンプレート。

## 対応エージェント

| エージェント | 設定ファイル | 読み込み方式 |
|---|---|---|
| **Claude Code** | `CLAUDE.md` | 自動読み込み |
| **Cursor** | `.cursor/rules/usage-driven-development.mdc` | 自動読み込み（alwaysApply） |
| **Google Antigravity** | `.antigravity/rules.md` + `GEMINI.md` | rules.md は自動、GEMINI.md はグローバル設定 |
| **GitHub Copilot** | `.github/copilot-instructions.md` | 自動読み込み |
| **OpenAI Codex** | `AGENTS.md` | 自動読み込み |

## セットアップ

### 1. テンプレートからプロジェクトを作成

```bash
# このリポジトリをコピー
gh repo create my-project --template cho5butter/vibe-coding-templete
cd my-project
```

### 2. プロジェクト固有のコマンドを設定

`scripts/` ディレクトリ内の各スクリプトを編集し、`TODO` コメントの箇所をプロジェクトに合わせて書き換える:

- `scripts/test.sh` — テストコマンド
- `scripts/lint.sh` — リント・フォーマットコマンド
- `scripts/build.sh` — ビルドコマンド
- `scripts/quality-gate.sh` — 上記3つを順に実行（通常は編集不要）

### 3. GitHub Actions の設定

`.github/workflows/quality-gate.yml` のセットアップステップをプロジェクトに合わせて編集する。

## ワークフロー

すべてのAIエージェントは以下のワークフローに従う:

1. **要件理解** — タスクの要件を把握
2. **テスト作成（TDD）** — まずテストを書く
3. **最小実装** — テストが通る最小限のコードを書く
4. **品質ゲート実行** — `bash scripts/quality-gate.sh`
5. **コミット** — すべてパスしたら日本語でコミット
6. **修正ループ** — 失敗したら修正して再実行

## コミットメッセージ規約

```
<種別>: <変更内容の要約>
```

| 種別 | 用途 |
|---|---|
| `機能` | 新機能の追加 |
| `修正` | バグ修正 |
| `改善` | 既存機能の改善 |
| `整理` | リファクタリング |
| `テスト` | テストの追加・修正 |
| `文書` | ドキュメントの変更 |
| `設定` | 設定ファイルの変更 |

## ディレクトリ構成

```
.
├── CLAUDE.md                          # Claude Code 用ルール
├── AGENTS.md                          # OpenAI Codex 用ルール
├── GEMINI.md                          # Gemini CLI / Antigravity 用コンテキスト
├── .cursor/
│   └── rules/
│       └── usage-driven-development.mdc  # Cursor 用ルール
├── .antigravity/
│   └── rules.md                       # Google Antigravity 用ルール
├── .github/
│   ├── copilot-instructions.md        # GitHub Copilot 用ルール
│   ├── PULL_REQUEST_TEMPLATE.md       # PRテンプレート
│   └── workflows/
│       └── quality-gate.yml           # CI: 品質ゲート
└── scripts/
    ├── test.sh                        # テスト実行
    ├── lint.sh                        # リント・フォーマット
    ├── build.sh                       # ビルド確認
    └── quality-gate.sh                # 品質ゲート（全実行）
```
