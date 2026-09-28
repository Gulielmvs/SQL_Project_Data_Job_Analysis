import pandas as pd
import matplotlib.pyplot as plt

# Query 4 results
data = {
    "skill": [
        "Node", "Mongo", "ggplot2", "Solidity", "Vue",
        "CodeCommit", "Ubuntu", "Clojure", "Cassandra", "Rust",
        "Drupal", "Perl", "Next.js", "Angular", "Scala",
        "Kafka", "GDPR", "Shell", "macOS", "NumPy",
        "OpenCV", "Atlassian", "IBM Cloud", "Splunk", "Kubernetes"
    ],
    "average_salary": [
        181861.78, 179402.54, 176250.00, 166250.00, 159375.00,
        155000.00, 154455.00, 153662.60, 150255.30, 147770.73,
        147500.00, 145539.92, 145000.00, 143318.96, 143161.07,
        143085.77, 142368.74, 141724.61, 141616.67, 141605.32,
        141250.00, 140643.52, 140546.60, 140156.30, 140091.81
    ]
}

df = pd.DataFrame(data)

# Sort for horizontal bar chart
df = df.sort_values("average_salary")

# Create chart
plt.figure(figsize=(10, 6))

bars = plt.barh(
    df["skill"],
    df["average_salary"],
    color="#2F6B9A"
)

# Add values to the bars
for bar in bars:
    plt.text(
        bar.get_width() + 2000,
        bar.get_y() + bar.get_height() / 2,
        f"${bar.get_width():,.0f}",
        va="center"
    )

# Titles and labels
plt.title(
    "Top 25 Skills by Average Salary for Data Engineers — 2023",
    fontsize=14,
    fontweight="bold"
)

plt.xlabel("Average Annual Salary ($)")
plt.ylabel("Skill")

plt.xlim(0, 200000)

plt.grid(
    axis="x",
    linestyle="--",
    alpha=0.3
)

plt.tight_layout()

# Save chart
plt.savefig(
    "top_25_skills_by_average_salary.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()
