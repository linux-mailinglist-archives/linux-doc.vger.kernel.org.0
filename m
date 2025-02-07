Return-Path: <linux-doc+bounces-37335-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBC0A2BC62
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 08:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC5893A96AF
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 07:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F571A00FE;
	Fri,  7 Feb 2025 07:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v3KsVRuW"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E2A19047F
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 07:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738913864; cv=none; b=k3VmBvvjdgYEdrLiVkf2tyK9Y5ktfacz2x5t5GvEagMWEc5uuIBvGI9J+KdLsHgHORRdR5M++N9wwnySKYb9KRrDHeV0/p2LAfWLzikfr2oneHFgqEn6GGdI9vqZN6FOCtBc89ENHUfrXkcBLN4ot2bt/uXerXhfKttlfM7Owuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738913864; c=relaxed/simple;
	bh=hEIog7/NrauBgHZLqHm9YeDfpbGNvXgAfHlhnQN/5OE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c2/ygMBNQiJC9haIDvSwwL+4/P+mHAYxIo22RD9OkhL+hRXSHEGKVqLg5p+kpsU5pWOBukPBXdQbgUywxXsDOXaNuZbBFRMCAKMHCG7D59hiHuI8yrXseGjZqcf7LRiP6wUZcYHPh5MMfYrs3ddYH5RgQKFH2YYqzp3K/wLzeaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v3KsVRuW; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e42d9c092bso14853086d6.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2025 23:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738913861; x=1739518661; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0JMuN4GIFCnF/tLvcFkwfvHjvZW4pWydHAqU2DZ7cw4=;
        b=v3KsVRuW51vlQhmbo6vFsGNgqN58ceXFFdZppyNZ1DRU7+DoOgBChg25qnpeFo4y0S
         SxnEQO0uMMT9gv3SlWASuXgiIOnPL4ahCRxKTHI7UDOONZgcLCmDLioKkWlVBgShdZ/1
         4NEOck6QutdPwjhECVWIxnmMrBTw+Ss5szfdGrrX71+wGJv6Ss6pGLfWj7/zqc07pJcy
         6QwydmKdPv2QW4dX3O0Fm//MjYLHhDr1mfdbagwZW3JLWDLpmXnMtA1TP+oQB09GAL/n
         6qN9RT8tozjlAmvsNxgMwCog0UqCTb0LvIJxXX0XsAZtREZfAhaR1G8c4gp3g5LXtlcf
         4EwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738913861; x=1739518661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JMuN4GIFCnF/tLvcFkwfvHjvZW4pWydHAqU2DZ7cw4=;
        b=jwHthLaj9O6uBkl9zJVxXbRrF6hMbLaylgwphHiKMqZr3Q6tNI9RTtax2AuzJ8pkZM
         mLooR7StbpIWJ1oZ3aIYzh/J8fJK2gjpME0kN5RtoKwaMHdSTRsvApJB4ruzgmPbma6w
         EfVtlj0YVxttJEt3TNohKFNE1Mxd+EMC86jQoT6oYQL6zi//q9IjnENehRKvaJvEqw1/
         u+MGz6Et2NE3M9a6duhmmiiCPKdo1jWC7w/uM3A5PegGCi/CmW9TWF271yWNvOaA1ERc
         EjafEW5K/hceh9s+faIHYRIDtGHxfGo/KiUOTIqGdxuoeYbMEBIzqqyGnmGahz68zYos
         j5mg==
X-Forwarded-Encrypted: i=1; AJvYcCXCA6fbMgpXfwgFydV2e45FnqfKXNyWlMgslQMk7TqytjfAY7f7LND/EJIyb2fbAZzqSvTJyv6P28Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTbF/ufuYRXkkDtbUjPawBw9gcCWGX6zfM2xXtmqTecDSzQ+sh
	lP4z7QXd0NX1NfLSH8b+X3GjGHXG/PRZZlKBiCJJ4WyhkklbELW7SdGxDqObpmHms+qpkaetZax
	0IuG6neAV67dnYuRJvqy4CjVj0lPfce8TmEtJ
X-Gm-Gg: ASbGncuL/kYJI/DxedqDdGRGz3AIneQ2ITY1VKqRF3y7ueLqsqtBzDglenKoaLHqbuw
	bcW47IzHOkOdy5alsmtwgT9AcTyMbmum4V/KQEZynrtS478w87EFGOg3UcktwIIo+VICju+FPIw
	==
