Return-Path: <linux-doc+bounces-21256-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFCD93AC2A
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jul 2024 07:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4F7AB20D88
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jul 2024 05:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABBA374D4;
	Wed, 24 Jul 2024 05:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mg9X+Hht"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33A124B5B
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 05:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721797612; cv=none; b=rnd0Y4vCHeTVQiMOxvrfD5htQ99Ro9r0DUGxqVPAAcBjLTZP4zb1ZdhWFkyM/vm9BmEJEQO1fR7GHaAeypGja9xJxIPNwOsBH+HdWENgxb/tvTqRsNRlK7OiD90N/gdmZADPdXJC2tXPtnqdGaqMdTCL/uKE/LZWgCl6jU5tEB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721797612; c=relaxed/simple;
	bh=AgBSlFrpk8zESWW+69KIVV4zdYT86W9RdUq7IwmMi0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kY1usiWyTxMCi5hpaxNZ/QwglRwBDdQq8YMB/tMurKbqUUebyOP3QhemF9g9br/ud7Hl45Fd+eeeOki3rg+hCfS0EcbYs7mJTP9JosHRH2EmISYSqnnzBEhxDn0XeBF/Qke7PQD5GbEdQo35+w5ylsVQfmjGAHMmjUE2i4PxeBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mg9X+Hht; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-44f9d7cb5c5so203841cf.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2024 22:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721797610; x=1722402410; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pJm7ARutHzcy8kXrtF+ksc2xBDBrTqHqPQrdb+EUgdo=;
        b=Mg9X+Hht8TF/7wvLHOSt/HRce9MjqXAu7REVcR5UqZ3LvsOB0mkxTKjEeKYOFmnDru
         duDtF6+kA5BzzX8XlYIEEG8AxF8nLd2zouMBWfuZKoN3Nf439eXdHbrZB+NrCZzr5vHj
         58w32lTMVRmaduKXsvj327TA/iOoM2UIuG05NfSfNLY3l1qqYHaysW4MTgf9/RDLs5qO
         2yjbDdOGfI3JtJOcxGNLm1uRvXsJpkSAEJrHRoIonitS2fFNBQqciLccZq436kv/Gu6j
         u1fE4LdZpbaUzYM6i5CWT5KjU7iACyECDEevBo+eRFc798v1vgBjM5Sq2eUWt/XZGAgC
         xeow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721797610; x=1722402410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJm7ARutHzcy8kXrtF+ksc2xBDBrTqHqPQrdb+EUgdo=;
        b=fkUMdhpNorjBaspir9HOcWVbnNJ6V1FHbetYfeyj0HjPWIWqvayPH+ROHx0EHeYP3J
         cr7HI9y4I5ZxwumAm13Yn8Bw370i7sXoCNxFqYQyRbxfP7yMDBxU6Z92m4dKeqTItrkh
         pdokcuvdPMEq+jKuMEhkj8wZHRpX3N9Bl6iHKfTtjzyO3Pmxb3mIQPyOPyawEMnoaSQo
         b4z6DHqlZ1hbPiw6R5Cj6O2w4Hr4NfJkhPvwbDn9pSvBgeKO65bKl4oYJZ5/KsB5WfZ4
         WFCdXT0/bTcBK8xZoMntimAY9C+x0FCJvSOr7WOFVK0fZclNdS6PymAPyHnpsPGPlbj8
         0akQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkQ+DdA+ItYaPyscUkrIDwh5ElmpMYmAPE5SAINvIAtFycRbjIW2gVvpAEFoixDz7rnIp54fR/6rTZRpeJ7uiyLxbFrhbfRV8g
X-Gm-Message-State: AOJu0YzXePq6WFmoFpAMp6B2Ot2Stp+GFMj/5vyuL9haXV6vFbnaXVuX
	FvEzSOQF+LHyvYrD4IQz0rSlK95pKdjx/7nZ8WI1V3YN58DJuKIZ1uXqDAKkxVnHStnP4yY6C4H
	Gjldg1Z4AZHUyqt2TEGexxcY+6lUZUeb3307+1gFzOPlMMr6MPtw6
