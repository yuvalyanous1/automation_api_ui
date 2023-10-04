import re

import pytest
from playwright.sync_api import Page , expect


def test_screener_highrisk(page:Page,base_finviz,select_option_and_get_text)->None:
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

    page.screenshot(path="result.png")

