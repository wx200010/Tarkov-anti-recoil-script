# coding: utf-8
import time
import win32api
import win32con
import keyboard
import weapons
from pynput.mouse import Listener

PrimaryWeapon = 'sr3m'.upper()  #  primary weapon's name
SecondWeapon = 'SPEAR'.upper()   #  secondary weapon's name

Flexible = [False, True]     # True : variable zoom scope,    False: Non-variable zoom scope
HighMode = [False, False]    # True : >1x scope,             False: 1x scope
counterRate = [0.5, 0.6, 0.75, 1.0, 1.35, 1.8, 2.4, 3.0, 4.1, 5.6 ] # the offset for variable zoom scope
Number = 0          # The weapon index which you are using currently        
counter = 0         # The current zoom level of your variable zoom scope  (approximate 0~9)
last_scroll_time = [-1000, -2000, -3000]  # Record the last 3 time you scrolled the mousewhell

def main():
    global Weapon, HighMode, Number, counter
    
    Weapon = PrimaryWeapon
    while True:
        if (keyboard.is_pressed('2')):
            Number = 0
            Weapon = PrimaryWeapon
        elif keyboard.is_pressed('3') and SecondWeapon != '':
            Number = 1
            Weapon = SecondWeapon
        elif (win32api.GetKeyState(0x05) < 0) :         # Use mouse side button (Back Button) to switch HighMode
            if Weapon != '' :  
                HighMode[Number] = not HighMode[Number]
                print(HighMode[Number])
                time.sleep(0.2)                         # Avoid switching repeatly in short time
        a = win32api.GetKeyState(0x01)
        b = win32api.GetKeyState(0x02)
        # Cheking Right-click and Left-Click
        if b < 0 and a < 0:  # If you are aimming and firing!
            # Assault-rifle's offset
            if 'SPEAR'      in Weapon:
                offset, duration = 7, 28
            elif 'M4A1'     in Weapon:
                offset, duration = 8, 28
            elif 'ASH12'    in Weapon:
                offset, duration = 12, 36
            elif 'MK47'     in Weapon:
                offset, duration = 7, 33
            elif 'RD704'     in Weapon:
                offset, duration = 7, 33
            elif 'MK17'     in Weapon:
                offset, duration = 5, 33
            # SMG's offset
            elif 'SR3M'     in Weapon:
                offset, duration = 6, 26
            elif 'UZI'  in Weapon:
                offset, duration = 7, 22
            elif 'MP7A2'    in Weapon:
                offset, duration = 6, 22
            elif 'VECTOR'    in Weapon:
                offset, duration = 5, 22
        
            if 'HOT' in Weapon:        
                if not HighMode[Number]:
                    weapons.fire(offset, duration)      # 1x offset 
                else:
                    weapons.fire_hot(offset, duration)  # 2.5x REAP-IR scope offset
            elif HighMode[Number]:
                if(Flexible[Number]):
                    weapons.fire(offset * (1 + counterRate[counter]*1.4), duration) # 1x-6x Variable zoom scope offset
                else:
                    weapons.fire_highmode(offset, duration) # 4x zoom scope offset
            else:
                # print(f"目前變數值: {counter}")
                weapons.fire(offset, duration) # 1x offset
        time.sleep(0.001)



def on_scroll(x, y, dx, dy): # Used to detect mousewhell  (for variable zoome scope, it changes the anti-recoil offset)
    global counter, last_scroll_time

    if (keyboard.is_pressed('alt')):
        current_time = time.time()
        if current_time - last_scroll_time[2] < 0.3:
            add = 4
        elif current_time - last_scroll_time[1] < 0.3:
            add = 3
        elif current_time - last_scroll_time[0] < 0.3:
            add = 2
        else:
            add = 1
        if dy < 0:
            add *= -1
        counter += add
        if(counter > 9):
            counter = 9
        elif(counter < 0):
            counter = 0
        # print(f"目前變數值: {counter}")
        last_scroll_time[2] = last_scroll_time[1]
        last_scroll_time[1] = last_scroll_time[0]
        last_scroll_time[0] = current_time


listener = Listener(on_scroll=on_scroll)
listener.daemon = True  
listener.start()

if __name__ == '__main__':
    main()
