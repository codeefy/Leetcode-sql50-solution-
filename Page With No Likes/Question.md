# 📘 SQL Problem: Find Facebook Pages with Zero Likes

## 📌 Problem Statement

You are given two tables:

- `pages` → contains information about Facebook pages  
- `page_likes` → contains data about users liking pages  

Your task is to **find the IDs of pages that have received zero likes**.

👉 Return the result sorted by `page_id` in ascending order.

---

## 🗂️ Table Schema

### `pages`

| Column Name | Type    |
|------------|--------|
| page_id    | integer |
| page_name  | varchar |

---

### `page_likes`

| Column Name | Type     |
|------------|---------|
| user_id    | integer |
| page_id    | integer |
| liked_date | datetime |

---

## 📥 Example Input

### pages

| page_id | page_name              |
|--------|------------------------|
| 20001  | SQL Solutions          |
| 20045  | Brain Exercises        |
| 20701  | Tips for Data Analysts |

---

### page_likes

| user_id | page_id | liked_date           |
|--------|--------|----------------------|
| 111    | 20001  | 04/08/2022 00:00:00 |
| 121    | 20045  | 03/12/2022 00:00:00 |
| 156    | 20001  | 07/25/2022 00:00:00 |

---

## 📤 Expected Output

| page_id |
|--------|
| 20701  |

---

## 💡 Explanation

- Page **20001** → has likes → ❌ exclude  
- Page **20045** → has likes → ❌ exclude  
- Page **20701** → no likes → ✅ include  

---

## 🧠 Intuition

We need to find pages that **do not appear in the `page_likes` table**.

### Key Idea:

- Perform a **LEFT JOIN** from `pages` to `page_likes`
- Keep only rows where no match is found (`NULL`)

---

## 🧩 SQL Solution

```sql
SELECT p.page_id
FROM pages p
LEFT JOIN page_likes pl
ON p.page_id = pl.page_id
WHERE pl.page_id IS NULL
ORDER BY p.page_id;
