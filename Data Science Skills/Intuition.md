## 🧠 Intuition

The goal is to find candidates who have **all the required skills**: Python, Tableau, and PostgreSQL.

Each candidate can have multiple rows in the table (one for each skill). So instead of checking row by row, we need to **look at all skills of a candidate together**.

### Key Idea:

- First, filter only the relevant skills (Python, Tableau, PostgreSQL)
- Then, group the data by `candidate_id`
- Count how many **distinct required skills** each candidate has
- If the count is **3**, it means the candidate has all required skills

### Why This Works:

If a candidate has:
- Python ✅  
- Tableau ✅  
- PostgreSQL ✅  

Then count = 3 → include them

If any skill is missing:
- Count < 3 → exclude them

So instead of checking each skill separately, we use **aggregation to verify completeness**.

### Thinking Pattern:

```text
Group → Count → Compare with required number of skills
