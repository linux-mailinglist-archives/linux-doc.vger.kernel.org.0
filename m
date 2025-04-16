Return-Path: <linux-doc+bounces-43150-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8CDA8966D
	for <lists+linux-doc@lfdr.de>; Tue, 15 Apr 2025 10:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 911BE1895E26
	for <lists+linux-doc@lfdr.de>; Tue, 15 Apr 2025 08:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC8E2820DD;
	Tue, 15 Apr 2025 08:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oiLy6Iq3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2BC13D539
	for <linux-doc@vger.kernel.org>; Tue, 15 Apr 2025 08:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705421; cv=none; b=k9IXpdPyn0EdpcfXTj0WAz0PWSOT3j3Mts1mw176zg7VzbxwJIfTBSPsYvXMA2sXGnZrJngKrF96+8sAiWO0Ub/u3FF7l2yeKEneic5pJO/0xoEmD8GF/dGQggKdZJWZ8ctgxSKJg1bgVA+sifbajeXACE9hFsAkEhQJ0ViRGQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705421; c=relaxed/simple;
	bh=4yLqGnQJvj8Zbb2DlWt2KaTzq++d8cD2F1ylTV5AV0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpBAPncWd2H9UD+7TJmzFeYOtaqU44kH8eVsp36MBulDvoLyTEyT5ZmT0jwW5pW0h/shMhNJ1yIwS56bt6UNxjS0rMsGUbu1f6leQg/hNdK7YwrAdiaZQZL1cIw+RoY6REIAGAdvFDm4Av2iNPXPPIuPcRnedfS8zplKnmCE84U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oiLy6Iq3; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c597760323so497185185a.3
        for <linux-doc@vger.kernel.org>; Tue, 15 Apr 2025 01:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744705419; x=1745310219; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rrVnpf3QybB4uXAYvRm86ZjUEIqy/9/jv/HP9/veWOI=;
        b=oiLy6Iq3raCU0zVLEw01ALxQ20MwpC/UZeq6pLm7uwIloMYO8fX+fJ3Grz0zPlqsmy
         ChD4kOXb7DJKWCOEkCcsSftfDEVh07qkTtnrJNEmksSw4yXQzIpni+YpWIhVTE7g3c6V
         KkOgxDgVSu65zk9iKAGCGCWRYneWJi/wLoaoeqlDiQoDC4vA5tb0+SYWbr0mrcUtJXgw
         8kTk2iIWAuhvT4IgY2YFn+cSDlEA4Bao8QA5v4swqlyqt+gxge/X2dPb9pSPDhncfvgR
         nO0LiNHCkLW1XxWrJUAtHS5Cjh7DauztXEcYOB9/FG2zJlOD4ZlKB8G5MemPkSnIWkcz
         FjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705419; x=1745310219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrVnpf3QybB4uXAYvRm86ZjUEIqy/9/jv/HP9/veWOI=;
        b=eYTuXMmq41mgDMcbd3quLEaxwdIuJm3axXAH4qA0mUs89GXDj7rfCeArmYhs8rjrA9
         RynJEEXSmcrlYn0Z4q3U2QMz4wnyKiwM5B8B7mjp0kU74qSMq6Gb6OSBQaHYhK4tXsew
         Ckxuz2vGQAo6ESWo2yjV+AnMsS3UaL8In6692POpJj0xhk5b2wVlLp0wJ+/xk80cicRr
         9nntMAWwVgCMgDcFt1970y9MjYkASiNrITaRaK8auHmT64qxjtHi7DAdwaYCoPz0KPgx
         U00YMuCM1pc3ScYXIwx7aIEEWDtX1CjSOznYUXQ2xWFjrpl5Op5+1E435G4J2sSmByFS
         q+vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKgbWMkAuzSW8ULQvmt67iwTxcI2QWiFkF/EcHoCLNOtnCUgD3eczcqSks02RKsmiGfZcV82X6nvg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF/L6KCiN0ju1R1XvzUx/SvBpMa8Y5s0p2ZH7a/QtwGLGurlsb
	oxXdNs+HcDbq7CkR1gnQHTCelDNUnIAC+NByoVH2jSsUSqxhHV7nSusFsi8MPs/oejmnlwSotmZ
	JNmTty67vL70lpopQQsVnkhohRmGRztQfDrge
