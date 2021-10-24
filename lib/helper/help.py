import requests
import json
import pandas as pd

url = "http://127.0.0.1:8080/animals"
headers = {
  'Content-Type': 'application/json'
}


def lerTabela():
    tabelita = pd.read_excel(r"C:\Users\dougl\Desktop\Flutter\APS-8\animal_dex_aps8Sm\Pokedex.xlsx")

    count = 0

    for line in tabelita.values:
        payload = criaOBJ(line)
        response = requests.request("POST", url, headers=headers, data=payload)
        print(count)
        count = count + 1


def criaOBJ(line):
    payload = json.dumps({
        "popularName": line[1],
        "specie": line[2],
        "familly": line[3],
        "orderName": line[4],
        "phylum": line[5],
        "poisonous": False if line[6].lower() == "NÃO".lower() else True,
        "description": line[7],
        "weight": line[8],
        "height": line[9],
        "imageId": line[0]
    })
    return payload


def inserirImages():
    urlImages = "http://127.0.0.1:8080/images"

    payload = {}
    headersImgs = {
        'enctype': 'multipart/form-data'
    }

    for count in range(100):
        pathImg = 'C:/Users/dougl/Desktop/Flutter/APS-8/animal_dex_aps8sm_imagens/' + str((count + 1)) + '.jpg'
        print(pathImg)
        files = [
            ('image', ('1.jpg', open(pathImg, 'rb'), 'image/jpeg'))
        ]
        response = requests.request("POST", urlImages, headers=headersImgs, data=payload, files=files)
        print(response)


if __name__ == '__main__':
    print("Antes")
    lerTabela()
    inserirImages()
    print("Depois")