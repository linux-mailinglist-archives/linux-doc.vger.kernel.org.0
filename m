Return-Path: <linux-doc+bounces-14325-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDA58A6D4D
	for <lists+linux-doc@lfdr.de>; Tue, 16 Apr 2024 16:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DFF81C22447
	for <lists+linux-doc@lfdr.de>; Tue, 16 Apr 2024 14:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BA412C534;
	Tue, 16 Apr 2024 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fz-juelich.de header.i=@fz-juelich.de header.b="GoYT3jO1"
X-Original-To: linux-doc@vger.kernel.org
Received: from mailgw-e01.its.kfa-juelich.de (mailgw-e01.its.kfa-juelich.de [134.94.4.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53BB12CD9D
	for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2024 14:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.94.4.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713276373; cv=none; b=i5lwQFj614WiPvGsNXFqR3DOILXxq2zCxsGT8DwhbFtX4/f3q1M+UORPnfJQa1vW4yB6xuZYfWH+Co3SVSjfESIDFyrruTNEkWysdKfybEBleUUziIfv1GVKzwWZWZmiPP+a5Y7GpB3veUbbsNKKh+D071795wCmJm6mL6ON0Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713276373; c=relaxed/simple;
	bh=GQwyM9ui6jmaMz63XCNGhgMzy80slOIYI18pN6oUydc=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=KVgmmmgJFofSDFRKUMvc35NUeSAyQbS8PLY7i2F4Bmi1arBByimPdMbSx3YHySUglcQ2/qjvCPDuk4E7TQTdQ/NJH57k8aIzzRtnKQo+RDNb8ZvLpeNTaZif7aq4aLPIv7aJfVaItOcFK/17lKrIT7qDojiL8D63Xqr6yO06ktI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fz-juelich.de; spf=pass smtp.mailfrom=fz-juelich.de; dkim=pass (1024-bit key) header.d=fz-juelich.de header.i=@fz-juelich.de header.b=GoYT3jO1; arc=none smtp.client-ip=134.94.4.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fz-juelich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fz-juelich.de
Received: from localhost (localhost [127.0.0.1])
	by mailgw-e01.its.kfa-juelich.de (Postfix) with ESMTP id ADB7C480C26
	for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2024 16:01:00 +0200 (CEST)
Authentication-Results: mailgw-e01.its.kfa-juelich.de (amavisd-new);
	dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
	header.d=fz-juelich.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fz-juelich.de; h=
	content-type:content-type:subject:subject:from:from
	:content-language:user-agent:mime-version:date:date:message-id
	:received:received:received; s=main; t=1713276055; bh=GQwyM9ui6j
	maMz63XCNGhgMzy80slOIYI18pN6oUydc=; b=GoYT3jO1z1sxKLchTlVkphUGwg
	BQMYeBONyZd+/tjAe49NyJfJvHNAcQvq1x7yv6Gb5YtXHYITO8pRb/M56b0XY2ft
	UgJHMSwfIZO5US4cS7MHb7joJ5nRs+BSveiz5cxH4KoB/DItOex3PvCLeJjKxFSm
	P4tWD2TZtkO3oGkDc=
X-Virus-Scanned: Debian amavisd-new at mailgw-e01.its.kfa-juelich.de
Received: from mailgw-e01.its.kfa-juelich.de ([127.0.0.1])
	by localhost (mailgw-e01.its.kfa-juelich.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0932rRNC19d for <linux-doc@vger.kernel.org>;
	Tue, 16 Apr 2024 16:00:55 +0200 (CEST)
Received: from exch2019-k.ad.fz-juelich.de (exch2019-k.its.kfa-juelich.de [134.94.4.37])
	by mailgw-e01.its.kfa-juelich.de (Postfix) with ESMTPS
	for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2024 16:00:55 +0200 (CEST)
Received: from [172.25.80.180] (172.25.80.180) by exch2019-k.ad.fz-juelich.de
 (134.94.4.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 16 Apr
 2024 16:00:52 +0200
Message-ID: <cf619d75-1996-40c5-94e8-4d6e6b74f0bf@fz-juelich.de>
Date: Tue, 16 Apr 2024 16:00:52 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <linux-doc@vger.kernel.org>
Content-Language: en-US
From: Joachim Wuttke <j.wuttke@fz-juelich.de>
Subject: elf(5) and ld.so(8): DT_RPATH deprecated - really?
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-512; boundary="------------ms040902080403020006070108"
X-ClientProxiedBy: exch2019-k.ad.fz-juelich.de (134.94.4.37) To
 exch2019-k.ad.fz-juelich.de (134.94.4.37)

--------------ms040902080403020006070108
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Pages elf(5) and ld.so(8) say that DT_RPATH is deprecated.

This is inconsistent with ld(1), which says no such thing
about the -rpath option.

And it is not credible. A huge amount of software would
break down if support for DT_RPATH were ever removed.

Regards, Joachim


--------------ms040902080403020006070108
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgMFADCABgkqhkiG9w0BBwEAAKCC
EbEwggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZIhvcNAQELBQAwgYIxCzAJBgNVBAYT
AkRFMSswKQYDVQQKDCJULVN5c3RlbXMgRW50ZXJwcmlzZSBTZXJ2aWNlcyBHbWJIMR8wHQYD
VQQLDBZULVN5c3RlbXMgVHJ1c3QgQ2VudGVyMSUwIwYDVQQDDBxULVRlbGVTZWMgR2xvYmFs
Um9vdCBDbGFzcyAyMB4XDTE2MDIyMjEzMzgyMloXDTMxMDIyMjIzNTk1OVowgZUxCzAJBgNV
BAYTAkRFMUUwQwYDVQQKEzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVu
IEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNVBAMTJERG
Ti1WZXJlaW4gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgMjCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAMtg1/9moUHN0vqHl4pzq5lN6mc5WqFggEcVToyVsuXPztNXS43O+FZs
FVV2B+pG/cgDRWM+cNSrVICxI5y+NyipCf8FXRgPxJiZN7Mg9mZ4F4fCnQ7MSjLnFp2uDo0p
eQcAIFTcFV9Kltd4tjTTwXS1nem/wHdN6r1ZB+BaL2w8pQDcNb1lDY9/Mm3yWmpLYgHurDg0
WUU2SQXaeMpqbVvAgWsRzNI8qIv4cRrKO+KA3Ra0Z3qLNupOkSk9s1FcragMvp0049ENF4N1
xDkesJQLEvHVaY4l9Lg9K7/AjsMeO6W/VRCrKq4Xl14zzsjz9AkH4wKGMUZrAcUQDBHHWekC
AwEAAaOCAXQwggFwMA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQUk+PYMiba1fFKpZFK4OpL
4qIMz+EwHwYDVR0jBBgwFoAUv1kgNgB5oKAia4zV8mHSuCzLgkowEgYDVR0TAQH/BAgwBgEB
/wIBAjAzBgNVHSAELDAqMA8GDSsGAQQBga0hgiwBAQQwDQYLKwYBBAGBrSGCLB4wCAYGZ4EM
AQICMEwGA1UdHwRFMEMwQaA/oD2GO2h0dHA6Ly9wa2kwMzM2LnRlbGVzZWMuZGUvcmwvVGVs
ZVNlY19HbG9iYWxSb290X0NsYXNzXzIuY3JsMIGGBggrBgEFBQcBAQR6MHgwLAYIKwYBBQUH
MAGGIGh0dHA6Ly9vY3NwMDMzNi50ZWxlc2VjLmRlL29jc3ByMEgGCCsGAQUFBzAChjxodHRw
Oi8vcGtpMDMzNi50ZWxlc2VjLmRlL2NydC9UZWxlU2VjX0dsb2JhbFJvb3RfQ2xhc3NfMi5j
ZXIwDQYJKoZIhvcNAQELBQADggEBAIcL/z4Cm2XIVi3WO5qYi3FP2ropqiH5Ri71sqQPrhE4
eTizDnS6dl2e6BiClmLbTDPo3flq3zK9LExHYFV/53RrtCyD2HlrtrdNUAtmB7Xts5et6u5/
MOaZ/SLick0+hFvu+c+Z6n/XUjkurJgARH5pO7917tALOxrN5fcPImxHhPalR6D90Bo0fa3S
PXez7vTXTf/D6OWST1k+kEcQSrCFWMBvf/iu7QhCnh7U3xQuTY+8npTD5+32GPg8SecmqKc2
2CzeIs2LgtjZeOJVEqM7h0S2EQvVDFKvaYwPBt/QolOLV5h7z/0HJPT8vcP9SpIClxvyt7bP
ZYoaorVyGTkwggWsMIIElKADAgECAgcbY7rQHiw9MA0GCSqGSIb3DQEBCwUAMIGVMQswCQYD
VQQGEwJERTFFMEMGA1UEChM8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hl
biBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLEwdERk4tUEtJMS0wKwYDVQQDEyRE
Rk4tVmVyZWluIENlcnRpZmljYXRpb24gQXV0aG9yaXR5IDIwHhcNMTYwNTI0MTEzODQwWhcN
MzEwMjIyMjM1OTU5WjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9l
cmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBlLiBWLjEQMA4GA1UE
CwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNzdWluZyBDQTCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ07eRxH3h+Gy8Zp1xCeOdfZojDbchwFfylf
S2jxrRnWTOFrG7ELf6Gr4HuLi9gtzm6IOhDuV+UefwRRNuu6cG1joL6WLkDh0YNMZj0cZGnl
m6Stcq5oOVGHecwX064vXWNxSzl660Knl5BpBb+Q/6RAcL0D57+eGIgfn5mITQ5HjUhfZZkQ
0tkqSe3BuS0dnxLLFdM/fx5ULzquk1enfnjK1UriGuXtQX1TX8izKvWKMKztFwUkP7agCwf9
TRqaA1KgNpzeJIdl5Of6x5ZzJBTN0OgbaJ4YWa52fvfRCng8h0uwN89Tyjo4EPPLR22MZD08
WkVKusqAfLjz56dMTM0CAwEAAaOCAgUwggIBMBIGA1UdEwEB/wQIMAYBAf8CAQEwDgYDVR0P
AQH/BAQDAgEGMCkGA1UdIAQiMCAwDQYLKwYBBAGBrSGCLB4wDwYNKwYBBAGBrSGCLAEBBDAd
BgNVHQ4EFgQUazqYi/nyU4na4K2yMh4JH+iqO3QwHwYDVR0jBBgwFoAUk+PYMiba1fFKpZFK
4OpL4qIMz+EwgY8GA1UdHwSBhzCBhDBAoD6gPIY6aHR0cDovL2NkcDEucGNhLmRmbi5kZS9n
bG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDBAoD6gPIY6aHR0cDovL2NkcDIu
cGNhLmRmbi5kZS9nbG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDCB3QYIKwYB
BQUHAQEEgdAwgc0wMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4uZGUvT0NTUC1T
ZXJ2ZXIvT0NTUDBKBggrBgEFBQcwAoY+aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwt
cm9vdC1nMi1jYS9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwSgYIKwYBBQUHMAKGPmh0dHA6Ly9j
ZHAyLnBjYS5kZm4uZGUvZ2xvYmFsLXJvb3QtZzItY2EvcHViL2NhY2VydC9jYWNlcnQuY3J0
MA0GCSqGSIb3DQEBCwUAA4IBAQCBeEWkTqR/DlXwCbFqPnjMaDWpHPOVnj/z+N9rOHeJLI21
rT7H8pTNoAauusyosa0zCLYkhmI2THhuUPDVbmCNT1IxQ5dGdfBi5G5mUcFCMWdQ5UnnOR7L
n8qGSN4IFP8VSytmm6A4nwDO/afr0X9XLchMX9wQEZc+lgQCXISoKTlslPwQkgZ7nu7YRrQb
tQMMONncsKk/cQYLsgMHM8KNSGMlJTx6e1du94oFOO+4oK4v9NsH1VuEGMGpuEvObJAaguS5
Pfp38dIfMwK/U+d2+dwmJUFvL6Yb+qQTkPp8ftkLYF3sv8pBoGH7EUkp2KgtdRXYShjqFu9V
NCIaE40GMIIG5zCCBc+gAwIBAgIMJkVuT3v+UKILRFGXMA0GCSqGSIb3DQEBCwUAMIGNMQsw
CQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRz
Y2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQD
DBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBMB4XDTIyMDMwNzExNDcxNVoXDTI1MDMw
NjExNDcxNVowgYExCzAJBgNVBAYTAkRFMScwJQYDVQQKDB5Gb3JzY2h1bmdzemVudHJ1bSBK
dWVsaWNoIEdtYkgxDTALBgNVBAsMBEpDTlMxDzANBgNVBAQMBld1dHRrZTEQMA4GA1UEKgwH
Sm9hY2hpbTEXMBUGA1UEAwwOSm9hY2hpbSBXdXR0a2UwggIiMA0GCSqGSIb3DQEBAQUAA4IC
DwAwggIKAoICAQC6fSddJW1c3jmNtNtpBWDTtgpLFOpsSjScamtclgKeYysTyAUygT7GZDEb
HYRS5LfVpdE4R3KgM2CvfJDUsg4Uk2ftQ+A76f0TlprWz0YIcZJy6cuxGuFccjt1wQ29BIWv
/owCJR4Ntd38WRd0L2hhW0Fm19XCosWs5xcV28Glgn+omVbpDhYMj9mBW3fDxXbNA/yLrLzE
L5iUh8BKrCzs0RZGvvbLV/FMUSMDGL21lTKhTXguFXYLhxdveWtV3eRmZQatwPxvid9s3kyD
hQv310VO9I92/PNLk2U5ErIayB8DU4+GI7Ho4LDuoKn1bVTE4cXF8q2cvNLCjTO/6mJmndRJ
KkIGvs7u/F+8HfQsyfoccEFtYoR4M95bYy4z7jlWJQfXmGMSp6MXsrN02rNAZur4j5pAO3q2
jJvuFUVYKhgBBkvQLy2sJ0z/DgbdsruHC3QqUEAUsAz5bmUl2Lxe5PfgMe1K8zf3kxAyQ5eh
4x8dJZL3AgDXioyAG6Xdx8HQxuHjZroPRCagArP6nl1DF9Fa33SiBj9qGg8jLBhnyIDehVCg
nl4MH5Jm8wJKKWyxCD6KAi48JCALFDfxuYqbCQcnDqW+RtPeDHt+N5RR8rkusvwp/91cwpem
jLie9DhjcdigYCJop2lbHbO5PlMzcRlubQ0MftZHMG4qrnYM3wIDAQABo4ICTzCCAkswPgYD
VR0gBDcwNTAPBg0rBgEEAYGtIYIsAQEEMBAGDisGAQQBga0hgiwBAQQKMBAGDisGAQQBga0h
giwCAQQKMAkGA1UdEwQCMAAwDgYDVR0PAQH/BAQDAgXgMB0GA1UdJQQWMBQGCCsGAQUFBwMC
BggrBgEFBQcDBDAdBgNVHQ4EFgQUoosjELpspvkvlz/lB2UWNhDb3sgwHwYDVR0jBBgwFoAU
azqYi/nyU4na4K2yMh4JH+iqO3QwIQYDVR0RBBowGIEWai53dXR0a2VAZnotanVlbGljaC5k
ZTCBjQYDVR0fBIGFMIGCMD+gPaA7hjlodHRwOi8vY2RwMS5wY2EuZGZuLmRlL2Rmbi1jYS1n
bG9iYWwtZzIvcHViL2NybC9jYWNybC5jcmwwP6A9oDuGOWh0dHA6Ly9jZHAyLnBjYS5kZm4u
ZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIvY3JsL2NhY3JsLmNybDCB2wYIKwYBBQUHAQEEgc4w
gcswMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4uZGUvT0NTUC1TZXJ2ZXIvT0NT
UDBJBggrBgEFBQcwAoY9aHR0cDovL2NkcDEucGNhLmRmbi5kZS9kZm4tY2EtZ2xvYmFsLWcy
L3B1Yi9jYWNlcnQvY2FjZXJ0LmNydDBJBggrBgEFBQcwAoY9aHR0cDovL2NkcDIucGNhLmRm
bi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2FjZXJ0LmNydDANBgkqhkiG9w0B
AQsFAAOCAQEAHej5zUFmdEJ2rIxmaux8+Mpt2z6UXH9cUBUhuL9Cf1EoILoKo6Ok8F8OYXRW
p/LhwhnXI+fzboN/Sdhh6z4ckJ51lZctUiHcYio9XOJiAOvpgF5xkLfBfAsbaKQ0gWWH2AE0
dDnlGEcWJ8/ZU6/II91IAJugQ/fMIO6tyltvpOsSAc3ORYbungrfy86XpAP3UzHRFCFeD7qa
tW5XGJlTiU0LrdZT6ADSeFYLLx+bMdGuQG58ythjA6CbANogFJ5m2UNw//h9rbGL5N9Yp5rw
T26SiBJaZ7ebIXBg5YUicn7uyei4OFIC6luTL31Jh4ktHx89TRONV/QXkAibpyY0ZjGCBSsw
ggUnAgEBMIGeMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVy
dW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdE
Rk4tUEtJMSUwIwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBAgwmRW5Pe/5Q
ogtEUZcwDQYJYIZIAWUDBAIDBQCgggJdMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJ
KoZIhvcNAQkFMQ8XDTI0MDQxNjE0MDA1MlowTwYJKoZIhvcNAQkEMUIEQBeLhJP/TkvX9V4h
DmUjCieY1Xe4L9Etuath/Uk+q6l74jVSdqYQwkVLJBtcFo/yV84JloOc/ptCam/W9HClYxsw
bAYJKoZIhvcNAQkPMV8wXTALBglghkgBZQMEASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMH
MA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIB
KDCBrwYJKwYBBAGCNxAEMYGhMIGeMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWlu
IHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYu
MRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5n
IENBAgwmRW5Pe/5QogtEUZcwgbEGCyqGSIb3DQEJEAILMYGhoIGeMIGNMQswCQYDVQQGEwJE
RTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3Jz
Y2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQDDBxERk4tVmVy
ZWluIEdsb2JhbCBJc3N1aW5nIENBAgwmRW5Pe/5QogtEUZcwDQYJKoZIhvcNAQEBBQAEggIA
YYx5X7KxBgHkCu9p0keXgus1wPFiF4wPTnq5Ggm/2B1itjyhui+1jC/fkEyx5QAMp4m7RIfL
7cxn3TPJTDZ9mfd7A/0MNmhmrrBnIdQQntC38p1+txo8xtkZIRzXWJa7ZCNrxaDa2TALW8NN
5LuxhrsZTHtVjLQB57pFaItBCsT4m9C9J7+iERuAhbO1uGJM6cqS0D0aS0ESuOps34b7KFkO
cGrwbXl/SlhYeDCc41ntdnGEdYGqkhB2eFRxPGoUUHmoJTMofqM4oh6T9DwDhSXhra0zl60M
i/RS39LwdPQnbuSEA4eLlZNYD/6fJTPWNq9I0tK20GKrcy5hcLwI0ot5HpQzfDaL10977n1c
QoN0dh1DQCI90K7WwSGbyoMZTQwB+q46Z4Bbeh9dbev+0cHmhWSRyi6SzDMvr8shu/rTA4C/
8Freu5X1zRGp7ZBUWgBiz1BdXC4HXY1c9lTPDJfbisKFRPmZoHG+akC/m4C6PJvY3a3UugN2
5yPkjgnUSWF6ZrHKSBseQTMh4tNF5bMslf6ShDdzPkhzUfVOWKoUqu1Rg42mGCdbXIch5FR1
G7OSwlvism4AjKbLWRILTc7x0J7S9iW9StbzMMOmLgI5YX/gB4GjelXWAT1WTV5u8mO5wg5A
FdciIO0QFLbBXHz4U4f83LR/K5gZ+81/MVMAAAAAAAA=
--------------ms040902080403020006070108--

