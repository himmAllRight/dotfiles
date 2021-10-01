from math import atan, degrees, sqrt


def view_angle(distance, diagonal, horz_ratio=16, vert_ratio=9):
    """Calculates the field of view angle from the distance, screen diagonal size, and
    ratio."""
    horz_length = horizontal_from_diagonal(
        diagonal, horz_ratio=horz_ratio, vert_ratio=vert_ratio
    )
    half_range_angle = degrees(atan((horz_length / 2) / distance))
    print(f"half angle: {half_range_angle}")
    return half_range_angle * 2


def horizontal_from_diagonal(diagonal, horz_ratio=16, vert_ratio=9):
    """Calculates and returns the horizontal length, calculated from the
    diagonal length and the horz:vert ratio"""
    r = calc_r(diagonal, horz_ratio=horz_ratio, vert_ratio=vert_ratio)
    return horz_ratio * r


def calc_r(diagonal, horz_ratio=16, vert_ratio=9):
    """Calculates the ratio constant used to find the horizontal and vertical
    lengths from the diagonal."""
    r = sqrt((diagonal ** 2) / (horz_ratio ** 2 + vert_ratio ** 2))
    return r
