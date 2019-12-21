import os
import csv
import cv2
import time
import numpy as np
import matplotlib.pyplot as plt
from collections import defaultdict

projectPath = os.path.dirname(os.path.abspath(__file__))
logFile = open(projectPath + r'\logs.csv', 'w', newline='')
logWriter = csv.writer(logFile)
inputPath = projectPath + r'\images'
outputPath = projectPath + r'\output-dir'
originalImages = {file: cv2.imread(r'{0}\{1}'.format(inputPath, file)) for file in os.listdir(inputPath)}
algorithms = {'kmeans': cv2.KMEANS_RANDOM_CENTERS, 'kmeans++': cv2.KMEANS_PP_CENTERS}
titles = ['Quantised image using k-means algorithm, where K = %i',
          'Quantised image using k-means++ algorithm, where K = %i']


def perform_algorithms(img, quantization_levels):
    quantization_data = defaultdict(dict)
    vectorized = np.float32(img.reshape((-1, 3)))
    criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 10, 1.0)
    for (algorithm_name, algorithm_value), title in zip(algorithms.items(), titles):
        start_timer = time.time()
        _, label, center = cv2.kmeans(vectorized, 2 ** quantization_levels, None, criteria, attempts=10,
                                      flags=algorithm_value)
        end_timer = time.time()
        quantization_data[algorithm_name]['image'] = np.uint8(center)[label.flatten()].reshape(img.shape)
        quantization_data[algorithm_name]['elapsed_time'] = end_timer - start_timer
        quantization_data[algorithm_name]['title'] = title
    return quantization_data


def save_results(iteration, filename, img, quantization_level, quantization_data):
    output_filename = r'{0}_{1}'.format(2 ** quantization_level, filename)
    data_to_log = [output_filename]
    plt.subplot(1, 3, 1), plt.imshow(img)
    plt.title('Original image'), plt.xticks([]), plt.yticks([])
    for index, algorithm_name in enumerate(quantization_data):
        plt.subplot(1, 3, 2 + index), plt.imshow(quantization_data[algorithm_name]['image'])
        psnr = f"{cv2.PSNR(img, quantization_data[algorithm_name]['image']):.5}"
        elapsed_time = f"{quantization_data[algorithm_name]['elapsed_time']:.4}"
        title = quantization_data[algorithm_name]['title'] % 2 ** quantization_level + \
            '\nPSNR = ' + psnr + ', elapsed time = ' + elapsed_time
        plt.title(title), plt.xticks([]), plt.yticks([])
        data_to_log.extend([psnr, elapsed_time])
    plt.savefig(r'{0}\{1}_{2}'.format(outputPath, iteration, output_filename), format='png', bbox_inches='tight')
    plt.clf()
    logWriter.writerow(data_to_log)


def main():
    logWriter.writerow(['Image', 'kmeans PSNR', 'kmeans elapsed time',
                        'kmeans++ PSNR', 'kmeans++ elapsed time'])
    plt.figure(figsize=(20, 8))
    for iteration in range(10):
        for filename, img in originalImages.items():
            img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
            for quantization_level in range(3, 9):
                quantization_data = perform_algorithms(img, quantization_level)
                save_results(iteration, filename, img, quantization_level, quantization_data)
    logFile.close()


if __name__ == '__main__':
    main()
