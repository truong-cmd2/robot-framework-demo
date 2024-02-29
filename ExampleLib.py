from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time


class ExampleLib:

    """Library for demo purposes.

    This library is only used in an example and it does't do anything useful.
    """

    
    def someaction(self):
        """Takes one argument and *does nothing* with it.

        Example:
        | Your Keyword | xxx |
        | Your Keyword | yyy |
        """
        print("this is a custom library")
        driver = webdriver.Chrome()
        driver.get("https://www.python.org")
        time.sleep(10)
        pass