X-Gm-Gg: ASbGncsFPvRytJaPB2r3aGzpgaZ2qtiJ6lw5BVJMTKAqOyXek55GG/rCOITm+jWRfra
	acHGISUVgtWCSfq/UxFBsEIABja/Nz6RobxRZ+pRb9NpJg43S+TS0xos8VLOBHzndqUWFpS0grF
	FhznEU1a9HWc38bbU8R71h2wUokqar+8O/Ig==
X-Google-Smtp-Source: AGHT+IF8kzK2TPSd8QIa8k5KLu9f76UXdyV95amiOuma7O06Du+QtPZ5+Bt7KazpOrH+3vMOdsCyotwgS+lw6VekJdc=
X-Received: by 2002:a05:620a:4549:b0:7c5:5d4b:e62f with SMTP id
 af79cd13be357-7c7af1f32e9mr2303856785a.43.1744705418608; Tue, 15 Apr 2025
 01:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415-kunit-list-v2-1-aa452cd317ae@linutronix.de>
In-Reply-To: <20250415-kunit-list-v2-1-aa452cd317ae@linutronix.de>
From: David Gow <davidgow@google.com>
Date: Tue, 15 Apr 2025 16:23:25 +0800
X-Gm-Features: ATxdqUEitbyH8oFdJCsHtYAfj2-azWauKaLLHNbe8B6LS78jOZMH7Go0lVCsHgE
Message-ID: <CABVgOSmHWh5hMhGmhod-NDwxi3iBP_dSZQY0DJEn=5Six1HRvg@mail.gmail.com>
Subject: Re: [PATCH v2] kunit: tool: Implement listing of available architectures
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000be6dac0632cce223"

--000000000000be6dac0632cce223
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Apr 2025 at 15:03, Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> To implement custom scripting around kunit.py it is useful to get a list =
of
> available architectures. While it is possible to manually inspect
> tools/testing/kunit/qemu_configs/, this is annoying to implement and
> introduces a dependency on a kunit.py implementation detail.
>
> Introduce 'kunit.py run --arch help' which lists all known architectures
> in an easy to parse list. This is equivalent on how QEMU implements
> listing of possible argument values.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: Rae Moar <rmoar@google.com>
> ---
> Changes in v2:
> - Pick up review from Rae
> - Link to v1: https://lore.kernel.org/r/20250220-kunit-list-v1-1-40b9d564=
17ee@linutronix.de
> ---

Thanks!

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


>  Documentation/dev-tools/kunit/run_wrapper.rst | 2 ++
>  tools/testing/kunit/kunit_kernel.py           | 8 ++++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentatio=
n/dev-tools/kunit/run_wrapper.rst
> index 19ddf5e07013314c608b570e297a8ff79a8efe7f..6697c71ee8ca020b8ac7e91b4=
6e29ab082d9dea0 100644
> --- a/Documentation/dev-tools/kunit/run_wrapper.rst
> +++ b/Documentation/dev-tools/kunit/run_wrapper.rst
> @@ -182,6 +182,8 @@ via UML. To run tests on qemu, by default it requires=
 two flags:
