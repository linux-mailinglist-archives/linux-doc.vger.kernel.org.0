Return-Path: <linux-doc+bounces-41840-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDE8A744AA
	for <lists+linux-doc@lfdr.de>; Fri, 28 Mar 2025 08:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FA3A17C30D
	for <lists+linux-doc@lfdr.de>; Fri, 28 Mar 2025 07:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B6E212B29;
	Fri, 28 Mar 2025 07:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yoQpUS5G"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8AE2116F4
	for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 07:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743147948; cv=none; b=Oxkg0EpOEs/JP0Zshtcbsp67ZYRfpFcd3DnCES+qqKSF17vrBoGVC9JckOvMofQge14HLT6Tvhaiv8qFfSueH1z/Vki1G6cm57v0+1fNicImBQkrg96C8qHHFE+iSUtJtDLROC3htaRejQ1N/C1U3ABjX044bNfY58QUBBOmXyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743147948; c=relaxed/simple;
	bh=jhd8eqeLqKtgOMegJHXn9/RBH+p95nA916u23Bs1/xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EcSQcJUlH2eIIMJN2YKcDYPMdaRiDJUvJKuqpDc8c2mcdJufIxft21Zgm1jxToaldH1IVBy5K5NlmFz/9txiL24SQjdmgQQO7bbI9eImV8qc5324iCb0NAIElVQNDEjfZ/nw97II/dsJNk5QBq5ujzG0tABaai9Kxtw9s+rDKQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yoQpUS5G; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224171d6826so47857515ad.3
        for <linux-doc@vger.kernel.org>; Fri, 28 Mar 2025 00:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743147946; x=1743752746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cju4PP3BDwNUuGXUxlhnczSfO2O+sRFjPqYxZUsY/Fs=;
        b=yoQpUS5G1WczIvAr6LZUddcvjI2Ojd88Y/vPHrUHg4KODVEnxp4CDjPh5nN/C5lkl6
         4KHSVb6atT653sH9Vet0J5t6AW/HzeLjLJdE+EBhMzxU/DdQ2q9B72iULBdgU51ZTzjF
         MjnZu25rtaYV6ksKxvNcHC4jtyHZ09IJjwk+gEnK60g7mTOvzYvw+DoJV9Mo7RwQQFnM
         GqjPR78lvbPD3S3bAMjUM2cfq4Ibap6ZQMqXPLc1V9swCmoZHXprFEhUKL94KXY/7Qgm
         EKQL6G4LXXkl5lbhnEJGzxH6eRGeFTlWNUiBp+4yHOTz9ZsS05wU4lN7dzTbXJ1M40+3
         RUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147946; x=1743752746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cju4PP3BDwNUuGXUxlhnczSfO2O+sRFjPqYxZUsY/Fs=;
        b=M3W2xvAaXsVs7E0Uzy0IRlqxaywEItDKPlV9BazAWpf/lMpDsmv7p0FkKQWl/4mmsr
         6QyhMdbx/l71gfk9iNHJc0zjn4hmbipgMg2B3blUMUDlNnauAJLmAtLQusiq8ohJv4XG
         Z/ffaZr2zBJSxejMcT1Lm0iX/DGXXZoJJcZwsv/KkAcjko6geWkNbjADCcP5TATzogJ0
         pe5SGPN4xEpkKJeGHxXy/k8w4sS/fgRbHu64hYHQx15x4S5ckU1EymLf3wf0ZjxJjvVf
         mhdxcdWAT289/3U/+e2pOs8Ffh66SUjpxcULIHiMPaviRTd9AHqkp281OAqjJ0DHLT4y
         YQ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRvl3kVVhckgktTsUnnLpasXqe/slwHKJvtF7Qw+lqpLj0e7gASgJ1dLYVUkLAsHDNGsaVQNw1h+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGemAd5eUTfoa6WWcLrUTK58tmmwHa6UxKeKHwdyOGzGMT2dHF
	7iLix+ogCjbSkcKlrC5sjUWQbwvri6hhpx9mz7sNH8j/PCnK9H/TLPEewWcDgTdJgu6pwTqv+ao
	EKS4Y400NsCb0qhj70xLR6DZwSI21S4uNhxJI
X-Gm-Gg: ASbGncvN9uUlkAiDLaxy9BnijckiWuX2iBVWGCVRe+Z8pxA28+xjBVUhFB0TO9bxuZH
	q7I84mnkLCNMaxOhF63L5wf8chMtgHHAnxXPdyBz1ZDZJMUaZkC/M1soFs9i9yEJ4lriI13nIZo
	PLeQNNEe1R8xFiLSobbfkfdYVHJ1Bhq0iFH1zNjpz4A0F5IY/r4dIOW80C
X-Google-Smtp-Source: AGHT+IHOrcw9DisHzvvGCzWpEdMq/2DuAlul4EC/64JuosmYAwms2YN5mduIbPIPWnfzDcFKN8g6PnqvAgOWYqzB4tA=
X-Received: by 2002:a17:903:41d2:b0:21f:7e12:5642 with SMTP id
 d9443c01a7336-22804855243mr78114555ad.18.1743147945996; Fri, 28 Mar 2025
 00:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com> <20250319005141.312805-5-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-5-quic_wcheng@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Fri, 28 Mar 2025 15:44:00 +0800
X-Gm-Features: AQ5f1JrxKR_5At3wbtVqdesBrs5EjD2B83PPzVhOxlnkDOQEImF4VUCzY3fgoP4
Message-ID: <CAGCq0LYNn6VZwKpvvf=N2ra8ZJcSso80ZDpirByHO9ChBZv3eg@mail.gmail.com>
Subject: Re: [PATCH v36 04/31] usb: host: xhci-plat: Set XHCI max interrupters
 if property is present
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net, 
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org, 
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com, 
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 8:54=E2=80=AFAM Wesley Cheng <quic_wcheng@quicinc.c=
om> wrote:
>
> Some platforms may want to limit the number of XHCI interrupters allocate=
d.
> This is passed to xhci-plat as a device property.  Ensure that this is re=
ad
> and the max_interrupters field is set.
>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Tested-by: Puma Hsu <pumahsu@google.com>

> ---
>  drivers/usb/host/xhci-plat.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 3155e3a842da..6dab142e7278 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -267,6 +267,8 @@ int xhci_plat_probe(struct platform_device *pdev, str=
uct device *sysdev, const s
>
>                 device_property_read_u32(tmpdev, "imod-interval-ns",
>                                          &xhci->imod_interval);
> +               device_property_read_u16(tmpdev, "num-hc-interrupters",
> +                                        &xhci->max_interrupters);
>         }
>
>         /*
>

