import numpy as np

from sklearn.cluster import KMeans

if __name__ == '__main__':
    data, cityName = loadData('city.txt')
    km = KMeans(n_clusters = 3)
    label = km.fit_predict(data)
    expenses = np.sum(km.cluster_centers_, axis=1)

    CityCluster = [[],[],[]]
    for i in range(len(cityName)):
        CityCluster[label[i]].append(cityName[i])
    for i in range(len(CityCluster)):
        print("Expenses: %.2f" %expenses[i])
        print(CityCluster[i])
