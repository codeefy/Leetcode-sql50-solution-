# 🛒 Finding User Purchases

**Difficulty:** Medium  
**Last Updated:** April 2026  
**Problem ID:** 10322  

---

## 📌 Problem Statement

Identify **returning active users** by finding users who made a **second purchase within 1 to 7 days after their first purchase**.

### 🔍 Requirements:
- Consider only the **first purchase** and the **next purchase after that**
- Ignore **same-day purchases**
- The second purchase must occur **within 1 to 7 days (inclusive)** after the first purchase
- Output a list of **user_id**

---

## 🗂️ Table: `amazon_transactions`

| Column       | Type    | Description                  |
|-------------|--------|------------------------------|
| id          | bigint | Unique transaction ID        |
| user_id     | bigint | User identifier              |
| item        | text   | Purchased item               |
| created_at  | date   | Purchase date                |
| revenue     | bigint | Revenue from transaction     |

---

## 📊 Sample Data

| id | user_id | item    | created_at | revenue |
|----|--------|--------|------------|---------|
| 1  | 109    | milk   | 2020-03-03 | 123     |
| 2  | 139    | biscuit| 2020-03-18 | 421     |
| 3  | 120    | milk   | 2020-03-18 | 176     |
| ...| ...    | ...    | ...        | ...     |

---

## 🎯 Expected Output

A list of `user_id` who:
- Made a **first purchase**
- Then made a **second purchase within 1–7 days**


## 💡 Approach

1. Find the **first purchase date per user**
2. Find the **earliest purchase after the first purchase**
3. Ensure:
   - Second purchase date > first purchase date  
   - Difference between dates is between **1 and 7 days**
4. Return distinct `user_id`
