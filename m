Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 276894DC196
	for <lists+linux-doc@lfdr.de>; Thu, 17 Mar 2022 09:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbiCQIoq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 17 Mar 2022 04:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbiCQIoo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Mar 2022 04:44:44 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 617C6A66DA
        for <linux-doc@vger.kernel.org>; Thu, 17 Mar 2022 01:43:23 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id jx8so3745138qvb.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Mar 2022 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zw6pYTLf4RBCQKhulFUjbz6mq1Lo/kEUHMfZyCCoQ3M=;
        b=sTp+Hlj91CRgL5laYuKPQw1pzz9HtcHWdiqLdl74/y7FZiTb88OWNLvPW2ijZ//b0O
         diGFaTGh3UE8mV7UMys/39lPZY/onsjyMiDfTeCK3EoeU6hMFR9FbV6VcG5lqbGPcs72
         0odPLsRfU7mskkb0RV6QQz/JJwNoBctiM9y4iPRmofd+J03nNMv/6JpQJ++4hcKOHQJL
         5UU9lEIXeNoakjb8IpUegeJhyhCi9g7cEAlvSN1YqLl1jMukeHGZwt/jBy0/sNgttZor
         JPPN5bECXr75aVnpMVihxXb+gqWGHT2/yDaelAWXimY57bMqgitI73fZF9PeYSo23Lcw
         T4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zw6pYTLf4RBCQKhulFUjbz6mq1Lo/kEUHMfZyCCoQ3M=;
        b=v+T3hJvgIgaTJq5ZuT3AaLRSOvKFyL0CFb6KxvGr/Jqb3oTlFL4/NR+jObYJ7UoLt+
         HMNr0VRgv4WZfcQZo99CgISMSQXXdb0aGGNYCzGmZ53lOiyX7Wq+VgkGq29cH+tGPcNs
         NT10HxotHm0wjx9mGJx20I/aAu6FRLfGHQA1FvzRa6zMdMDWGZCHqsfcT1/KNN6AJ8bC
         RbJn9zYjKIINrIvPlj4nw+oOjyv4JKYCppG+pxEQaiZ+2p1U/7E7VnmrVXP80hFyglyQ
         R4/XeToxOHbv76rK9B65JXB1E+OL/knGArynZjIjdZZREHrgXEDj7EoL8MUgIPNFyel6
         3IIQ==
X-Gm-Message-State: AOAM5321rWmPR9i6F/o3UzsWkdsqKt37TYIAthJETXzf2SnfzdiJBp6b
        hFlJhhIOZWSY6GaqUTQk95smB8N1KhVhmmDzvV3VsA==
X-Google-Smtp-Source: ABdhPJz7tSnICHGgjrk4Ox9GC631xG2x+y8FWGdsZnc+6TSzW+4IoahugpOtAepQXnrPNsE/9r6cSmjXM5UzfNv7HTQ=
X-Received: by 2002:a05:6214:d8b:b0:440:d680:c744 with SMTP id
 e11-20020a0562140d8b00b00440d680c744mr2691992qve.29.1647506602915; Thu, 17
 Mar 2022 01:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220316202622.324866-1-frowand.list@gmail.com> <20220316202622.324866-3-frowand.list@gmail.com>
In-Reply-To: <20220316202622.324866-3-frowand.list@gmail.com>
From:   David Gow <davidgow@google.com>
Date:   Thu, 17 Mar 2022 16:43:11 +0800
Message-ID: <CABVgOSngfB41BVoEvQ1JX+2oFvS7Mik58VfPm9pydmiC_GSD6Q@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: use literal block
 instead of code-block
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        "Bird, Tim" <Tim.Bird@sony.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Rae Moar <rmr167@gmail.com>,
        Guillaume Tucker <guillaume.tucker@collabora.com>,
        Daniel Latypov <dlatypov@google.com>, kernelci@groups.io,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000d9b8b405da660596"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--000000000000d9b8b405da660596
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 4:26 AM <frowand.list@gmail.com> wrote:
>
> From: Frank Rowand <frank.rowand@sony.com>
>
> KTAP Specification: Change code-block directives to straightforward
> literal blocks since the blocks do not contain code.
>
> Suggested-by: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---

