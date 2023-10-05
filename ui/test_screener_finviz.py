import re

from playwright.sync_api import Playwright , expect

def test_screener_highrisk(playwright: Playwright,base_finviz,select_option_and_get_text)->None:
    browser = playwright.chromium.launch(headless=False)
    context = browser.new_context()
    page = context.new_page()
    page.goto(base_finviz)
    expect(page).to_have_url(re.compile(".*finviz"))
    page.get_by_role("link", name="Screener").click()

                   # -----------------marketcap---------------------- #
    select_option_and_get_text(page, "#fs_cap", "large", 'Large ($10bln to $200bln)')

                 # ----------------average volume------------------ #
    select_option_and_get_text(page, "#fs_sh_avgvol", "o400",'Over 400K')

                # ----------------Relative Volume------------------ #
    select_option_and_get_text(page, "#fs_sh_relvol", "o1.5" ,'Over 1.5')

                       # ----------------Float------------------ #
    select_option_and_get_text(page, "#fs_sh_float", "o50" ,'Over 50M')

                 # ----------------Current Volume------------------ #
    select_option_and_get_text(page, "#fs_sh_curvol", "o400" ,'Over 400K')

    page.screenshot(path="filter1.png")