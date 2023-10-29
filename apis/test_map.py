import requests
import pytest

def test_map_SP500(headers, base_url):
    endpoint = "/map.ashx?"
    url = base_url + endpoint

    data = {
        't': 'sec',
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

def test_map_world(headers, base_url):
    endpoint = "/map.ashx?"
    url = base_url + endpoint

    data = {
        't': 'geo',
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

def test_map_week(headers, base_url):
    endpoint = "/map.ashx?"
    url = base_url + endpoint

    data = {
        't': 'geo',
        'st': 'w1'
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

def test_map_month(headers, base_url):
    endpoint = "/map.ashx?"
    url = base_url + endpoint

    data = {
        't': 'geo',
        'st': 'w4'
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

def test_map_year(headers, base_url):
    endpoint = "/map.ashx?"
    url = base_url + endpoint

    data = {
        't': 'geo',
        'st': 'w52'
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

