Return-Path: <linux-doc+bounces-46117-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BCBAB6FBC
	for <lists+linux-doc@lfdr.de>; Wed, 14 May 2025 17:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 726861BA03B5
	for <lists+linux-doc@lfdr.de>; Wed, 14 May 2025 15:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77AFD1C8606;
	Wed, 14 May 2025 15:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="grnyxb9+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8655A1BD01F
	for <linux-doc@vger.kernel.org>; Wed, 14 May 2025 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236480; cv=none; b=m1FBxzvlkNhtwfVe/5PaZTSucF1LCc1Lj13ZYx1UQFXIu/28SH77P8LbSvgzwVubuxHX9tH29umizqFdqlHfNPVjm1KcnynypwnrPHgixhhKOBHJ0I0MZibWXMy9a/j/mxBdtxP7QVcsGiBBJs7d7cD0kAtB5w403LL+1EDmBUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236480; c=relaxed/simple;
	bh=SGKjeHVkf6yzlsanhJUth/0wT7fmx6nVcIxyoA2ge08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iDV3zh4atW+O5LwXRD/sqV9pMciP6SNQieDSFclVogjrNTB4IKEV3q5e+pcEH707aJmqfLIWn9eOE0XLEVEbDVWpnIevwzZtwJ/eHsDmGgEoM6YljFN8zuwRGW3i9tL+fs9Oht4n0jS15Y013ZQoZu4jDmQNcS6eMrOvI4AfG+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=grnyxb9+; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ace333d5f7bso100261266b.3
        for <linux-doc@vger.kernel.org>; Wed, 14 May 2025 08:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747236477; x=1747841277; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SGKjeHVkf6yzlsanhJUth/0wT7fmx6nVcIxyoA2ge08=;
        b=grnyxb9+BJjxqXifb26sykPJ3CcuBcpwvMtlEXyZVzEeelNLmTsZqCtlXlQigL1xxr
         XuaKeEELmraKZKYJqXg3oBsnByBVl/wTzfQkjiBGeQnvBZqxxUYubSZBlZb9Il7yTc1a
         MBBC7WeNG+7Mm2XeiwHqqRYksEb9fD5kb7ClAB0RmeC1plp+ZJqh1oYYd58euHg4dbl0
         OVb9U8eETKStDE3Mj17vLu0z39eDd2vZ+x+9efdl9PWcScmNzRVVoffipDhas1DQ0veA
         v9FJCpSdjIPVUtlSBEvZ2AHhOgpl90T/4XtEVTxNjKSBW0x+4o8oPme/n1wK4QSDBCHQ
         H1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747236477; x=1747841277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGKjeHVkf6yzlsanhJUth/0wT7fmx6nVcIxyoA2ge08=;
        b=Psrr8t2rSKB4FNcGB/4/uhzWkL6kJkB6GV1d5AJoPlpfomdM85V5Vps+sx0oqRShpl
         nvueHLPE2L2w6MLVpbkPvQYU5IgQIweoL6z8x7qQbym/cb7lQsQKpf1EUSmgjTNQeIWz
         VjY/wM8NoyWXwHiCbc5jbRCtnDsnyrmIPFyHfZYyvIQqvDTRtSlzsiNKSAVt6XXfcdgf
         ABi04zHXMzcISySp3I3EI7Xa6DetB9BrPNPTtzfr4Qh3MUljnPvTOWN7hyCK+OE8PdRE
         Szqu/SDtul2fmcQL0RwjgasPI3r2aWoIUw3cIJbn9CIoHfJitfCr+MnOxGxz27c0iUbk
         P7Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUJdpMGtWCu5P9FHP1cUjkiy51JKy8qdpH3ChQsFZKg+1qpbH58F902k5WTeEW6gLmkGOxHdRtwdR0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5fcDAd9gWXBSrtGvmhbvD3mxXohfvxxziE/kNfhipCcDLDEzz
	EJ2liHkGwoeTIwBfUGwj1oaUKHD0sXrKqvOKkOYBbx5bJF8ARUGFab2fKZRjEvG3Kutp/StTCrp
	DAdusk3wG+lbA5DV0+YVwLNMhLBbJE6osn/VCmg==
X-Gm-Gg: ASbGncveaMFAZo1aj6kQHVKhEWQj3gOwGq0T1jpeinVoYoJczqPgZkdRSKQxBQ4qIwo
	ISOR9UuiTrfsT/o7G9sKNbhFmFNEezu+w02WWLiY+Ut1Rqurhu4YgoJYapjfj+yQrGDxXZmzr3H
	hpyia1eIed3+1ZoYwwO7sh9SM2rI1WGOk=
X-Google-Smtp-Source: AGHT+IFI6WGyYTssVEodUuBbRbHdt/cK0IPusMpr/1+pqSkJpRWIkQArQUnuyloTmvBZCSiRQ0Ya6krvZBl9FePgExs=
X-Received: by 2002:a17:906:4f86:b0:ad5:935:81db with SMTP id
 a640c23a62f3a-ad5093584e3mr109467866b.10.1747236476735; Wed, 14 May 2025
 08:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
 <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-5-6a143640a6cb@oss.qualcomm.com>
 <aCRkRTMFi65zBODh@sumit-X1>
In-Reply-To: <aCRkRTMFi65zBODh@sumit-X1>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 14 May 2025 17:27:44 +0200
X-Gm-Features: AX0GCFubE386IXxNi4n8B2NKhYEqMdnxy1eH-BueT9owSlm2f-luFbE7L4_yv50
Message-ID: <CACMJSev2qqnxLN6OiSEKhUqxeewY09to0Jd2oPNoE39YFS6i3A@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] firmware: qcom: scm: add support for object invocation
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Apurupa Pattapu <quic_apurupa@quicinc.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 11:37, Sumit Garg <sumit.garg@kernel.org> wrote:
>
> Hi Amir,
>
> I am still unable to get the QCOMTEE driver to work on db845c. As I can
> see machine: "qcom,sdm845" is not supported for tzmem based on SHM
> brigde here: drivers/firmware/qcom/qcom_tzmem.c +81. I am still seeing
> following logs from userspace:
>
> # /mnt/unittest -d
> [test_print_diagnostics_info][31] test_get_client_env_object.
> [test_supplicant_release][65] test_supplicant_worker killed.
>
> I think you should first check here for SHM bridge support. If available
> then only add a QTEE platform device.
>

On platforms not supporting SHM Bridge, the module should fall back to
non-SHM mode. Isn't it the case?

Bart

