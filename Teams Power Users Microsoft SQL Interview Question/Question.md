# 📊 Top 2 Power Users (SQL)

## 📝 Problem Statement

Write a query to identify the **top 2 Power Users** who sent the highest number of messages on Microsoft Teams in **August 2022**.

### 📌 Output Requirements:
- Display `sender_id`
- Display total number of messages sent as `message_count` 
- Sort results in **descending order** of message count

---

## ⚠️ Assumptions

- No two users have sent the same number of messages in August 2022

---

## 🗂️ Table Schema

### `messages` Table

| Column Name  | Type      |
|-------------|----------|
| message_id  | integer  |
| sender_id   | integer  |
| receiver_id | integer  |
| content     | varchar  |
| sent_date   | datetime |

---

## 📥 Example Input

| message_id | sender_id | receiver_id | content                  | sent_date           |
|------------|----------|-------------|--------------------------|---------------------|
| 901        | 3601     | 4500        | You up?                  | 2022-08-03 00:00:00 |
| 902        | 4500     | 3601        | Only if you're buying    | 2022-08-03 00:00:00 |
| 743        | 3601     | 8752        | Let's take this offline  | 2022-06-14 00:00:00 |
| 922        | 3601     | 4500        | Get on the call          | 2022-08-10 00:00:00 |

---

## 📤 Example Output

| sender_id | message_count |
|----------|--------------|
| 3601     | 2            |
| 4500     | 1            |

---

## 💡 Approach

1. Filter records for **August 2022**
2. Group by `sender_id`
3. Count messages using `COUNT(*)`
4. Sort by message count (descending)
5. Select top 2 users using `LIMIT`

---

## ✅ SQL Solution

```sql
SELECT sender_id,
       COUNT(*) AS message_count
FROM messages
WHERE sent_date >= '2022-08-01'
  AND sent_date < '2022-09-01'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;
