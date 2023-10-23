Return-Path: <linux-doc+bounces-794-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDB37D2980
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 06:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67691B20CA8
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 04:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134F84C67;
	Mon, 23 Oct 2023 04:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWu1dSCX"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51FD2914
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 04:54:03 +0000 (UTC)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D15AE8;
	Sun, 22 Oct 2023 21:54:02 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-27e1eea2f0dso1244609a91.1;
        Sun, 22 Oct 2023 21:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698036842; x=1698641642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mFb+Ar0GcO5xQuWTfgdau5HGbQ+ui9RngdB/9LQgP9M=;
        b=AWu1dSCXNGOz2Y52eORdEitnVD055ZirExbzla7Nrak9viSi9ybXktYegSRl8aONBV
         TSuZwapWkHZB6ozG7gt00QxF6CZgyEPjm00jrazNkEmEjrY1tni/hfZl1AtShfSXfUHT
         cALl6LNN4mskFcq6pA+tcBqycw7YKMUArtA3oENv2z2UStfStVXuGuK+EufO3MvsKLdd
         UiKLdPgivrsm/LbPXIEvLujXxqIIfTKCAkQ6GDttkPw5ON5uT9Jp8cSJ556T/ZpIBKQN
         gTIZp0KkA+PiCKtZdnwFs1G09z4VUH17E1MEKSwLd2Z+lV22F8qSr6k0szYLgXmJ8SS+
         AUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698036842; x=1698641642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFb+Ar0GcO5xQuWTfgdau5HGbQ+ui9RngdB/9LQgP9M=;
        b=ScRwCI/vuG00ixUpgX5EQAIoKbG8+3QHAShdwekadLueyWjDgWn7BOciB+JkVb+YMJ
         kBFYzhluI7kW8oaT3Imo/mBR7gmPfb1mFULXTONCCXQ5c+Yz0ElMCRMyoOpiKsrvhCD/
         2s+0BGNe4mGgPmoy4MOFsDia57lac6VYawguw/9IW0x62mmqMEooCAwDxIsoxkHFU7e9
         Hh6h2HutBf6Pa/ol5nhitgnl4nAu56JZfeP4rhT4Ywcwi2CmJfNvVXgeCKsPDuwCwe7H
         DhThm/XmulEwN6O9RfjYVMMC/7Ed/YeIchI3dw2UFwqYgA81v+VPTfrR7xipSgyZzeff
         Rexw==
X-Gm-Message-State: AOJu0Yz9iM8xmrdJNlPjAK3s8Qa8KS8FVSy94qyyLsjqBFKNVFA+25FP
	f2xf57QWa26Na+wEmtQ/uuo=
X-Google-Smtp-Source: AGHT+IHwFwAEKGMqvCGzNHLFpPCCWPKpfB28wRRs6BA6fMnALzkwSmlTmQomrA/+J4WTH+/GeD+b6Q==
X-Received: by 2002:a17:90a:1918:b0:27d:2371:9f74 with SMTP id 24-20020a17090a191800b0027d23719f74mr6041245pjg.0.1698036841736;
        Sun, 22 Oct 2023 21:54:01 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id pw4-20020a17090b278400b0026f4bb8b2casm6798844pjb.6.2023.10.22.21.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 21:54:01 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 48E76937521F; Mon, 23 Oct 2023 11:53:57 +0700 (WIB)
Date: Mon, 23 Oct 2023 11:53:56 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Vegard Nossum <vegard.nossum@oracle.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>, Leo Yan <leo.yan@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>, linux-next@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] Documentation: coresight: fix `make refcheckdocs` warning
Message-ID: <ZTX8ZPY3NQE_5cGX@debian.me>
References: <20231022185806.919434-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="evayvaUGlLi0LV8Z"
Content-Disposition: inline
In-Reply-To: <20231022185806.919434-1-vegard.nossum@oracle.com>


--evayvaUGlLi0LV8Z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 22, 2023 at 08:58:06PM +0200, Vegard Nossum wrote:
> -See Documentation/devicetree/bindings/arm/arm,coresight-\*.yaml for deta=
ils.
> +See ``Documentation/devicetree/bindings/arm/arm,coresight-*.yaml`` for d=
etails.

Oh, I should have inlined that path when I fixed the original warning. Anyw=
ay,

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--evayvaUGlLi0LV8Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZTX8YAAKCRD2uYlJVVFO
owAGAQDq0UqUHK2blzaxbHy8g9mmvLl4ouKjvmjPsvi8Kkv/igEA4WjVvIxUbT6f
zN9AJJDKc7MN9vPOz+twls/Do2dyQwo=
=Jd0O
-----END PGP SIGNATURE-----

--evayvaUGlLi0LV8Z--

