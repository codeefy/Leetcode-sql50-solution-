# 🚗 SQL Problem: Find Unfinished Parts in Assembly 
**https://datalemur.com/questions/tesla-unfinished-parts**

## 📌 Problem Statement

Tesla is investigating production bottlenecks and needs help identifying parts that have **started the assembly process but are not yet finished**.

A part is considered **unfinished** if it does **not have a `finish_date`**.

---

## 🗂️ Table Schema

### `parts_assembly`

| Column Name   | Type     |
|--------------|----------|
| part         | string   |
| finish_date  | datetime |
| assembly_step| integer  |

---

## 📥 Example Input

| part    | finish_date           | assembly_step |
|---------|----------------------|---------------|
| battery | 01/22/2022 00:00:00 | 1             |
| battery | 02/22/2022 00:00:00 | 2             |
| battery | 03/22/2022 00:00:00 | 3             |
| bumper  | 01/22/2022 00:00:00 | 1             |
| bumper  | 02/22/2022 00:00:00 | 2             |
| bumper  | NULL                | 3             |
| bumper  | NULL                | 4             |

---

## 📤 Expected Output

| part   | assembly_step |
|--------|--------------|
| bumper | 3            |
| bumper | 4            |

---

## 💡 Explanation

- All **battery** parts have a `finish_date` → ✅ finished  
- Some **bumper** parts have `NULL finish_date` → ❌ unfinished  
- Therefore, return only those rows where `finish_date` is missing  

---

## 🧠 Intuition

We need to identify rows where the assembly process has started but not completed.

### Key Idea:

- If `finish_date` is **NULL**, the part is still in progress  
- So simply filter rows where `finish_date IS NULL`

This is a classic case of **filtering incomplete records**.

---

## 🧩 SQL Solution

```sql
SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS NULL
ORDER BY part, assembly_step;
