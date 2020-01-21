# gundameus

## Build

```bash
mkdir ~/gundam_ws/src -p
cd ~/gundam_ws/src
git clone https://github.com/gundam-global-challenge/gundam_robot.git
git clone https://github.com/knorth55/gundameus
rosdep install --ignore-src --from-path . -y -r
cd ~/gundam_ws
catkin build
```

## Tutorial

```bash
roseus euslisp/gundam-rx78.l
(setq *gundam-rx78* (instance gundam-rx78-robot :init))
```
