# 🧠 SQL Problem: Find Qualified Data Science Candidates

## 📌 Problem Statement

Given a table of candidates and their skills, you need to identify candidates who are best suited for a Data Science role.

A candidate is considered qualified if they have **all three required skills**:

- Python  
- Tableau  
- PostgreSQL  

---

## 🗂️ Table Schema

### `candidates`

| Column Name   | Type    |
|--------------|--------|
| candidate_id | integer |
| skill        | varchar |

---

## 📥 Example Input

| candidate_id | skill        |
|-------------|-------------|
| 123         | Python      |
| 123         | Tableau     |
| 123         | PostgreSQL  |
| 234         | R           |
| 234         | PowerBI     |
| 234         | SQL Server  |
| 345         | Python      |
| 345         | Tableau     |

---

## 📤 Expected Output

| candidate_id |
|-------------|
| 123         |

---

## 💡 Explanation

- Candidate **123** has all required skills → ✅ included  
- Candidate **345** is missing PostgreSQL → ❌ excluded  

---

## 🧩 SQL Solution

```sql
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) = 3
ORDER BY candidate_id;
