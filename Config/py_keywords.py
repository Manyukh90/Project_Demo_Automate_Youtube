def convert_time_to_seconds(time_string):
    minutes, seconds = map(int, time_string.split(':'))
    total_seconds = minutes * 60 + seconds
    return total_seconds