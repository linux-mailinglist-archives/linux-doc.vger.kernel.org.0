Return-Path: <linux-doc+bounces-85484-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKIBLqby9WmVQgIAu9opvQ
	(envelope-from <linux-doc+bounces-85484-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 02 May 2026 14:48:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E6F4B2081
	for <lists+linux-doc@lfdr.de>; Sat, 02 May 2026 14:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE350301AF5C
	for <lists+linux-doc@lfdr.de>; Sat,  2 May 2026 12:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A34377575;
	Sat,  2 May 2026 12:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8zY0/Eu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124D8376494
	for <linux-doc@vger.kernel.org>; Sat,  2 May 2026 12:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777725940; cv=pass; b=twfMaIPOGc4ZIHulJAG30ddJNdKCqceQnwFsCiAQUYXV2MH4A7ZbGRFvReYqg7cbsRXKwdNWeLhIIZpaxirRkKlm5ZD1kFu4ZzZlBMc09dv/NVNHY5vWNkCEDy2sNDyjEwTCBXk0ODJTlxx7IieTu8v+/FgJm5jOGHtW+dWh4Mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777725940; c=relaxed/simple;
	bh=n3xseiNIVpllcVpiu3P4TyieWy+FX3D8w8ugihmNk6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mgh1ZcETrcedrCHGz0c2d639YIVaz8NNkUdAsiGG68bxXOV/OngNR2vp6BWDij1/EkwXKeRIjJ6kannQxrLSkTRUSG17yAuKT/s81R/cqTrLHGtsoKmIo7ZN/eN/RuT5UPQPx4hz9bn6iWyfBr1lATC3X1TRXsDLCtsncCbUjP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8zY0/Eu; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso65689f8f.2
        for <linux-doc@vger.kernel.org>; Sat, 02 May 2026 05:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777725937; cv=none;
        d=google.com; s=arc-20240605;
        b=iUo3DqKpkT/vQL/2wOJu6sHphuW2ZlD9t+KHcuQS11XAVBOQaDEH2Itp92AX1Xvg3+
         vJfxk6TfK5GTZRuGXk6DHzz+LExqsMzCqZGk1aB0QsSVrhjXjyzn/IbVyxDPrDl8dv4h
         70Nfw+x5APrWtR/JkMM8HBgk+v2puuykXpRRLV5Cq6PR1XIkE/Y+PBVpd1M8WaxM1Kyf
         TYItv8NyYJDqIXbDXT8qGKS33KlDxpJbxL011ZFngEHMIEkxiWcTz0X2AHws2tzLo/ao
         4KkJl+JylrgijCE17EQFBeNMmHytPU3ceZcxEF6M89qS3Gy2pIwY/ELXeeCxbM9xgdhy
         7FhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UFEiLFgiMdeWzVKtIkFtmgYmWXOcnLKXA7wanDd2Y4o=;
        fh=1a+t7NIPVvlZHPV9kMxIPLwYljThwDxif6lHGWNYhY4=;
        b=A6TFN2j1CQoatyJy9aq5eh/h62FkdRpl5FmAQRCTeCXt4a77sU7xn6+Yy5fR7IW8DU
         Bu6Rb0Dm0Ty47n5hQ1wKQOKYlQ+B5B+nV3VYvL8bLTGSbBCjJxyK8nqXZF4GrbUYFDs2
         gCjwRZtfGCbDAVMBTtTAWMT/S5Iwvi7UcI+m087/Klbsi3j/4v9V2bejArHBpM9ogAgD
         YUcKdiTFP9vfR72ot9Mkge3TVuP88345DW4GVwU2ukMlFtjV4pPSqnLwET1fW7hK8qnn
         T1or2ESTAP4bg1vy5ri313GP7ifaP88wMQ4S3ZIwZDb2km3Sdmd6tgVwdyMXHU3b3Cu1
         Mtlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777725937; x=1778330737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFEiLFgiMdeWzVKtIkFtmgYmWXOcnLKXA7wanDd2Y4o=;
        b=Y8zY0/Eu9T6rqah5cGCWpRV/8CTgLf0S+OCyMIqSQrgO/TqsDBySbFHaXgdhDcBEhm
         TdyuATXDG7ZL/EIgJjeFETfExIn8g/CkRk7fAi8ge6+wY8wj1PYEMPc5d9MhsxwSmVil
         aU/I0Qh+Q4q1B1UzZNhyK1iL/mq3jO01ql4vA9QbcmhSUGjeeEWf9CxU93Dy2auzx4N2
         cwnnzTmQRxVqubBIGwFWLXlsWKZl479Krgy9u1z/JY5KjfdLdWELx3AEAd8jCbJvLfTj
         1BUWdhf05x9Vge7RLoUbS113sfBsiLbjGVhkjzAH2uI9wPOCj3c8atw2cwCa8sIQgOuc
         k48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777725937; x=1778330737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UFEiLFgiMdeWzVKtIkFtmgYmWXOcnLKXA7wanDd2Y4o=;
        b=CTPW1pYk5EPmEFUy3IxAMfeU0jdjrw2PJA/ug6PKpfpfXHKsisSLc9mBi3PRmgahrq
         eT5ot5L+TU4xeg4GeuWmUcfyHVdjYjjxi7ZlK7Gu1A619qE69tLtTsWYoChFROiod339
         EoPgHFdA+rnv0HqGDXD4PwYmA0NTIMYf2VpH1CJQPr6QKxB28AbCLFMtD/OL2HpXBC9b
         4MGKqK5F2iAec+LDq92zystW51+TaIjlbyv+fyM8bphZLk8Cwbhb2W025xHX+1ScIQ11
         97lcB8cS5JhH6tIcO4M1m8tYuBoS07F2X/e+W0/YUBsks6l34G7mc5vbhnYg847mJ9Pj
         dG+w==
X-Forwarded-Encrypted: i=1; AFNElJ8cmd/1RhN9pJF2Ni9p6ofbaeVQ/MHxjukdpZmUQisLxfOt926U3B0hygRLzJKCUEeJvfuxjKLNmow=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrBRt+uXyd4qlIZqDyZ9Dg9scpqCp0VMCFa4X2oF26x1SR7BrP
	Q5hbxmKpV5wff+0Q21ctpvqzswj+fxaWLyJ/j0uxcF6AKgRvRTwpdOQF1uzplHkC/f5LdfdZlWo
	yQEk4S4PL//HVwhB7gKSSwmljGcXwcX0Om/kW
X-Gm-Gg: AeBDietfgbW2c36r3Me5rxHjuddx1oV5gOw0B/umTBUkAdv0Bc7uml5oXCZuOn0vE2J
	+30DyH7lpT6GAF+RMi51P+e9NcTjbyEZaTZTZknTbwayqO8ORbgAhQ61kYsl8QxQfWjj5fBRoB4
	fvwfcTIbNrUuYtzT2hZpmn9DZ3FzXIVBItAyXS+DlFNNdItLQayWn1r0xlop418x7vM9pCEyKqZ
	dbKV8xVXY9YdSRDbJaUcp9GhcwHvh4AhAz+o2sQuaO8iip20SRxVxUs2sLTgsccGWLiTr4aWNtd
	UKzRbDIctkg4EJEK+Z50LwrJhK7qTZ1cppDkTPL2jVe0eUsi+bnTyRH/O46JV1l+OGncB9+wP+d
	lhohqSxnRVLOosDgb24KY3nNqpd2BHFO1xhSrFnJBkvLTka56Hfg3hiw0Pc1+iBKZhA5MBDe9I3
	xj6ouHrC8Dziki6RQgvdiasohy6Ns2xXBqtqTx8YySkvYsBAq5
X-Received: by 2002:a05:6000:2313:b0:43d:77f4:7145 with SMTP id
 ffacd0b85a97d-44bb5680d79mr4852242f8f.19.1777725937241; Sat, 02 May 2026
 05:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_EC262467CD5E46CA97CF2B2FDCBCA0565C08@qq.com>
In-Reply-To: <tencent_EC262467CD5E46CA97CF2B2FDCBCA0565C08@qq.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 2 May 2026 14:45:26 +0200
X-Gm-Features: AVHnY4KxdE-SEktE6ItXq7xcFgqr0xVAdOiLtKg-q3U-oWGA6xPYzkRFtKeHrHA
Message-ID: <CALoEA-zKcE2FXu3g7EC7OKSJmEtN0SWjy9ce07yQeMph4aH+5w@mail.gmail.com>
Subject: Re: [PATCH v2] iio: adxl313: fix typos in documentation
To: Wang Zihan <jiyu03@qq.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 23E6F4B2081
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-85484-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joshuacrofts1@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,analog.com:url,qq.com:email]

