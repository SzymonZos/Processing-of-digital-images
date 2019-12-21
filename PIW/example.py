import numpy as np
import cv2
import matplotlib.pyplot as plt
import os
import time
from collections import defaultdict

projectPath = os.path.dirname(os.path.abspath(__file__))
logFile = open(projectPath + r'\logs.txt', 'w')
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
    for (algorithm_name, algorithm_value), title in zip(algorithms.items(), titles):  # tu zmierzyć czas
        start_timer = time.time()
        _, label, center = cv2.kmeans(vectorized, 2 ** quantization_levels, None, criteria, attempts=10,
                                      flags=algorithm_value)
        end_timer = time.time()
        quantization_data[algorithm_name]['image'] = np.uint8(center)[label.flatten()].reshape(img.shape)
        quantization_data[algorithm_name]['elapsed_time'] = end_timer - start_timer
        quantization_data[algorithm_name]['title'] = title
    return quantization_data


def save_results(filename, img, quantization_levels, quantization_data):
    plt.figure(figsize=(20, 8))
    plt.subplot(1, 3, 1), plt.imshow(img)
    plt.title('Original image'), plt.xticks([]), plt.yticks([])
    for index, algorithm_name in enumerate(quantization_data):
        plt.subplot(1, 3, 2 + index), plt.imshow(quantization_data[algorithm_name]['image'])
        title = quantization_data[algorithm_name]['title'] % 2 ** quantization_levels + \
                '\nPSNR = ' + str(cv2.PSNR(img, quantization_data[algorithm_name]['image']))
        logFile.write(title + '\n')
        plt.title(title), plt.xticks([]), plt.yticks([])
    output_filename = r'\{0}_{1}'.format(2 ** quantization_levels, filename)
    logFile.write(output_filename + '\n\n\n')
    plt.savefig(outputPath + output_filename, format='png', bbox_inches='tight')


# łącznie 10 obrazów; 10 próbek dla każdego algorytmu
def main():
    for filename, img in originalImages.items():
        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        for quantization_levels in range(1, 2):  # poziomy od 8 od 256
            quantization_data = perform_algorithms(img, quantization_levels)
            save_results(filename, img, quantization_levels, quantization_data)


if __name__ == '__main__':
    main()
