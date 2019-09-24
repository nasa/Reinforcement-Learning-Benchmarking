import gym

"""Print a list of all gym MuJoCo environments
"""

# Get list of all gym environments
allEnvList = list(gym.envs.registry.all()) 
# Filter list for all MuJoCo environments
mujocoEnvList = [env.id for env in allEnvList if env._entry_point.startswith('gym.envs.mujoco')] 
# Build the string to print to terminal
returnStr = ''
for env in mujocoEnvList:
    returnStr += str(env) + ' '
# Print the string
print(returnStr)
