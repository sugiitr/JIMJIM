# API規約

## エンドポイント設計

### RESTful命名規則
- リソースは複数形の名詞: `/users`, `/posts`
- アクションはHTTPメソッドで表現
- 階層は2〜3レベルまで: `/users/{id}/posts`

### HTTPメソッドの使い分け
| メソッド | 用途 | 例 |
|---------|------|-----|
| GET | 取得（副作用なし） | `GET /users` |
| POST | 作成 | `POST /users` |
| PUT | 全体更新（べき等） | `PUT /users/{id}` |
| PATCH | 部分更新 | `PATCH /users/{id}` |
| DELETE | 削除 | `DELETE /users/{id}` |

## レスポンス形式

### 成功レスポンス
```json
{
  "data": { ... },
  "meta": {
    "total": 100,
    "page": 1
  }
}
```

### エラーレスポンス
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "入力値が不正です",
    "details": [
      { "field": "email", "message": "メールアドレスの形式が不正です" }
    ]
  }
}
```

## HTTPステータスコード

| コード | 意味 | 使用場面 |
|-------|------|---------|
| 200 | OK | 正常取得・更新 |
| 201 | Created | リソース作成成功 |
| 204 | No Content | 削除成功 |
| 400 | Bad Request | バリデーションエラー |
| 401 | Unauthorized | 未認証 |
| 403 | Forbidden | 権限なし |
| 404 | Not Found | リソースなし |
| 500 | Internal Server Error | サーバーエラー |

## 認証

- JWT Bearer Token: `Authorization: Bearer <token>`
- トークン有効期限: アクセストークン 1時間 / リフレッシュトークン 30日
- APIキー: `X-API-Key: <key>` ヘッダー

## バージョニング

- URLパス方式: `/api/v1/users`
- 廃止予告は最低3ヶ月前に告知

## ページネーション

```
GET /users?page=1&limit=20
GET /users?cursor=<cursor>&limit=20
```

## レート制限

- デフォルト: 100リクエスト/分
- ヘッダーで制限情報を返す:
  - `X-RateLimit-Limit: 100`
  - `X-RateLimit-Remaining: 42`
  - `X-RateLimit-Reset: 1234567890`
