{ ... }:

{
  # TODO: Separate configuration into modules
  environment = {
    memoryAllocator.provider = "scudo";
    variables.SCUDO_OPTIONS = "ZeroContents=1";
  };
}