import requests
import pytest

def test_search_stock(headers, base_url):
    endpoint = "/quote.ashx?"
    url = base_url + endpoint

    data = {
        't': 'aapl',
        't': 'GOOG',
    }

    response = requests.get(url, data=data, headers=headers)

    assert response.ok
    if response.ok:
        print("API request successful")
        print("Status code:", response.status_code)
    else:
        print("API request failed")
        print("Response status code:", response.status_code)
        print("Response content:", response.text)
