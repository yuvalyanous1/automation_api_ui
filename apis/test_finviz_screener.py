import requests

def test_screener_get():
    base_url = "https://finviz.com/screener.ashx"

    params = {
        'v': '111',
        'f': 'cap_large,sh_avgvol_o400,sh_curvol_o400,sh_float_o50,sh_relvol_o1.5'
    }
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
        'Referer': 'https://finviz.com/screener.ashx',
    }

    response = requests.get(base_url, data=params , headers=headers)

    assert response.ok
    if response.ok:
        print("API request successful")
        try:
            response_json = response.json()
            print(response_json)
        except ValueError as e:
            print("Failed to decode JSON response:", str(e))
    else:
        print("API request failed")
        print("Response status code:", response.status_code)
        print("Response content:", response.text)


def test_screener_put():
    base_url = "https://finviz.com/screener.ashx"

    data = {
        'v': '111',
        'f': 'sh_avgvol_o400,sh_curvol_o400,sh_float_o50,sh_relvol_o1.5'
    }

    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
        'Referer': 'https://finviz.com/screener.ashx',
    }


    response = requests.put(base_url, data=data , headers=headers)


    assert response.ok
    if response.ok:
        print("API request successful")
        try:
            response_json = response.json()
            print(response_json)
        except ValueError as e:
            print("Failed to decode JSON response:", str(e))
    else:
        print("API request failed")
        print("Response status code:", response.status_code)
        print("Response content:", response.text)
