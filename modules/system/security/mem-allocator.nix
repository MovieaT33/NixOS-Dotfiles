{ ... }:

{
  environment = {
    memoryAllocator.provider = "graphene-hardened";
    variables.SCUDO_OPTIONS = "ZeroContents=1";
  };
}