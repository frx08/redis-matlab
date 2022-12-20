function [Output, R, S] = redisAuth(R, Psw)

Output = redisCommand(R, redisCommandString(sprintf('AUTH %s', Psw)));
S = 'OK';
