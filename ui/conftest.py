import pytest


@pytest.fixture(scope='session')
def base_url()->str:
    return "https://www.austrian.com/lt/en/homepage"


@pytest.fixture(scope='session')
def base_finviz()->str:
    return "https://finviz.com/"




@pytest.fixture
def select_option_and_get_text():
    def _select_option_and_get_text(page, element_locator, option_value, expected_text):
        page.locator(element_locator).select_option(option_value)
        page.wait_for_timeout(5000)
        selected_value = page.locator(element_locator + " > option[value='" + option_value + "']")
        assert selected_value.inner_text() == expected_text
    return _select_option_and_get_text