X-Google-Smtp-Source: AGHT+IE76U5azBGKDAqS1aO7ppAjfu/MPZN19CK8S9AIPI3hibVPDl9a8ilY3OfLS8+aPNfryjUpU3cXweXi42UIy5E=
X-Received: by 2002:a05:622a:1450:b0:447:eeb1:3d2 with SMTP id
 d75a77b69052e-44fd4c88964mr2229121cf.27.1721797609699; Tue, 23 Jul 2024
 22:06:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240720165441.it.320-kees@kernel.org>
In-Reply-To: <20240720165441.it.320-kees@kernel.org>
From: David Gow <davidgow@google.com>
Date: Wed, 24 Jul 2024 13:06:38 +0800
Message-ID: <CABVgOS=oWSyhkCSAS1-oagEa8Sdj7T+ys9uzLpZbik9Chpvw_w@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: KUnit: Update filename best practices
To: Kees Cook <kees@kernel.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, 
	John Hubbard <jhubbard@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000ef903b061df73e94"

--000000000000ef903b061df73e94
Content-Type: text/plain; charset="UTF-8"

On Sun, 21 Jul 2024 at 00:54, Kees Cook <kees@kernel.org> wrote:
>
> Based on feedback from Linus[1] and follow-up discussions, change the
> suggested file naming for KUnit tests.
>
> Link: https://lore.kernel.org/lkml/CAHk-=wgim6pNiGTBMhP8Kd3tsB7_JTAuvNJ=XYd3wPvvk=OHog@mail.gmail.com/ [1]
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: David Gow <davidgow@google.com>
> Cc: Brendan Higgins <brendan.higgins@linux.dev>
> Cc: Rae Moar <rmoar@google.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: linux-kselftest@vger.kernel.org
> Cc: kunit-dev@googlegroups.com
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> ---

Thanks again for dealing with this, Kees.

>  Documentation/dev-tools/kunit/style.rst | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/dev-tools/kunit/style.rst b/Documentation/dev-tools/kunit/style.rst
> index b6d0d7359f00..1538835cd0e2 100644
> --- a/Documentation/dev-tools/kunit/style.rst
> +++ b/Documentation/dev-tools/kunit/style.rst
> @@ -188,15 +188,20 @@ For example, a Kconfig entry might look like:
>  Test File and Module Names
>  ==========================
>
> -KUnit tests can often be compiled as a module. These modules should be named
> -after the test suite, followed by ``_test``. If this is likely to conflict with
> -non-KUnit tests, the suffix ``_kunit`` can also be used.
> -
> -The easiest way of achieving this is to name the file containing the test suite
> -``<suite>_test.c`` (or, as above, ``<suite>_kunit.c``). This file should be
> -placed next to the code under test.
> +Whether a KUnit test is compiled as a separate module or via an
> +``#include`` in a core kernel source file, the file should be named
> +after the test suite, followed by ``_kunit``, and live in a ``tests``
> +subdirectory to avoid conflicting with regular modules (e.g. if "foobar"
> +is the core module, then "foobar_kunit" is the KUnit test module) or the
> +core kernel source file names (e.g. for tab-completion). Many existing
> +tests use a ``_test`` suffix, but this is considered deprecated.

I think John's updated version here is better. Personally, I'd rather
the bit about module names lead here, as I think that's the part most
likely to cause actual issues, and the source file name bit is more of
a "here are problems to avoid, and sensible defaults which avoid them"
than "here's an utterly inviolable rule".

Maybe:
```
KUnit tests are often compiled as a separate module. To avoid
conflicting with regular modules, KUnit modules should be named after
the test suite, followed by ``_kunit`` (e.g. if
"foobar" is the core module, then "foobar_kunit" is the KUnit test module).

Test source files, whether compiled as a separate module or an
``#include`` in another source file, are best kept in a ``tests/
subdirectory to not conflict with other source files (e.g. for
tab-completion).

Note that the ``_test`` suffix has also been used in some existing
tests. The ``_kunit`` suffix is preferred, as it makes the distinction
between KUnit and non-KUnit tests clearer.
```

(But this is all largely bikeshedding at this point. As long as we end
up describing the sensible defaults, and don't paint ourselves (and
subsystem maintainers) into a corner, either should work.

