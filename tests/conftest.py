import pytest
from website import create_app
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
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
    chrome_options.add_argument("--disable-dev-shm-usage")
    chrome_options.add_argument("--no-sandbox")

    chromedriver_path = os.path.abspath('./chromedriver')
    os.environ['PATH'] += ':' + chromedriver_path

    driver = webdriver.Chrome(options=chrome_options)
    yield driver
    driver.quit()





