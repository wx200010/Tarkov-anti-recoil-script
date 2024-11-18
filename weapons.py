import pyautogui
import time
import win32api
import random
import keyboard

delay = 0.012
def fire(offset, duration):
    global delay
    a = win32api.GetKeyState(0x01)
    count = 0
    downshift = int(offset)
    while a < 0:    
        if (count <= duration):
            win32api.mouse_event(0x01, 0, downshift)
            time.sleep(delay)
        count += 1
        a = win32api.GetKeyState(0x01)
    return

def fire_highmode(offset, duration):
    global delay
    a = win32api.GetKeyState(0x01)
    count = 0
    downshift = int(offset * 4.25)
    while a < 0:    
        if (count <= duration):
            win32api.mouse_event(0x01, 0, downshift)
            time.sleep(delay)
        count += 1
        a = win32api.GetKeyState(0x01)
    return


def fire_hot(offset, duration):
    global delay
    a = win32api.GetKeyState(0x01)
    count = 0
    downshift = int(offset * 2.5)
    while a < 0:    
        if (count <= duration):
            win32api.mouse_event(0x01, 0, downshift)
            time.sleep(delay)
        count += 1
        a = win32api.GetKeyState(0x01)
    return