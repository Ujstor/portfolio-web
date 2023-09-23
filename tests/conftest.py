import pytest
from website import create_app
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
import os

@pytest.fixture()
def app():
    app = create_app()
    app.config.update({
        "TESTING": True,
    })
    yield app

@pytest.fixture()
def client(app):
    return app.test_client()

@pytest.fixture()
def driver():
    chrome_options = Options()
    chrome_options.add_argument("--headless")

    chrome_path = 'chromium-browser'
    chrome_options.binary_location = '/usr/bin/' + chrome_path

    driver = webdriver.Chrome(options=chrome_options)
    yield driver
    driver.quit()





