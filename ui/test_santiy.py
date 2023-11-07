from playwright.sync_api import Page , expect

def test_light_dark(page:Page,base_finviz)->None:
    page.goto(base_finviz)
    page.get_by_test_id("chart-layout-theme").click()
    chaked = page.get_by_test_id("chart-layout-theme")
    page.wait_for_timeout(2000)
    assert chaked.is_visible()
