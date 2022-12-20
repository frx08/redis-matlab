function [R, S] = redisJsonSet(R, key, path, value)

S = 'OK';

if ~isstr(value)
  S = 'ERROR - SET VALUE MUST BE A STRING';
  return
end

if ~strcmp(R.status, 'open')
  S = 'ERROR - NO CONNECTION';
  return
end

[Response, R, S] = redisCommand(R, redisCommandString(sprintf('JSON.SET %s %s %s', key, path, value)));

if strcmp(Response, '+OK')
  S = Response;
  return
end
