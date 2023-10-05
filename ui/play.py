from playwright.sync_api import Playwright, sync_playwright, expect


def santiy(playwright: Playwright) -> None:
    browser = playwright.chromium.launch(headless=False)
    context = browser.new_context()
    page = context.new_page()
    page.goto("https://finviz.com/")
    page.get_by_role("link", name="Screener").click()
    page.locator("#fs_cap").select_option("large")
    page.get_by_role("link", name="AEP").click()

    # ---------------------
    context.close()
    browser.close()


with sync_playwright() as playwright:
    santiy(playwright)