> +
> +So for the common case, name the file containing the test suite
> +``tests/<suite>_kunit.c``. The ``tests`` directory should be placed at
> +the same level as the code under test. For example, tests for
> +``lib/string.c`` live in ``lib/tests/string_kunit.c``.
>
>  If the suite name contains some or all of the name of the test's parent
> -directory, it may make sense to modify the source filename to reduce redundancy.
> -For example, a ``foo_firmware`` suite could be in the ``foo/firmware_test.c``
> -file.
> +directory, it may make sense to modify the source filename to reduce
> +redundancy. For example, a ``foo_firmware`` suite could be in the
> +``tests/foo/firmware_kunit.c`` file.

I think that this should be ``foo/tests/firmware_kunit.c``. I'd even
be okay with ``foo/tests/firmware.c``, as the module name needs
manually updating in the makefile anyway, where it should either be
``foo_firmware_kunit``, or included in a larger ``foo_kunit`` module.

-- David

--000000000000ef903b061df73e94
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPqgYJKoZIhvcNAQcCoIIPmzCCD5cCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg0EMIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
JEfDtvHU6wy3MSBE3/TrMFcGA1UdIARQME4wCQYHZ4EMAQUBATBBBgkrBgEEAaAyASgwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wDAYDVR0TAQH/
BAIwADCBmgYIKwYBBQUHAQEEgY0wgYowPgYIKwYBBQUHMAGGMmh0dHA6Ly9vY3NwLmdsb2JhbHNp
Z24uY29tL2NhL2dzYXRsYXNyM3NtaW1lY2EyMDIwMEgGCCsGAQUFBzAChjxodHRwOi8vc2VjdXJl
Lmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcnQwHwYDVR0jBBgw
FoAUfMwKaNei6x4schvRzV2Vb4378mMwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL2NybC5nbG9i
YWxzaWduLmNvbS9jYS9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcmwwDQYJKoZIhvcNAQELBQADggEB
AGwXYwvLVjByVooZ+uKzQVW2nnClCIizd0jfARuMRTPNAWI2uOBSKoR0T6XWsGsVvX1vBF0FA+a9
DQOd8GYqzEaKOiHDIjq/o455YXkiKhPpxDSIM+7st/OZnlkRbgAyq4rAhAjbZlceKp+1vj0wIvCa
4evQZvJNnJvTb4Vcnqf4Xg2Pl57hSUAgejWvIGAxfiAKG8Zk09I9DNd84hucIS2UIgoRGGWw3eIg
GQs0EfiilyTgsH8iMOPqUJ1h4oX9z1FpaiJzfxcvcGG46SCieSFP0USs9aMl7GeERue37kBf14Pd
kOYIfx09Pcv/N6lHV6kXlzG0xeUuV3RxtLtszQgxggJqMIICZgIBATBoMFQxCzAJBgNVBAYTAkJF
MRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFzIFIz
IFNNSU1FIENBIDIwMjACEAFsPHWl8lqMEwx3lAnpufYwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZI
hvcNAQkEMSIEIFywzNhdYJV6HJfTp3IFU/XOaeZ8PyR8L0g+R71aSkzGMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MDcyNDA1MDY1MFowaQYJKoZIhvcNAQkPMVww
WjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkq
hkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQA4dRW9
mJEuK+rO6FGScRoffagxNO32yLtyPCkbQhGuexUAb1+GBjx/9Ozjcqa5aIOi9mP8BpuftLOwJ4Vd
Hwovr/ik6xDq4TUJi6WHW1pyt+DdEEzrCXjEqgtg3JCJhqOiv1BEryNENYIqq4xqTs1cX4Uczwwk
PCUCJlgGEfLs8YMycPv/d0N36k5I+VONm4e+Sz8Ekf3FvIs0fZxLVXcrxQdGX7TEiS/Tuy6BZPrr
vLqTP0u+ET23jGmazBl0MAf7we7urvybdPhX12FiQX7PQoPZ0kbdpIG1PbtiDGwkj4DzXtiJ7Qh3
+aP6ae+GkxqMaV89yvUf50BnNTnRbBST
--000000000000ef903b061df73e94--

