#!/usr/bin/bash

# This forces Nvidia DLSS to use the latest preset for SR, RR and framegen + updates the dlss dlls via ngx

export PROTON_ENABLE_NGX_UPDATER=1
export DXVK_NVAPI_DRS_NGX_DLSS_RR_OVERRIDE=on
export DXVK_NVAPI_DRS_NGX_DLSS_SR_OVERRIDE=on
export DXVK_NVAPI_DRS_NGX_DLSS_FG_OVERRIDE=on
export DXVK_NVAPI_DRS_NGX_DLSS_RR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest
export DXVK_NVAPI_DRS_NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest
export DXVK_NVAPI_DRS_NGX_DLSS_OVERRIDE_OPTIMAL_SETTINGS=perf_to_9x
export DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS=DLSSIndicator=1024,DLSSGIndicator=2

# applied variables, now execute the rest of the command
exec "$@"m
