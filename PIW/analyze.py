import os
import csv
from collections import defaultdict
import statistics
import re
import matplotlib.pyplot as plt

projectPath = os.path.dirname(os.path.abspath(__file__))
with open(projectPath + r'\logs.csv', 'r') as logFile:
    logs = [log for log in csv.reader(logFile)]

sortedLogs = defaultdict(lambda: defaultdict(list))
for row in logs[1:]:
    for index, log in enumerate(row[1:]):
        sortedLogs[logs[0][index+1]][row[0]].append(log)

kmeansStatistics = defaultdict(lambda: defaultdict(lambda: defaultdict(list)))
for logType, log in sortedLogs.items():
    for image, values in log.items():
        imageName = re.search(R"(?<=_).+(?=\.)", image).group(0)
        kmeansStatistics["mean"][imageName][logType] \
            .append(f"{statistics.mean([float(value) for value in values]):.5}")
        kmeansStatistics["stdev"][imageName][logType] \
            .append(f"{statistics.stdev([float(value) for value in values]):.4}")

plt.figure()
color = 'r^'
x = [8, 16, 32, 64, 128, 256]
for stat, data in kmeansStatistics.items():
    for image in data:
        for logType in sorted(kmeansStatistics[stat][image], key=lambda x: len(x)):
            plt.plot(x, [float(value) for value in kmeansStatistics[stat][image][logType]], color)
            if "kmeans++" in logType:
                logType = logType[len("kmeans++") + 1:]
                plt.title(stat + ', ' + image + ', ' + logType), plt.legend(['kmeans', 'kmeans++'])
                plt.savefig(r'{0}\stats\{1}_{2}_{3}.png'.format(projectPath, stat, image, logType), format='png')
                plt.clf()
                color = 'r^'
            else:
                color = 'bo'
