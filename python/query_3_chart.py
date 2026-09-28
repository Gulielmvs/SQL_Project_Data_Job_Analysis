import pandas as pd
import matplotlib.pyplot as plt

# Query 3 results
data = {
    "skill": ["SQL", "Python", "AWS", "Azure", "Spark"],
    "demand_count": [113375, 108265, 62174, 60823, 53789]
}

df = pd.DataFrame(data)

# Sort for horizontal bar chart
df = df.sort_values("demand_count")

# Create chart
plt.figure(figsize=(10, 6))

bars = plt.barh(
    df["skill"],
    df["demand_count"],
    color="#2F6B9A"
)

# Add values to the bars
for bar in bars:
    plt.text(
        bar.get_width() + 2000,
        bar.get_y() + bar.get_height() / 2,
        f"{bar.get_width():,.0f}",
        va="center"
    )

# Titles and labels
plt.title(
    "Top 5 Most In-Demand Skills for Data Engineers — 2023",
    fontsize=14,
    fontweight="bold"
)

plt.xlabel("Demand Count")
plt.ylabel("Skill")

plt.xlim(0, 125000)

plt.grid(
    axis="x",
    linestyle="--",
    alpha=0.3
)

plt.tight_layout()

# Save chart
plt.savefig(
    "top_5_in_demand_skills.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()
