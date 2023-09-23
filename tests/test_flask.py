import requests
from selenium.webdriver.common.by import By

links = ['https://github.com/Ujstor', 'https://github.com/Ujstor/Data-Science-Introduction',
        'https://probit.astipan.com/', 'https://github.com/Ujstor/probit-exchange-api',
        'https://working-hours.astipan.com/', 'https://github.com/Ujstor/streamlit-working-hours',
        'https://fastapi.astipan.com/docs', 'https://github.com/Ujstor/social-media-fastapi',
        'https://www.postman.com/ujstor/workspace/fastapi-test/']

def test_home_page(client):
    response = client.get("/")
    html = response.data.decode()
    assert response.status_code == 200

    assert '<span class="site-title">ALEKSANDAR STIPAN</span>' in html
    assert '<a class="link" href="#about" data-scroll>About Me</a>' in html
    assert '<a class="link" href="#projects" data-scroll>Projects</a>' in html

def test_links():
    for link in links:
        response = requests.get(link)
        assert response.status_code == 200, f"Link {link} returned status code {response.status_code}"

def test_check_links_present(client, driver):
    driver.get('http://localhost:5000')

    page_links = driver.find_elements(By.CSS_SELECTOR, 'a')
    page_links_hrefs = [link.get_attribute('href') for link in page_links]
    for link in links:
        assert link in page_links_hrefs

