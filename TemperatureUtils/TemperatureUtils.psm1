<#
.Synopsis
Get-CurrentCPUTemperature uses the MSAcpi_ThermalZoneTemperature class to return the current CPU temperature.

.Parameter Celsius
Return current temperature as Celsius

.Parameter Fahrenheit
Return current temperature as Fahrenheit

.Parameter Kelvin
Return current temperature as Kelvin

.Description
Get-CurrentCPUTemperature uses the MSAcpi_ThermalZoneTemperature class to return the current CPU temperature.  Specify temperature unit using the parameters -Celsius, -Fahrenheit, and/or -Kelvin.  

.Example
Get-CurrentCPUTemperature -Celsius

.Example
Get-CurrentCPUTemperature -Fahrenheit

.Example
Get-CurrentCPUTemperature -Kelvin

.Example
Get-CurrentCPUTemperature -Celsius -Kelvin -Fahrenheit
#>

function Get-CurrentCPUTemperature
{
    [CmdletBinding()]
    param(
        [Switch]$Celsius,
        [Switch]$Fahrenheit,
        [Switch]$Kelvin
        )
    begin 
        {
        $WmiBase = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
        $WmiBase = $($WmiBase.CurrentTemperature/10)
        $Bucket = @();
        }
    process
        {
        if(!$Celsius -and !$Kelvin -and !$Fahrenheit){$Fahrenheit=$True}
        if($Celsius)
            {
            $c = $(($WmiBase)-273.15)
            $Bucket += "$c" + [char]0x00B0 + " Celsius"
            }
        if($Fahrenheit)
            {
            $f = $((($WmiBase)-273.15) * (9/5) + 32)
            $Bucket += "$f" + [char]0x00B0 +" Fahrenheit"
            }
        if($Kelvin)
            {
            $k = $WmiBase
            $Bucket += "$k" + [char]0x00B0 +" Kelvin"
            }
        }
    end
       {return $Bucket}
}

<#
.Synopsis
Get-CriticalTripPoint uses the MSAcpi_ThermalZoneTemperature class to return the CPU temperature that triggers system cooling to begin.

.Parameter Celsius
Return the critical tripping point as Celsius

.Parameter Fahrenheit
Return the critical tripping point as Fahrenheit

.Parameter Kelvin
Return the critical tripping point as Kelvin

.Description
Get-CriticalTripPoint uses the MSAcpi_ThermalZoneTemperature class to return the CPU temperature that triggers system cooling to begin.  Specify temperature unit using the parameters -Celsius, -Fahrenheit, and/or -Kelvin.

.Example
Get-CriticalTripPoint -Celsius

.Example
Get-CriticalTripPoint -Fahrenheit

.Example
Get-CriticalTripPoint -Kelvin

.Example
Get-CriticalTripPoint -Celsius -Kelvin -Fahrenheit
#>

function Get-CriticalTripPoint 
{
    [CmdletBinding()]
    param(
        [Switch]$Celsius,
        [Switch]$Fahrenheit,
        [Switch]$Kelvin
        )
    begin 
        {
        $WmiBase = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
        $WmiBase = $($WmiBase.CriticalTripPoint/10)
        $Bucket = @();
        }
    process
        {
        if(!$Celsius -and !$Kelvin -and !$Fahrenheit){$Fahrenheit=$True}
        if($Celsius)
            {
            $c = $(($WmiBase)-273.15)
            $Bucket += "$c" + [char]0x00B0 + " Celsius"
            }
        if($Fahrenheit)
            {
            $f = $((($WmiBase)-273.15) * (9/5) + 32)
            $Bucket += "$f" + [char]0x00B0 +" Fahrenheit"
            }
        if($Kelvin)
            {
            $k = $WmiBase
            $Bucket += "$k" + [char]0x00B0 +" Kelvin"
            }
        }
    end
       {return $Bucket}
}

<#
.Synopsis
Get-PassiveTripPoint uses the MSAcpi_ThermalZoneTemperature class to return the passive tripping point temperature of the cPU.

.Parameter Celsius
Return the passive tripping point as Celsius

.Parameter Fahrenheit
Return the passive tripping point as Fahrenheit

.Parameter Kelvin
Return the passive tripping point as Kelvin

.Description
Get-PassiveTripPoint uses the MSAcpi_ThermalZoneTemperature class to return the passive tripping point temperature of the cPU.  Specify temperature unit using the parameters -Celsius, -Fahrenheit, and/or -Kelvin.

.Example
Get-PassiveTripPoint -Celsius

.Example
Get-PassiveTripPoint -Fahrenheit

.Example
Get-PassiveTripPoint -Kelvin

.Example
Get-PassiveTripPoint -Celsius -Kelvin -Fahrenheit
#>

function Get-PassiveTripPoint 
{
    [CmdletBinding()]
    param(
        [Switch]$Celsius,
        [Switch]$Fahrenheit,
        [Switch]$Kelvin
        )
    begin 
        {
        $WmiBase = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
        $WmiBase = $($WmiBase.PassiveTripPoint/10)
        $Bucket = @();
        }
    process
        {
        if(!$Celsius -and !$Kelvin -and !$Fahrenheit){$Fahrenheit=$True}
        if($Celsius)
            {
            $c = $(($WmiBase)-273.15)
            $Bucket += "$c" + [char]0x00B0 + " Celsius"
            }
        if($Fahrenheit)
            {
            $f = $((($WmiBase)-273.15) * (9/5) + 32)
            $Bucket += "$f" + [char]0x00B0 +" Fahrenheit"
            }
        if($Kelvin)
            {
            $k = $WmiBase
            $Bucket += "$k" + [char]0x00B0 +" Kelvin"
            }
        }
    end
       {return $Bucket}
}

<#
.Synopsis
Get-SamplingPeriod uses the MSAcpi_ThermalZoneTemperature class to return the sampling period.

.Description
Get-SamplingPeriod uses the MSAcpi_ThermalZoneTemperature class to return the sampling period.

.Example
Get-SamplingPeriod
#>

function Get-SamplingPeriod 
{
    begin 
        {
        $WmiBase = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
        $WmiBase = $WmiBase.SamplingPeriod
        }
    process
        {}
    end
       {return $WmiBase}
}

<#
.Synopsis
Get-ThermalStamp uses the MSAcpi_ThermalZoneTemperature class to return the thermal stamp.

.Description
Get-ThermalStamp uses the MSAcpi_ThermalZoneTemperature class to return the thermal stamp.

.Example
Get-ThermalStamp
#>

function Get-ThermalStamp 
{
    begin 
        {
        $WmiBase = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
        $WmiBase = $WmiBase.ThermalStamp
        }
    process
        {}
    end
       {return $WmiBase}
}

Get-CurrentCPUTemperature -Celsius -Kelvin -Fahrenheit
Get-CriticalTripPoint -Celsius -Kelvin -Fahrenheit
Get-PassiveTripPoint -Celsius -Kelvin -Fahrenheit
Get-SamplingPeriod
Get-ThermalStamp
Export-ModuleMember -Cmdlet * -Function *