This looks good to me.

I'd personally rather push this through independently of the KTAP 2.0
spec updates, as it's really just a minor formatting change to the
spec, and it has no impact on the actual KTAP format.

So, if we can accept this independently, that'd be swell.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


>  Documentation/dev-tools/ktap.rst | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
> index 37b5dc61bfb8..b9a57ceddd4f 100644
> --- a/Documentation/dev-tools/ktap.rst
> +++ b/Documentation/dev-tools/ktap.rst
> @@ -115,34 +115,32 @@ The diagnostic data field is optional, and results which have neither a
>  directive nor any diagnostic data do not need to include the "#" field
>  separator.
>
> -Example result lines include:
> -
> -.. code-block:: none
> +Example result lines include::
>
>         ok 1 test_case_name
>
>  The test "test_case_name" passed.
>
> -.. code-block:: none
> +::
>
>         not ok 1 test_case_name
>
>  The test "test_case_name" failed.
>
> -.. code-block:: none
> +::
>
>         ok 1 test # SKIP necessary dependency unavailable
>
>  The test "test" was SKIPPED with the diagnostic message "necessary dependency
>  unavailable".
>
> -.. code-block:: none
> +::
>
>         not ok 1 test # TIMEOUT 30 seconds
>
>  The test "test" timed out, with diagnostic data "30 seconds".
>
> -.. code-block:: none
> +::
>
>         ok 5 check return code # rcode=0
>
> @@ -202,7 +200,7 @@ allowed to be either indented or not indented.
>
>  An example of a test with two nested subtests:
>
> -.. code-block:: none
> +::
>
>         KTAP version 1
>         1..1
> @@ -215,7 +213,7 @@ An example of a test with two nested subtests:
>
>  An example format with multiple levels of nested testing:
>
> -.. code-block:: none
> +::
>
>         KTAP version 1
>         1..2
> @@ -250,7 +248,7 @@ nested version line, uses a line of the form
>
>  Example KTAP output
>  --------------------
> -.. code-block:: none
> +::
>
>         KTAP version 1
>         1..1
> --
> Frank Rowand <frank.rowand@sony.com>
>

--000000000000d9b8b405da660596
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
G7p3AiuB2sgfq6cOpbO5MEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQBsL34EJkCtu9Nu
2+R6l1Qzno5Gl+N2Cm6/YLujukDGYa1JW27txXiilR9dGP7yl60HYyG2Exd5i6fiLDlaNEw0SqzE
dw9ZSIak3Qvm2UybR8zcnB0deCUiwahqh7ZncEPlhnPpB08ETEUtwBEqCEnndNEkIN67yz4kniCZ
jZstNF/BUnI3864fATiXSbnNqBwlJS3YkoaCTpbI9qNTrf5VIvnbryT69xJ6f25yfmxrXNJJe5OG
ncB34Cwnb7xQyk+uRLZ465yUBkbjk9pC/yamL0O7SOGYUclrQl2c5zzGuVBD84YcQGDOK6gSPj6w
QuBfOooZPOyZZZ8AMih7J980MYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABQeVybOOpR4bOOXZYL5T3MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCD/
veQhoB/7AHajBmLtRzTMPDV3mVNkoti1RQbI/Q2JuzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjAzMTcwODQzMjNaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAYYVU/uOUwk2ECXLz2vo8
sPQsJpV3JDiHHFsYbNfpBx+eZ4FkOO34HKNWQfOY0f7bF9zM86+82TeNTQF1aPaySptG2ZZkSeB6
5v+uRQNV673O9abHKHNl3z+lZqQuRdpJLzr0QjlXQtm4F+3erqPtvOvS5b38ckmcfxDOD31/v2/H
5tfTzF7xrUmXsBQo5bgjNFQnDvqxvJwwKCPOD86lNTEfq9AhiQs5SYicl9KYQv2RQaCHDJ4+jXY7
NKm3czYyz3K4w11fx7ZAXvhdL4TkGmkRUqhLS7w0i0BhiPH+9rxomV8s8cUEzvwfP13NiR9nQvya
wpY8z3aTsy+HPJ8I0A==
--000000000000d9b8b405da660596--
