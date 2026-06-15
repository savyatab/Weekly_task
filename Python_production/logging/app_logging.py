# #logging is the proceess of recording events that happen while a program runs
# #instead of running ->print("something.....")
# #we use
# import logging
# logging.info("Something happened")

# #levels of logging 
# #DEBUG,INFO,WARNING,ERROR,CRITICAL

#BASIC LOGGING EXAMPLE
import logging
logging.basicConfig(level=logging.INFO)

logging.info('PIPELINE STARTED')
logging.warning('Low memory')
logging.error('Something failed')
