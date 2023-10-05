from playwright.sync_api import Playwright, sync_playwright, expect


def santiy(playwright: Playwright) -> None:
    browser = playwright.chromium.launch(headless=True)
    context = browser.new_context()
    page = context.new_page()
    page.goto("https://finviz.com/")
    page.wait_for_selector('link[name="Screener"]', timeout=5000)
    page.locator("#fs_cap").select_option("large")
    page.wait_for_timeout(4000)
    page.get_by_role("link", name="AEP").click()
    page.wait_for_timeout(4000)
    # ---------------------
    context.close()
    browser.close()


with sync_playwright() as playwright:
    santiy(playwright)