X-Google-Smtp-Source: AGHT+IGhRdbv/v58NngZqMXp5f646LVNcLjFc0VCWQl9pMsMeQk+D+6UU/MeYFfJzVAvG0HU0SkT+PKm6MIk8gJi5vQ=
X-Received: by 2002:a05:6214:1bcc:b0:6e4:3ddc:5d33 with SMTP id
 6a1803df08f44-6e4455ee444mr33480606d6.13.1738913861284; Thu, 06 Feb 2025
 23:37:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-printing_fix-v3-0-a85273b501ae@invicto.ai> <20250206-printing_fix-v3-1-a85273b501ae@invicto.ai>
In-Reply-To: <20250206-printing_fix-v3-1-a85273b501ae@invicto.ai>
From: David Gow <davidgow@google.com>
Date: Fri, 7 Feb 2025 15:37:29 +0800
X-Gm-Features: AWEUYZm7YmoDZS9zTs5wU5gjaIFbUQ0P0Q4L3zt9tl7FmV1yaJOzz8lLVQw2wxI
Message-ID: <CABVgOSn7Tiu8xdrUO-86_h7g=xDU4cU8_yEyurb1taePbE2Wkw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] rust: docs: add missing newline to printing macro examples
To: Alban Kurti <kurti@invicto.ai>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Wedson Almeida Filho <walmeida@microsoft.com>, "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>, Tejun Heo <tj@kernel.org>, 
	Fiona Behrens <me@kloenk.dev>, Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, 
	Xiangfei Ding <dingxiangfei2009@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Fox Chen <foxhlchen@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000005d831062d886f4f"

--00000000000005d831062d886f4f
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 05:08, Alban Kurti <kurti@invicto.ai> wrote:
>
> Fix adding a newline at the end of the usage of pr_info! in the
> documentation
>
> Fixes: e3c3d34507c7 ("docs: rust: Add description of Rust documentation test as KUnit ones")
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1139
> Signed-off-by: Alban Kurti <kurti@invicto.ai>
> ---

Looks fine to me as a fix for the KUnit/testing docs.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

>  Documentation/rust/testing.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
> index 568b71b415a4525772cb77ce76c7f9da32fac1c4..180b886e0f1ee997779f04ce85eba858e64946c0 100644
> --- a/Documentation/rust/testing.rst
> +++ b/Documentation/rust/testing.rst
> @@ -97,7 +97,7 @@ operator are also supported as usual, e.g.:
>
>         /// ```
>         /// # use kernel::{spawn_work_item, workqueue};
> -       /// spawn_work_item!(workqueue::system(), || pr_info!("x"))?;
> +       /// spawn_work_item!(workqueue::system(), || pr_info!("x\n"))?;
>         /// # Ok::<(), Error>(())
>         /// ```
>
>
> --
> 2.48.1
>

--00000000000005d831062d886f4f
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUqgYJKoZIhvcNAQcCoIIUmzCCFJcCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
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
AmowggJmAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAcDMKctW1GQKDKqEUSh4
pjANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgtIHgWA2gSaLlFMUcf7RlEfnlCXKW
tC6uL/tTM/jKT0owGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
MjA3MDczNzQxWjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUD
BAIBMA0GCSqGSIb3DQEBAQUABIIBABmsrNjREQUGK6Ye+s4ZV4fCyfjzfgNU/ur7B1A5UX8DKjj6
IjIM1RsgHc78rnLPP4w7sbddEWnqOTmRbXZ8Kpn35FzArKZ685SnJ1ExUDTxdSOjscvWisW58rYS
SGtNX/uq7jr3ky+oTurXoWYi4EDdhRc/VC/V/EOoFyIoF84NpjfkS0ohPFNq2dYwzfgFgWTRckYh
fDZ/d9+0ob8v6fv0WN0/CMh1mTtcDHF05XzGaPyjb12DMpAVNIwyR59i3ythJlqMlFp3SvtwI1X5
GWb7YoOS0KJY/J9V0PaOII7Z4HCEhRx6mwn9pf/4+6BR/sxpxOkxZ6hJnRXtNzqBru0=
--00000000000005d831062d886f4f--

