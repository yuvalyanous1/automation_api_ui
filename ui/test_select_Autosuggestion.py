import pytest
from playwright.sync_api import Page

def select_subject(page,subject):
    auto_suggestions = page.locator("div.selectable-result-list div")
    index = 0
    while index < auto_suggestions.count():
        suggestion_text = auto_suggestions.nth(index).inner_text()
        print(suggestion_text)
        if suggestion_text == subject:
            auto_suggestions.nth(index).click()
            break
        index += 1

def get_subject_auto(subject):
    return f"//div[contains(@class,'airport-text-airport')]//div[text()='{subject}']"

def select_subject2(page,subject):
    subject_autosuggestion = page.locator(get_subject_auto(subject))
    subject_autosuggestion.wait_for_timeout(5000)
    subject_autosuggestion.click()

@pytest.mark.skip
def test_selected(page: Page,base_url) -> None:
    page.goto(base_url)
    page.get_by_role("button", name="Agree", exact=True).click()
    select_input = page.wait_for_selector('input[placeholder="From"]')
    select_input.fill("IS")
    page.wait_for_timeout(4000)
    page.wait_for_selector('div.selectable-result-list div')
    select_subject(page,"Isfahan")
    page.wait_for_timeout(4000)
    select_input.fill("ro")
    select_subject(page, "Roanoke")
    page.wait_for_timeout(4000)

def test_autosuggestion(page:Page,base_url)->None:
    page.goto(base_url)
    page.get_by_role("button", name="Agree", exact=True).click()
    select_input = page.wait_for_selector('input[placeholder="From"]')
    select_input.fill("IS")
    page.wait_for_selector('div.selectable-result-list div')
    select_subject(page,"Isfahan")
    page.wait_for_timeout(4000)
    select_input.fill("tel")
    page.wait_for_selector('div.selectable-result-list div')
    select_subject2(page, "Tel Aviv")