>    is ignored), the tests will run via UML. Non-UML architectures,
>    for example: i386, x86_64, arm and so on; run on qemu.
>
> +  ``--arch help`` lists all valid ``--arch`` values.
> +
>  - ``--cross_compile``: Specifies the Kbuild toolchain. It passes the
>    same argument as passed to the ``CROSS_COMPILE`` variable used by
>    Kbuild. As a reminder, this will be the prefix for the toolchain
> diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/ku=
nit_kernel.py
> index d3f39bc1ceec7eab23925ff1b852e996a715f3d5..260d8d9aa1db4ac3c04fa755f=
b738dd834b976db 100644
> --- a/tools/testing/kunit/kunit_kernel.py
> +++ b/tools/testing/kunit/kunit_kernel.py
> @@ -14,6 +14,7 @@ import os
>  import shlex
>  import shutil
>  import signal
> +import sys
>  import threading
>  from typing import Iterator, List, Optional, Tuple
>  from types import FrameType
> @@ -201,6 +202,13 @@ def _default_qemu_config_path(arch: str) -> str:
>                 return config_path
>
>         options =3D [f[:-3] for f in os.listdir(QEMU_CONFIGS_DIR) if f.en=
dswith('.py')]
> +
> +       if arch =3D=3D 'help':
> +               print('um')
> +               for option in options:
> +                       print(option)
> +               sys.exit()
> +
>         raise ConfigError(arch + ' is not a valid arch, options are ' + s=
tr(sorted(options)))
>
>  def _get_qemu_ops(config_path: str,
>
> ---
> base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
> change-id: 20250220-kunit-list-552a8cdc011e
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>

--000000000000be6dac0632cce223
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
NjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjAeFw0xNDEyMTAwMDAw
MDBaFw0zNDEyMTAwMDAwMDBaMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMw
EQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMIICIjANBgkqhkiG9w0BAQEF
AAOCAg8AMIICCgKCAgEAlQfoc8pm+ewUyns89w0I8bRFCyyCtEjG61s8roO4QZIzFKRvf+kqzMaw
iGvFtonRxrL/FM5RFCHsSt0bWsbWh+5NOhUG7WRmC5KAykTec5RO86eJf094YwjIElBtQmYvTbl5
KE1SGooagLcZgQ5+xIq8ZEwhHENo1z08isWyZtWQmrcxBsW+4m0yBqYe+bnrqqO4v76CY1DQ8BiJ
3+QPefXqoh8q0nAue+e8k7ttU+JIfIwQBzj/ZrJ3YX7g6ow8qrSk9vOVShIHbf2MsonP0KBhd8hY
dLDUIzr3XTrKotudCd5dRC2Q8YHNV5L6frxQBGM032uTGL5rNrI55KwkNrfw77YcE1eTtt6y+OKF
t3OiuDWqRfLgnTahb1SK8XJWbi6IxVFCRBWU7qPFOJabTk5aC0fzBjZJdzC8cTflpuwhCHX85mEW
P3fV2ZGXhAps1AJNdMAU7f05+4PyXhShBLAL6f7uj+FuC7IIs2FmCWqxBjplllnA8DX9ydoojRoR
h3CBCqiadR2eOoYFAJ7bgNYl+dwFnidZTHY5W+r5paHYgw/R/98wEfmFzzNI9cptZBQselhP00sI
ScWVZBpjDnk99bOMylitnEJFeW4OhxlcVLFltr+Mm9wT6Q1vuC7cZ27JixG1hBSKABlwg3mRl5HU
Gie/Nx4yB9gUYzwoTK8CAwEAAaNjMGEwDgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8w
HQYDVR0OBBYEFK5sBaOTE+Ki5+LXHNbH8H/IZ1OgMB8GA1UdIwQYMBaAFK5sBaOTE+Ki5+LXHNbH
8H/IZ1OgMA0GCSqGSIb3DQEBDAUAA4ICAQCDJe3o0f2VUs2ewASgkWnmXNCE3tytok/oR3jWZZip
W6g8h3wCitFutxZz5l/AVJjVdL7BzeIRka0jGD3d4XJElrSVXsB7jpl4FkMTVlezorM7tXfcQHKs
o+ubNT6xCCGh58RDN3kyvrXnnCxMvEMpmY4w06wh4OMd+tgHM3ZUACIquU0gLnBo2uVT/INc053y
/0QMRGby0uO9RgAabQK6JV2NoTFR3VRGHE3bmZbvGhwEXKYV73jgef5d2z6qTFX9mhWpb+Gm+99w
MOnD7kJG7cKTBYn6fWN7P9BxgXwA6JiuDng0wyX7rwqfIGvdOxOPEoziQRpIenOgd2nHtlx/gsge
/lgbKCuobK1ebcAF0nu364D+JTf+AptorEJdw+71zNzwUHXSNmmc5nsE324GabbeCglIWYfrexRg
emSqaUPvkcdM7BjdbO9TLYyZ4V7ycj7PVMi9Z+ykD0xF/9O5MCMHTI8Qv4aW2ZlatJlXHKTMuxWJ
U7osBQ/kxJ4ZsRg01Uyduu33H68klQR4qAO77oHl2l98i0qhkHQlp7M+S8gsVr3HyO844lyS8Hn3
nIS6dC1hASB+ftHyTwdZX4stQ1LrRgyU4fVmR3l31VRbH60kN8tFWk6gREjI2LCZxRWECfbWSUnA
ZbjmGnFuoKjxguhFPmzWAtcKZ4MFWsmkEDCCBeQwggPMoAMCAQICEAHAzCnLVtRkCgyqhFEoeKYw
DQYJKoZIhvcNAQELBQAwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2Ex
KjAoBgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMzAeFw0yNTAxMTAxODI1
MTFaFw0yNTA3MDkxODI1MTFaMCQxIjAgBgkqhkiG9w0BCQEWE2RhdmlkZ293QGdvb2dsZS5jb20w
ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCoH0MspP58MiGTPha+mn1WzCI23OgX5wLB
sXU0Br/FkQPM9EXOhArvxMOyFi0Sfz0HX20qlaIHxviaVNYpVMgmQO8x3Ww9zBVF9wpTnF6HSZ8s
ZK7KHZhg43rwOEmRoA+3JXcgbmZqmZvLQwkGMld+HnQzJrvuFwXPlQt38yzNtRjWR2JmNn19OnEH
uBaFE7b0Pl93kJE60o561TAoFS8AoP4rZFUSqtCL7LD2JseW1+SaJcUhJzLxStodIIc6hQbzOQ/f
EvWDWbXF7nZWcQ5RDe7KgHIqwT8/8zsdCNiB2WW7SyjRRVL1CuoqCbhtervvgZmB3EXbLpXyNsoW
YE9NAgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFHgsCGkO2Hex
N6ybc+GeQEb6790qMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQAs
exV05yVDmPhHRqOq9lAbfWOUvEf8zydxabZUHna6bayb83jD2eb9nMGGEprfuNBRmFg35sgF1TyN
+ieuQakvQYmY8tzK49hhHa2Y3qhGCTqYTHO3ypHvhHsZiGbL0gmdgB9P8ssVIws//34ae99GUOxo
XKTxPwwsQ5Arq42besv3/HXAW+4nRAT8d3ht5ZWCHc5rjL/vdGzu7PaYo3u0da69AZ8Sh4Gf5yoc
QANr2ZkMrxXbLmSmnRvbkQrzlZp2YbTFnczx46429D6q75/FNFOL1vAjxtRAPzkyACvW0eKvchza
TMvvD3IWERLlcBL5yXpENc3rI8/wVjqgAWYxlFg1b/4b/TCgYe2MZC0rx4Uh3zTIbmPNiHdN6QZ9
oDiYzWUcqWZ5jCO4bMKNlVJXeCvdANLHuhcC8FONj5VzNgYXs6gWkp9/Wt6XnQPX4dF4JBa8JdL/
cT46RJIzoiJHEx/8syO5FparZHIKbkunoq6niPsRaQUGeqWc56H4Z1sQXuBJN9fhqkIkG0Ywfrwt
uFrCoYIRlx4rSVHpBIKgnsgdm0SFQK72MPmIkfhfq9Fh0h8AjhF73sLO7K5BfwWkx1gwMySyNY0e
PCRYr6WEVOkUJS0a0fui693ymMPFLQAimmz8EpyFok4Ju066StkYO1dIgUIla4x61auxkWHwnzGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAcDMKctW1GQKDKqEUSh4
pjANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg/L1rSg51brPTGvhDFeTZGeeLuaxF
ppeeCY+tIL1KQ+MwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
NDE1MDgyMzM5WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAOtzXrSBv6ru/fK8jnT/HuyHgX9vMlDbRCRvHfv06wCbKBw2Bge3PZ4Ysd5U2+C+x
2wVy3fm6M9aT3N7Iy6VqidMHEwddWZ6w6tVB6gYNxo9TDR9WrMDh9baCwhV+bR7b9EtcWNjWqZyo
xAYeeXdT0h0VNhCTK8LoJd9ZvvBl4K+4DIbG3hxPs4LkbiVnHrseTA1SYqepGnTN8gGrvRd+9jaZ
Vyv+QfWK9/K0xd4s2fbHu60C/VHTlu6f9uhtMUX4ElatjtGU1y2y4HlBojAaYrMTleeV8Iq2F7yw
77MYWtGCrfgP7S0rTQiJuGfownn//zU6RmdfLZ1YcFdyZu+gkQ==
--000000000000be6dac0632cce223--

