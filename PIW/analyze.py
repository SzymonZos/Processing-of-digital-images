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
        kmeansStatistics[imageName][logType]["mean"] \
            .append(f"{statistics.mean([float(value) for value in values]):.5}")
        kmeansStatistics[imageName][logType]["stdev"] \
            .append(f"{statistics.stdev([float(value) for value in values]):.4}")

x = [8, 16, 32, 64, 128, 256]

for image, logs in kmeansStatistics.items():
    f = plt.figure(figsize=(12.8, 9.6), clear=True)
    for logType in sorted(logs, key=lambda log: len(log)):
        if "PSNR" in logType:
            subplotIndex = 0
        else:
            subplotIndex = 2
        for stat in logs[logType]:
            print(image + ', ' + logType + ', ' + stat + ', ' + str(subplotIndex))
            if "kmeans++" in logType:
                color = 'bo'
            else:
                color = 'r^'
            subplotIndex += 1
            f.add_subplot(2, 2, subplotIndex)
            plt.plot(x, [float(value) for value in kmeansStatistics[image][logType][stat]], color)
            if "kmeans++" in logType:
                logTypeShortcut = logType[len("kmeans++") + 1:]
                plt.title(image + ': ' + logTypeShortcut + ' - ' + stat), plt.legend(['kmeans', 'kmeans++'])
                plt.xlabel("Number of quantization levels"), plt.ylabel(logTypeShortcut), plt.grid(True)
    # f.show()
    plt.savefig(r'{0}\stats\{1}_stat.png'.format(projectPath, image), format='png', bbox_inches='tight')
