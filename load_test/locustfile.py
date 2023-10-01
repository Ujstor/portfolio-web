from locust import HttpUser, task

class LoadTest(HttpUser):
    @task
    def root_test(self):
        self.client.get ('/')