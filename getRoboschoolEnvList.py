import  gym
import roboschool

"""Print a list of all roboschool gym environments
"""
# Filter list of all gym environments for roboschool environments
envList = [spec.id for spec in gym.envs.registry.all() if spec.id.startswith('Roboschool')]
# Build string to print
returnStr = ''
for env in envList:
    returnStr += str(env) + ' '
# Print string to terminal
print(returnStr)
