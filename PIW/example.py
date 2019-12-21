import numpy as np
import cv2
import matplotlib.pyplot as plt
import os

inputPath = os.path.dirname(os.path.abspath(__file__)) + r'\images'
outputPath = os.path.dirname(os.path.abspath(__file__)) + r'\output-dir'
originalImages = {file: cv2.imread(r'{0}\{1}'.format(inputPath, file)) for file in os.listdir(inputPath)}
initClusters = (cv2.KMEANS_RANDOM_CENTERS, cv2.KMEANS_PP_CENTERS)
titles = ['Quantised image using k-means algorithm, where K = %i',
          'Quantised image using k-means++ algorithm, where K = %i']
# łącznie 10 obrazów; 10 próbek dla każdego algorytmu
for filename, img in originalImages.items():
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    vectorized = np.float32(img.reshape((-1, 3)))
    criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 10, 1.0)
    for quantizationLevels in range(1, 9): # poziomy od 8 od 256
        attempts = 10
        quantisedImages = list()
        for cluster in initClusters: # tu zmierzyć czas
            [ret, label, center] = cv2.kmeans(vectorized, 2 ** quantizationLevels, None, criteria, attempts, cluster)
            quantisedImages.append(np.uint8(center)[label.flatten()].reshape(img.shape))
        plt.figure(figsize=(20, 8))
        plt.subplot(1, 3, 1), plt.imshow(img)
        plt.title('Original image'), plt.xticks([]), plt.yticks([])
        for index, (quantisedImg, title) in enumerate(zip(quantisedImages, titles)):
            plt.subplot(1, 3, 2 + index), plt.imshow(quantisedImg)
            plt.title(title % 2 ** quantizationLevels + '\nPSNR = ' + str(cv2.PSNR(img, quantisedImg)))
            plt.xticks([]), plt.yticks([])
        plt.savefig(r'{0}\{1}_{2}'.format(outputPath, 2 ** quantizationLevels, filename), format='png', bbox_inches='tight')