On Sat, 2 May 2026 at 08:07, Wang Zihan <jiyu03@qq.com> wrote:
>
> Add missing space in "ADXL313is" and correct "a single types"
> to "a single type".
>
> Signed-off-by: Wang Zihan <jiyu03@qq.com>
> ---
>  Documentation/iio/adxl313.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/iio/adxl313.rst b/Documentation/iio/adxl313.rs=
t
> index 966e72c01..3662153a6 100644
> --- a/Documentation/iio/adxl313.rst
> +++ b/Documentation/iio/adxl313.rst
> @@ -11,7 +11,7 @@ This driver supports Analog Device's ADXL313 on SPI/I2C=
 bus.
>
>  * `ADXL313 <https://www.analog.com/ADXL313>`_
>
> -The ADXL313is a low noise density, low power, 3-axis accelerometer with
> +The ADXL313 is a low noise density, low power, 3-axis accelerometer with
>  selectable measurement ranges. The ADXL313 supports the =C2=B10.5 g, =C2=
=B11 g, =C2=B12 g and
>  =C2=B14 g ranges.
>
> @@ -112,7 +112,7 @@ apply the following formula:
>  Where _offset and _scale are device attributes. If no _offset attribute =
is
>  present, simply assume its value is 0.
>
> -The ADXL313 driver offers data for a single types of channels, the table=
 below
> +The ADXL313 driver offers data for a single type of channels, the table =
below
>  shows the measurement units for the processed value, which are defined b=
y the
>  IIO framework:
>
> --
> 2.54.0
>
>

FYI, please wait 24 hours before sending a v2.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

--=20
Kind regards

CJD

