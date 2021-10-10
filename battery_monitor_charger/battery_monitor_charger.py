#!/usr/bin/python3

import argparse

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--interval", "-i",
                        default=15,
                        type=int,
                        help="""Number of seconds between battery checks.""")
    parser.add_argument("--threshold", "-v",
                        type=float,
                        help="""Voltage at which to start charging a battery.""")
    args = parser.parse_args()

if __name__ == '__main__':
    main()
