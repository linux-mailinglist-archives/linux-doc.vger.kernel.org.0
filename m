Return-Path: <linux-doc+bounces-12058-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C11D887A3A6
	for <lists+linux-doc@lfdr.de>; Wed, 13 Mar 2024 08:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E49941C2189C
	for <lists+linux-doc@lfdr.de>; Wed, 13 Mar 2024 07:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2577E171CE;
	Wed, 13 Mar 2024 07:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GdnaITHH"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C791171BA
	for <linux-doc@vger.kernel.org>; Wed, 13 Mar 2024 07:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710315576; cv=none; b=Qr5emN9cTrAN1flM2CO+jX82qWUaAA2MetEc439Vs9OgZjW5aGfUiumV+Gv8AZBt1TVxCXj5LYq62K1ZkiR1iUCeqz9PbKaDzQnXqX/VQIDSjn5Q8ar2cgqGarSpQMpipW/HIoDl/caYBLuDc86Re2ml+jDpX0ha4IdVut7lMmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710315576; c=relaxed/simple;
	bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kg1CT5xFYamhuNrGf+vdUpecgHEcgTiZ7K9NfxsoJKOgGaGWS5yK++mj9iZ98jERugx11QUc2A1h6UC3rhAR/8SzFxz7apvkHXd7utRYCgwYLXUNwSCcV4Z/4Qf6sNX+9LFfeLcVrApNLHcyFArIV65J+MeK/+wT8rZe1w9ym+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GdnaITHH; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a4663b29334so1398366b.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Mar 2024 00:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710315572; x=1710920372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
        b=GdnaITHHnDyTc59DrnY/aK1qBmW4s8v+1Wlo7OaXKXq57D0uGr0gsQX/ItX/BACBPM
         mCpMOjziUb+3Mn5COgkXtUpoeoLEcXZCGTpgGjzVyLc+VMKae2PiFkxwSu99rRhGu5PL
         h0DwhApPO9cJtQFK8IR03dSWBM+quu8+QvheMmkAeD9cyenRXDT5FzO/WA+ETkmUxyZa
         SN1VD6WkfLXCEc+IYf4zf/JHE0Wo1vDZsy4xcu7u+lDW5Wu0D+wy0+1TtlvzrncNvHlr
         tpridwRMpXbbySaNM/TBwn2tAXOaruwSht9ctgRneZZUslHQzUPXkKVV6MMDE1ceGHf3
         4nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710315572; x=1710920372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
        b=HvKva2T7WsjQcg5aGCYIZHrhxFGLStcLEs7wM15Wa+wFvA5xJwrpyVdZJqPkNsGcC8
         sZWG/sDT6+1z5xrNM+FdFYI2YuoldqcDFW79oOaTvZCHPlwZqU8Dhb+WIPrO6wfCIM1X
         22ihmvdi37rSFj8q7KXQFJ80QnotNYK8fGU/ZQuzjbFUii/6loI85+BCRkGszaq1Iqoa
         Ww/vg4ZPu2Owfv4fSveOrTm3KdYnZcVGuB7Jwni89NUlho3a52oaByE643Sl8FAoTc21
         9txmrGzM0Cz7q6CUv8PgXKe5Wb4Et4qJCPtn8XFohU7Occ88REbcpn/f7YyTHk0+i/Px
         mAJw==
X-Forwarded-Encrypted: i=1; AJvYcCV2eN3RCEhC5cGNAwyumymBvP7DBpay8a4LJeuYuR6sZRzqHVgQ0ZuucNNa5szK9qC2TrMgMR3BjFoWgrFZZWwBHptlhvmB/nT5
X-Gm-Message-State: AOJu0Yxjy7G8JfGEvlf4XGQ60dIiG516SD2zVL9jPscJt+0ArpKTXayH
	mqf69PVb/hjKvvSIGJyRJphItCrlOcyc88xvP6aXk1jVAGNVoW9z7RBBspBZFeM=
X-Google-Smtp-Source: AGHT+IH38GneADkyKtRbEkb8+HLK5ZsZNpyhD22lE4uk6eUmiwmdHa00scLatPQEFNYx/T2Y2VkSUg==
X-Received: by 2002:a17:906:2ccb:b0:a41:3e39:b918 with SMTP id r11-20020a1709062ccb00b00a413e39b918mr7484516ejr.24.1710315572226;
        Wed, 13 Mar 2024 00:39:32 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qx26-20020a170906fcda00b00a45a687b52asm4578781ejb.213.2024.03.13.00.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 00:39:31 -0700 (PDT)
Date: Wed, 13 Mar 2024 10:39:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
	netdev@lists.linux.dev
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
Message-ID: <43ef4ef4-303b-45c6-aa50-3e0982c93bd7@moroto.mountain>
References: <20240312170309.2546362-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>

Thanks!

Acked-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


