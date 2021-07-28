# テーブル設計

## usersテーブル

| Colum              | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| birthday           | date    | null: false               |
| phone              | string  | null: false               |

### Association

- has_many   :successes
- has_many   :emotions
- has_many   :messages
- has_many   :notes

## successesテーブル

| Colum | Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| title | string     | null: false                    |
| text  | text       | null: false                    |
| user  | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## emotionsテーブル

| Colum | Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| title | string     | null: false                    |
| text  | text       | null: false                    |
| user  | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## messagesテーブル

| Colum   | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## notesテーブル

| Colum   | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
