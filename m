Return-Path: <linux-doc+bounces-1089-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 455AD7D64FB
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 10:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A54D2B20D2E
	for <lists+linux-doc@lfdr.de>; Wed, 25 Oct 2023 08:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E9F1FCC;
	Wed, 25 Oct 2023 08:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h0Ns4InU"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894EE1CA92
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 08:26:14 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 256181B6
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 01:26:12 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507a5edc2ebso1820e87.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 01:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698222370; x=1698827170; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S4oEHlE02afxN+qnpSmrt56R8pweKJ4epNTlmO7M6yI=;
        b=h0Ns4InUtyZHsgyjpRlIYM47zMupCpTD0sXoLOBmvXpB9Y6aHsoIHS3whhN0shYOFj
         EE2H9fVXPp6uUiQylhFcpNUgf7afr+k1xxvrDOsuq4Asl1D2v/13nifl9AsBQcvTdp5E
         cLfnTKgSlMGs2iT49FGPFw+7ermzoHHI7AeK2gJDP5VuPfJCVMluaDjJhEY8bzuTw8wX
         +jwrZxo0BGUMRvkJhTun/fwd9bZAxn7eFuWh6/a0ltps8SQgftrWxb/iMCX7hL+z0Kku
         sGmoJEPl9aFMAK+UfYeZTCL9igcqEpvIfdX/3u2TL+5Rt5itUI3L+X0mobNlDitBlTFJ
         IRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698222370; x=1698827170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4oEHlE02afxN+qnpSmrt56R8pweKJ4epNTlmO7M6yI=;
        b=NlBh4/4kzxAIuqLuk1SpxrJ2iKsjtJqE1wlXw2m2oEqcpWSZCiAFhQamHiaek0iHUk
         OunzRG8fTgzW2MP72saV/JFlL/EJDlqqk71FSeZCW2r+sxwZa7c3s5sydnVKaeamG/e+
         5R4dmevE7aqIr7jqwt46rhjYH6/ANcd7f2+2WmisUeQr/TZeuDMHqYcN6FgTnJv87nWr
         +LkTm1l0RimXUpUWpCn5KBmOdJC7kE6oGFyzx7xAOM7578q6tMHztdDByF7zKeELAI13
         PduZ2eeuco2l5nclzj3ZQBI1SnBJy0s/C2Uxt6gUxToNJYuD699rMMP+yf9jx5dJEiIV
         3tJg==
X-Gm-Message-State: AOJu0YyaygSuz858IwGzm9XfZKKHmw4aCdZ8KIuotfUZELO01PTcr76N
	wrRADChb3ck4SlaPRoElfdw1MS3aSSR6CPuLZt/+tA==
X-Google-Smtp-Source: AGHT+IF/rYB9uBwRt5ihdafPLPHHTfnRuOAoVcDD3FPa0qs9exb9AU4/jb4MyiT19uSM96dQ88vkxWk4GVlD2gwuZpc=
X-Received: by 2002:a05:6512:360e:b0:501:b029:1a47 with SMTP id
 f14-20020a056512360e00b00501b0291a47mr27931lfs.1.1698222370101; Wed, 25 Oct
 2023 01:26:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020092159.2486063-1-michal.winiarski@intel.com> <20231020092159.2486063-2-michal.winiarski@intel.com>
In-Reply-To: <20231020092159.2486063-2-michal.winiarski@intel.com>
From: David Gow <davidgow@google.com>
Date: Wed, 25 Oct 2023 16:25:56 +0800
Message-ID: <CABVgOS=S9w7cTTNO+JjXoBCYe8RJ=tRkEfdZiWhPbbUk52SHNQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arch: um: Add Clang coverage support
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: llvm@lists.linux.dev, linux-um@lists.infradead.org, 
	linux-doc@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org, Tom Rix <trix@redhat.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Richard Weinberger <richard@nod.at>, Jonathan Corbet <corbet@lwn.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000027045c06088635b8"

--00000000000027045c06088635b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Oct 2023 at 17:22, Micha=C5=82 Winiarski
<michal.winiarski@intel.com> wrote:
>
> Clang uses a different set of command line arguments for enabling
> coverage.
>
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> ---

This works brilliantly here -- I'm very glad to finally be able to use
something newer than gcc 6!

I assume this will go in via the UML tree, but if you want, we can
take it via KUnit.

Tested-by: David Gow <davidgow@google.com>

Cheers,
-- David


>  arch/um/Makefile-skas | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/um/Makefile-skas b/arch/um/Makefile-skas
> index ac35de5316a6..67323b028999 100644
> --- a/arch/um/Makefile-skas
> +++ b/arch/um/Makefile-skas
> @@ -4,7 +4,12 @@
>  #
>
>  GPROF_OPT +=3D -pg
> +
> +ifdef CONFIG_CC_IS_CLANG
> +GCOV_OPT +=3D -fprofile-instr-generate -fcoverage-mapping
> +else
>  GCOV_OPT +=3D -fprofile-arcs -ftest-coverage
> +endif
>
>  CFLAGS-$(CONFIG_GCOV) +=3D $(GCOV_OPT)
>  CFLAGS-$(CONFIG_GPROF) +=3D $(GPROF_OPT)
> --
> 2.42.0
>

--00000000000027045c06088635b8
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
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
ddIn9n5Jt6Z1o79zxraLMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQBtHFwIgQZjer5K
H+4Q+wns10k7qN+4wN2Uf+JsyOYjukaMEgdLErfA1wwtQ9uHkoYQZcWBuVVkQFa5hI+sqI2m1Weq
riMCFSiU38s1tADdMX12IMfJRN60Nznhrw+nPyDRZqRhUTW24TwnHorkDnFPW8PHo7fAw4FrpI0n
impZAng7ccvvK09K3ZuhwTIxJMsPXCZYsrXWORTw5sczRAP6XvKbPBJnsJoSTe5dFBPBHOQJOGhU
qWfEfWnWMJPF3LxSGLpLFQXO3RwQqmxv08avwXfVPouh1xuB3FX7rpDabT8YDhu9JgIZkLEKko7L
yQt6zWwng7k8YF/jGbiAta6VMYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABzgV+4+mJnUzG7XDy6d2uMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCCA
Kbl0OArAsicGesxw5A96aDQhgmtxcstgUmFzU4CJYjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMzEwMjUwODI2MTBaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAcuKWEqPM1Vz8G0NChftg
1Y07dtfcGbraVTIC9jMfNQ1H/pw1dNKizG6/RnzCnt/TIcyG4lEGIEmRKF3vh6vWWCqqN/cHddkO
+LuutMyjW0mMP4tyJtabSgy06VUFEyj3FRmked8LtPKnCoKEvbXo1kKuCcfgTQ0FtwHZyXknepBa
lakNG76KvRfnKd8aKLOigzXb1xQjnSuWk5J7TooXnAas69PIlyg3OqSu70MYes/yml70bEYsuVtE
lTJu0hvZLdnKZv5W4YWh6vJT3jvVd/CSkhBKxR364du0hgq5nTgXYMOoDcH9wIyiy6m3rTYotUco
LHpqHasTollzrazz6Q==
--00000000000027045c06088635b8--

