from okonomiyaki.platforms import EPDPlatform


def _platform_string(platform):
    disp_platform = EPDPlatform(platform).platform_name
    disp_platform += "_" + str(platform.arch)
    return disp_platform
