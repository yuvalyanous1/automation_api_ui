import requests

endpoints_data = [
    ("/screener.ashx?", {'v': '111', 'f': 'cap_large,sh_avgvol_o400,sh_curvol_o400,sh_float_o50,sh_relvol_o1.5'}),
    ("/screener.ashx?", {'v': '111', 'f': 'sh_avgvol_o400,sh_curvol_o400,sh_float_o50,sh_relvol_o1.5'}),
    ("/quote.ashx?", {'t': 'aapl'}),
    ("/map.ashx?", {'t': 'sec'}),
    ("/map.ashx?", {'t': 'geo'}),
    ("/map.ashx?", {'t': 'geo', 'st': 'w1'}),
    ("/map.ashx?", {'t': 'geo', 'st': 'w4'}),
    ("/map.ashx?", {'t': 'geo', 'st': 'w52'})
]

def test_api_endpoints(headers, base_url):
    for endpoint, data in endpoints_data:
        url = base_url + endpoint
        response = requests.get(url, params=data, headers=headers)
        assert response.ok
        if response.ok:
            print("API request successful")
            print("Status code:", response.status_code)
        else:
            print("API request failed")
            print("Response status code:", response.status_code)
            print("Response content:", response.text)

def test_multiple_runs(headers, base_url):
    for _ in range(5):
        test_api_endpoints(headers, base_url)