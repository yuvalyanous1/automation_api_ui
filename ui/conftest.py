import pytest


@pytest.fixture(scope='session')
def base_url()->str:
    return "https://www.austrian.com/lt/en/homepage"