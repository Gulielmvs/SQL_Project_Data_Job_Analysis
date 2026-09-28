import pandas as pd
import matplotlib.pyplot as plt

# Query 5 results
data = {
    "skill": [
        "Node", "Mongo", "Cassandra", "Rust", "Perl",
        "Angular", "Scala", "Kafka", "GDPR", "Shell",
        "NumPy", "Atlassian", "IBM Cloud", "Splunk", "Kubernetes",
        "Golang", "Redshift", "MySQL", "No-SQL", "Snowflake",
        "FastAPI", "Java", "Airflow", "Elasticsearch", "NoSQL"
    ],
    "demand_count": [
        29, 120, 269, 15, 39,
        42, 794, 872, 38, 365,
        59, 33, 15, 50, 371,
        40, 780, 408, 55, 1072,
        13, 1154, 737, 122, 822
    ],
    "average_salary": [
        181861.78, 179402.54, 150255.30, 147770.73, 145539.92,
        143318.96, 143161.07, 143085.77, 142368.74, 141724.61,
        141605.32, 140643.52, 140546.60, 140156.30, 140091.81,
        139884.50, 139526.65, 138612.53, 137940.59, 137425.78,
        137404.65, 137307.43, 137261.53, 136743.95, 136546.81
    ]
}

df = pd.DataFrame(data)

# Create chart
plt.figure(figsize=(10, 6))

plt.scatter(
    df["demand_count"],
    df["average_salary"],
    color="#2F6B9A",
    s=70
)

# Add skill labels
for _, row in df.iterrows():
    plt.annotate(
        row["skill"],
        (row["demand_count"], row["average_salary"]),
        xytext=(5, 5),
        textcoords="offset points",
        fontsize=9
    )

# Titles and labels
plt.title(
    "Demand vs. Average Salary for Data Engineer Skills — 2023",
    fontsize=14,
    fontweight="bold"
)

plt.xlabel("Demand Count")
plt.ylabel("Average Salary ($)")

plt.grid(
    linestyle="--",
    alpha=0.3
)

plt.tight_layout()

# Save chart
plt.savefig(
    "skills_demand_vs_salary.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()
