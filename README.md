# STM32F103x6 Startup Code

![STM32 Logo](https://www.disk91.com/wp-content/uploads/2018/09/12180191.png)

This repository contains the startup code for the STM32F103x6 microcontroller.

## Table of Contents

- [Overview](#overview)
- [Getting Started](#getting-started)
- [File Structure](#file-structure)


## Overview
A startup code for the STM32F103x6 microcontroller implementation of Vector table with its addresses as mentioned @CortexM3 guide and reset handler function, also linker script file for implementation of ROM (Flash) and RAM (Memory) with addresses as a data sheet of STM32f103x6

## Getting Started

You need to STM32F103x6 controller and ST-Link to debug, also IDE for me STM32Cube IDE. 

# Clone the repository
git clone https://github.com/Salahbendary/STM32F103x6_StartupCode.git

## File Structure

- LinkerScript.ld: Linker script file contatining the implementation of ROM (Flash) and RAM (Memory) with addresses as a data sheet of STM32f103x6
- startup_stm32F103x6.c: Startup code file containing the implementation of Vector table with its addresses as mentioned @CortexM3 guide and reset handler function.
- application.c: An example file to make sure that linker script and startup code work properly
