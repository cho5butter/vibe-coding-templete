#!/usr/bin/env bash
set -euo pipefail

# =============================================================================
# クロスAIレビュー: 直近の計画セッションの変更差分サマリーを生成する
# 使い方: bash scripts/cross-review.sh [ベースコミット]
#   ベースコミット省略時は直近のコミットとの差分を生成
# =============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
OUTPUT_FILE="$PROJECT_ROOT/.cross-review-summary.md"

# ベースコミットの決定
if [ $# -ge 1 ]; then
    BASE_COMMIT="$1"
else
    # 直近のマージベースまたは1つ前のコミットを使用
    BASE_COMMIT="HEAD~1"
fi

echo "========================================"
echo "  クロスAIレビュー: 差分サマリー生成"
echo "========================================"
echo ""
echo "ベースコミット: $BASE_COMMIT"
echo "出力先: $OUTPUT_FILE"
echo ""

# 差分サマリーの生成
{
    echo "# クロスAIレビュー — 変更差分サマリー"
    echo ""
    echo "生成日時: $(date '+%Y-%m-%d %H:%M:%S')"
    echo ""

    echo "## 変更ファイル一覧"
    echo ""
    echo '```'
    git diff --stat "$BASE_COMMIT"..HEAD 2>/dev/null || echo "(差分なし)"
    echo '```'
    echo ""

    echo "## 変更の詳細 (diff)"
    echo ""
    echo '```diff'
    git diff "$BASE_COMMIT"..HEAD 2>/dev/null || echo "(差分なし)"
    echo '```'
    echo ""

    echo "## コミットログ"
    echo ""
    echo '```'
    git log --oneline "$BASE_COMMIT"..HEAD 2>/dev/null || echo "(コミットなし)"
    echo '```'
    echo ""

    echo "## レビュー観点"
    echo ""
    echo "以下の観点でレビューしてください:"
    echo ""
    echo "1. **要件との整合性**: \`spec/requirements.md\` の要件・受け入れ基準を満たしているか"
    echo "2. **設計との整合性**: \`spec/design.md\` の設計方針に沿っているか"
    echo "3. **コード品質**: 可読性、保守性、命名規約"
    echo "4. **セキュリティ**: OWASP Top 10 の観点での脆弱性チェック"
    echo "5. **テストの十分性**: エッジケース・異常系のカバレッジ"
    echo "6. **パフォーマンス**: 明らかな非効率がないか"
} > "$OUTPUT_FILE"

echo "差分サマリーを生成しました: $OUTPUT_FILE"
echo ""
echo "=========================================="
echo "  次のステップ: レビューAIに依頼"
echo "=========================================="
echo ""
echo "Codex でレビューする場合:"
echo '  codex "$(cat .cross-review-summary.md) 上記の変更をレビューしてください。"'
echo ""
echo "Claude CLI でレビューする場合:"
echo '  claude "$(cat .cross-review-summary.md) 上記の変更をレビューしてください。"'
