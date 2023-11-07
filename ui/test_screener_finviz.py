import pytest
from conftest import page, base_finviz, select_option_and_get_text
from playwright.sync_api import expect

def test_screener_highrisk(p,base_finviz,select_option_and_get_text)->None:
    page.goto(base_finviz)
    expect(page).to_have_url(p.compile(".*finviz"))
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
    print("test_screener_highrisk test function called")
    page.screenshot(path="filter1.png")